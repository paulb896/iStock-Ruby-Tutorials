# PaulsCoolGem

iStock Tutorial 4 - Gems
Tracks user availability 

## Installation

Add this line to your application's Gemfile:

    gem 'pauls_cool_gem'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pauls_cool_gem

## Usage

myScheduler = PaulsCoolGem::UserAvailability.new('Paul')
startDate = DateTime.new(2012, 12, 21, 7)
endDate = DateTime.new(2012, 12, 21, 16)
# This will make user available from 7am to 4pm on December 21 2012
myScheduler.make_available(startDate, endDate)

# Access the users availability by:
schedule = myScheduler.availability

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
