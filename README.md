# GifCountdown

Create a animated gif countdown picture using RMagick.

Each frame is a second.

Useful for mailings campaign / event notifications.

![Example](https://raw.githubusercontent.com/zealot128/gif_countdown/main/doc/example.gif)

## Usage

```
blob = GifCountdown.generate(distance_in_seconds: distance_in_seconds, duration: 5)
```

Usage in a Rails controller:

```ruby
def show
  distance_in_seconds = (some_future_event - Time.zone.now).round

  blob = GifCountdown.generate(distance_in_seconds: distance_in_seconds, duration: 10)
  send_data blob, type: 'image/gif', disposition: 'inline'
end
```

Make sure to build a minute cache or something, as building that images might take a couple of seconds every time!

### Available Keyword Arguments:

With defaults

```
distance_in_seconds: nil #Number of seconds to countdown
width: 535
height: 61
fontsize: 30
padding_x: 10
duration: 60 # how many seconds to generate - linearily takes longer to generator
font: 'Ubuntu' # That font must be installed on the target host that generates the image!
```

### I18n

It uses "I18n" to build up the words "Days", "Hours", "Seconds", "Minutes" with plurarlization. The Gem ships with en/de.


## Installation
Add this line to your application's Gemfile:

```ruby
gem 'gif_countdown'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install gif_countdown
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
