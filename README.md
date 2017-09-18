# ActiveJob::Disable

A rails plugin that disables Active job.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_job-disable'
```

And then execute:

    $ bundle

## Usage

Add this line to your application.rb:

```
config.active_job.queue_adapter = :disable
```

After that, `ActiveJob::Disable:DisabledError` is thrown if you call `perform_later` or `deliver_later`.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

