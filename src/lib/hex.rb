class HEX
  SHORT_PATTERN = /^#?([a-f\d])([a-f\d])([a-f\d])$/i
  PATTERN = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i
  attr_reader :hex

  def initialize(input_hex)
    @hex = input_hex
  end

  def to_rgb
    if SHORT_PATTERN =~ @hex
      rgb = [Regexp.last_match(1),
             Regexp.last_match(2),
             Regexp.last_match(3)].map do |x|
        (x + x).to_i(16)
      end
    end

    if PATTERN =~ @hex
      rgb =
        [Regexp.last_match(1),
         Regexp.last_match(2),
         Regexp.last_match(3)].map do |x|
          x.to_i(16)
        end
    end

    rgb
  end

  def to_hsl
    r, g, b = to_rgb.map { |x| x / 255.0 }
    max = [r, g, b].max
    min = [r, g, b].min

    h = s = l = (max + min) / 2.0

    if max == min
      h = s = 0
    else
      d = max - min
      s = l > 0.5 ? d / (2 - max - min) : d / (max + min)
      case max
      when r
        h = (g - b) / d + (g < b ? 6 : 0)
      when g
        h = (b - r) / d + 2
      when b
        h = (r - g) / d + 4
      end
      h /= 6
    end
    [(h.round(2) * 360).to_i, (s.round(2) * 100).to_i, (l.round(2) * 100).to_i]
  end
end
