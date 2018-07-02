# JSend

JSend facilitates a simple jsend implementation for ruby. You can generate and parse JSend messages

For more info about JSend refer to https://labs.omniti.com/labs/jsend

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jsend'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jsend

## Usage

You can generate sucess, error and failure messages:
```ruby
JSend.success(banana: 'gross michel').to_json
```
This will generate the following string:
```
"{\"status\":\"success\",\"data\":{\"hola\":\"caracola\"}}"
```
Corresponding to this JSon:
```
{
  "status":"success",
  "data": {"banana":"gross michel"}
}
```

It works the same way with failure messages:
```ruby
JSend.fail(data)
```

And error messages, with or withouth error code and data
```ruby
jsend_message = JSend.error(error_message)
jsend_message = JSend.error(error_message, error_code, data)
```

Unlike other libraries, you can also parse JSon strings. It will raise an error if the string can't be parsed to a Jsend message:
```ruby
response = JSend.parse(last_response.body)
expect(response.success?).to eq(true)
puts response.data
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/amaceda/jsend-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

