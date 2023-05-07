# Alfred-Colors-workflow

[Download](https://github.com/g1eny0ung/Alfred-Colors-workflow/raw/master/dist/Colors.alfredworkflow)

Convert CSS colors between **hex, rgb, hsl** in Alfred.

The keyword is **`c`**, you can change it with your habit.

![demo](demo.gif)

## Pre-installation

```sh
brew install ruby
gem install chunky_png
```

## Formats

### keywords

Use keywords to represent colors, you can find all keywords in [CSS Color Module Level 4](https://www.w3.org/TR/css-color-4/#named-colors).

- black => #000
- darkblue => #00008b
- yellowgreen => #9acd32

### hex

Use hex to represent colors, you can use the following formats (`#` can be omitted):

- #ffffff
- ffffff
- #fff
- fff

### rgb

> Use rgb to represent colors, you can use the following formats (the `rgb()` wrapper can be omitted):

- rgb(255, 255, 255)
- rgb(255-255-255)
- rgb(255 255 255)
- rgb(255|255|255)

### hsl

> Use hsl to represent colors, you can use the following formats (the `hsl()` wrapper can be omitted):

- hsl(0, 0%, 100%)
- same as rgb

## Credits

<a href="https://www.flaticon.com/free-icons/color-picker" title="color picker icons">Color picker icons created by Freepik - Flaticon</a>
