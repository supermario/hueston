require 'lifx'
require 'color'

client = LIFX::Client.lan
client.discover! do |c|
  c.lights.with_label('Hour')
end

colours = ['f04950','f58d4e','f9a54b','fece3e','fff533','a3fd39','33b8a5','33a7d8','3276b5','8869ad','b868ad','e966ac']

light = client.lights.with_label('Hour')

colours.each do |hex|

  c = Color::RGB.by_hex(hex).to_hsl
  # p c.hue
  # p c.saturation
  # p c.lightness

  set = LIFX::Color.hsl(c.hue, c.saturation / 100, c.luminosity / 1300)
  light.set_color(set)

  sleep 2
end

client.flush
