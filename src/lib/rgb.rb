# frozen_string_literal: true

require_relative 'hex'

class RGB
  PATTERN = /^(rgba?)?\s?\(?(\d{1,3})(,|-|\s|\|)*(\d{1,3})(,|-|\s|\|)*(\d{1,3})(,|-|\s|\|)*([\d\.]*)\)?$/i.freeze
  attr_reader :rgb, :hsl

  def initialize(input)
    @rgb_input = input
  end

  def to_hex
    if PATTERN =~ @rgb_input
      rgb = [
        Regexp.last_match(2),
        Regexp.last_match(4),
        Regexp.last_match(6)
      ]
    end

    hex = '#' + rgb.map { |x| d_to_h(x.to_i) }.reduce(&:+)
    @rgb = rgb.map(&:to_i)
    @hsl = HEX.new(hex).to_hsl

    hex
  end

  private

  def d_to_h(d)
    hex = d.to_s(16)

    hex.length == 1 ? "0#{hex}" : hex
  end
end
