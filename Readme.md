# Guard::Resque

Guard::Resque automatically starts/stops/restarts resque workers

*forked from [Guard::Delayed](http://github.com/suranyami/guard-delayed)*

## Install

Please be sure to have [Guard](http://github.com/guard/guard) installed before continue.

Install the gem:

    gem install guard-resque-pool

Add it to your Gemfile (inside test group):

    gem 'guard-resque-pool'

Add guard definition to your Guardfile by running this command:

    guard init resque-pool

## Usage

Please read [Guard usage doc](http://github.com/guard/guard#readme).

I suggest you put the resque guard definition *before* your test/rspec guard if your tests depend on it
being active.

## Guardfile

    guard 'resque-pool', :environment => 'development' do
      watch(%r{^app/(.+)\.rb$})
      watch(%r{^lib/(.+)\.rb$})
    end

Feel free to be more specific, for example watching only for `app/models` and `app/jobs`
to avoid reloading on a javascript file change.

## Options

You can customize the resque task via the following options:

* `environment`: the rails environment to run the workers in (defaults to `nil`)
* `interval`: the interval to use for checking for new resque jobs (defaults to `5`)
* `stop_signal`: how to kill the process when restarting (defaults to `QUIT`)


## Development

 * Source hosted at [GitHub](http://github.com/Perpetto/guard-resque-pool)
 * Report issues/Questions/Feature requests on [GitHub Issues](http://github.com/Perpetto/guard-resque-pool/issues)

Pull requests are very welcome! Make sure your patches are well tested. Please create a topic branch for every separate change
you make.

## Testing the gem locally

    gem install guard-resque-pool-1.x.x.gem

## Building and deploying gem

 * Update the version number in `lib/guard/resque-pool/version.rb`
 * Update `CHANGELOG.md`
 * Build the gem:

    gem build guard-resque-pool.gemspec

 * Push to rubygems.org:

    gem push guard-resque-pool-1.x.x.gem


## Guard::Delayed Authors

[David Parry](https://github.com/suranyami)
[Dennis Reimann](https://github.com/dbloete)

Ideas for this gem came from [Guard::WEBrick](http://github.com/fnichol/guard-webrick).


## Guard::Resque Authors

[Jacques Crocker](https://github.com/railsjedi)

I hacked this together from the `guard-delayed` gem for use with Resque. All credit go to the original authors though. I just search/replaced and tweaked a few things
