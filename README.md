# IcoMoonRails

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/icomoon/rails`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'icomoon_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install icomoon_rails

## Usage

Step 1. Go to https://icomoon.io

Step 2. Click on **IcoMoon App**

Step 3. Select any icons you liked!

Step 4. Click **Generate Font**

Step 5. Click **Enable Quick Usage**

Step 6. Copy href value of link (example: https://i.icomoon.io/public/temp/fc457ef804/UntitledProject/style.css)

Step 7. Run on terminal

    $ bundle exec rails g icomoon_rails:update <link>

With example: ```bundle exec rails g icomoon_rails:update
https://i.icomoon.io/public/temp/fc457ef804/UntitledProject/style.css```

Step 8. Reference the stylesheet (put into `app/assets/icons.css`), e.g.

``` css
@import 'icons.css'
```

assuming the file, such as `application.css` is in the same directory.

### How to use icon in View

```
icon('moon')
# => <i class="icon-moon"></i>
```

```
icon('moon', class: 'strong')
# => <i class="icon-moon strong"></i>
```

```
icon('moon', 'MOON', id: 'moon-icon', class: 'strong')
# => <i id="moon-icon" class="icon-moon strong"></i> MOON
```

### How to config Prefix and Postfix class

    $ rails g icomoon_rails:install

You have set prefix and postfix class for IcoMoon in ```config/initializers/icomoon.rb``` file.


## Then restart your Web Server if it was previously running.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ThanhKhoaIT/icomoon-rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
