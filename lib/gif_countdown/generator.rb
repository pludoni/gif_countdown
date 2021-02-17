require 'rmagick'

class GifCountdown::Generator
  attr_reader :width, :height, :fontsize, :padding_x, :font

  def initialize(distance_in_seconds:, width: 535, height: 61, fontsize: 30, padding_x: 10, duration: 60, font: 'Ubuntu')
    @distance_in_seconds = distance_in_seconds
    @width = width
    @height = height
    @fontsize = fontsize
    @padding_x = padding_x
    @duration = duration
    @font = font
  end

  def call
    gif = Magick::ImageList.new
    gif.delay = 100
    gif.ticks_per_second = 100

    @duration.times do |i|
      image = Magick::Image.new(width, height)
      image.delay = 100
      annotate_with_countdown(image: image, seconds: @distance_in_seconds - i)
      gif << image
    end
    gif.to_blob { self.format = 'gif' }
  end

  def pluralize(count, key)
    I18n.t("gif_countdown.#{key}", count: count)
  end

  def annotate_with_countdown(image:, seconds:)
    this = self
    draw = Magick::Draw.new
    draw.gravity = Magick::NorthGravity
    boxwidth = (width - padding_x * 5) / 4.0

    parts = seconds_to_countdown(seconds)

    text_y = height / 2 + padding_x / 2
    x = padding_x
    image.annotate(draw, boxwidth, height / 2, x, 0, parts[:days]) {
      self.pointsize = this.fontsize
      self.font_family = this.font
    }
    image.annotate(draw, boxwidth, height / 2, x, text_y, pluralize(parts[:days], :days)) {
      self.pointsize = (this.fontsize * 0.7).round
      self.font_family = this.font
    }

    x = padding_x * 2 + boxwidth
    image.annotate(draw, boxwidth, height / 2, x, 0, parts[:hours]) {
      self.pointsize = this.fontsize
      self.font_family = this.font
    }
    image.annotate(draw, boxwidth, height / 2, x, text_y, pluralize(parts[:hours], :hours)) {
      self.pointsize = (this.fontsize * 0.7).round
      self.font_family = this.font
    }

    x = padding_x * 3 + boxwidth * 2
    image.annotate(draw, boxwidth, height / 2, x, 0, parts[:minutes]) {
      self.pointsize = this.fontsize
      self.font_family = this.font
    }
    image.annotate(draw, boxwidth, height / 2, x, text_y, pluralize(parts[:minutes], :minutes)) {
      self.pointsize = (this.fontsize * 0.7).round
      self.font_family = this.font
    }

    x = padding_x * 4 + boxwidth * 3
    image.annotate(draw, boxwidth, height / 2, x, 0, parts[:seconds]) {
      self.pointsize = this.fontsize
      self.font_family = this.font
    }
    image.annotate(draw, boxwidth, height / 2, x, text_y, pluralize(parts[:seconds], :seconds)) {
      self.pointsize = (this.fontsize * 0.7).round
      self.font_family = this.font
    }
  end

  def seconds_to_countdown(seconds)
    days = seconds / 1.day
    seconds -= days * 1.day.to_i

    hours = seconds / 1.hour
    seconds -= hours * 1.hour.to_i

    minutes = seconds / 1.minute
    seconds -= minutes * 1.minute.to_i

    {
      days: sprintf("%02d", days),
      hours: sprintf("%02d", hours),
      minutes: sprintf("%02d", minutes),
      seconds: sprintf("%02d", seconds)
    }
  end
end
