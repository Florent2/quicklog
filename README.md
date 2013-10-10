# Quicklog

Provides an easy way to log a variable value with its label.

Instead of doing

    puts "my_var = #{my_var}"

write

    ql :my_var

For Ruby 2+ only.

## Additional features

* display output in reverse video, it's easier to see
* not limited to variable logging, can log anything that can be converted to a string

## Examples

* logging an object attribute: `ql :"@user.name"`
* logging a plain string: `ql "hello world!"`

## Installation

Add this line to your application's Gemfile:

    gem 'quicklog'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install quicklog

## Credits

I wanted the same kind of functionality that the [lll gem](http://rubygems.org/gems/lll) offers, but with a shorter syntax.

I found the solution I needed in this [stackoverflow answer](http://stackoverflow.com/a/1385047/117704).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## TODO

* use inspect to output the expression
* use Awesome Print if available
* allow logging of string + variable: `ql "hi!", :my_var`
* allow logging of several variables: `ql :my_var1, :my_var2, :my_var3`
* logs through Rails.logger if available
