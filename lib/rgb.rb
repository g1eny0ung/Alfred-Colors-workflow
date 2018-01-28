require_relative 'hex'

class RGB
  PATTERN = /^(rgb)?\s?\(?(\d{1,3})(-|,|\s|\|)*(\d{1,3})(-|,|\s|\|)*(\d{1,3})\)?$/i
  attr_reader :rgb
  attr_reader :hsl

  def initialize(input)
    @rgb_input = input
  end

  def to_hex
    if PATTERN =~ @rgb_input
      rgb = [
        Regexp.last_match(1),
        Regexp.last_match(2),
        Regexp.last_match(3),
        Regexp.last_match(4),
        Regexp.last_match(5),
        Regexp.last_match(6)
      ]
    end
    rgb_format = [rgb[1], rgb[3], rgb[5]].map { |x| d_to_h(x.to_i) }
    hex = '#' + rgb_format.reduce(&:+)
    @rgb = HEX.new(hex).to_rgb
    @hsl = HEX.new(hex).to_hsl
    hex
  end

  private def d_to_h(d)
    hex = d.to_s(16)
    hex.length == 1 ? '0' + hex : hex
  end
end
