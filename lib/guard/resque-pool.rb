require 'guard/compat/plugin'
require 'timeout'

module Guard
  class ResquePool < Plugin

    DEFAULT_SIGNAL = :QUIT
    DEFAULT_TASK = 'resque:pool'.freeze

    # Allowable options are:
    #  - :environment  e.g. 'test'
    #  - :interval e.g. 5
    #  - :stop_signal e.g. :QUIT or :SIGQUIT
    def initialize(options = {})
      super
      @options = options
      @pid = nil
      @stop_signal = options[:stop_signal] || DEFAULT_SIGNAL
    end

    def start
      stop
      UI.info 'Starting up resque...'
      UI.info [ cmd, env.map{|v| v.join('=')} ].join(' ')

      # launch Resque worker
      @pid = spawn(env, cmd)
    end

    def stop
      if @pid
        UI.info 'Stopping resque-pool...'
        ::Process.kill @stop_signal, @pid
        begin
          Timeout.timeout(15) do
            ::Process.wait @pid
          end
        rescue Timeout::Error
          UI.info 'Sending SIGKILL to resque-pool, as it\'s taking too long to shutdown.'
          ::Process.kill :KILL, @pid
          ::Process.wait @pid
        end
        UI.info 'Stopped process resque-pool'
      end
    rescue Errno::ESRCH
      UI.info 'Guard::ResquePool lost the Resque pool subprocess!'
    ensure
      @pid = nil
    end

    # Called on Ctrl-Z signal
    def reload
      UI.info 'Restarting resque-pool...'
      restart
    end

    # Called on Ctrl-/ signal
    def run_all
      true
    end

    # Called on file(s) modifications
    def run_on_changes(paths)
      restart
    end

    def restart
      stop
      start
    end

    private

    def cmd
      command = ['bundle exec rake', DEFAULT_TASK.to_s]

      return command.join(' ')
    end

    def env
      var = Hash.new

      var['INTERVAL']  = @options[:interval].to_s    if @options[:interval]
      var['RAILS_ENV'] = @options[:environment].to_s if @options[:environment]

      return var
    end
  end
end
