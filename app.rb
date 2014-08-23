require 'lifx'
require 'color'

client = LIFX::Client.lan
client.discover! do |c|
  c.lights.with_label('Hour')
  c.lights.with_label('Minute')
end

colours = ['f04950','f58d4e','f9a54b','fece3e','fff533','a3fd39','33b8a5','33a7d8','3276b5','8869ad','b868ad','e966ac']

hour_colour = colours[Time.now.hour % 12]
minute_colour = colours[Time.now.minute / 5]

light_set_hex 'Hour' hour_colour
light_set_hex 'Minute' minute_colour

def light_set_hex light_name hex
  light = client.lights.with_label(light_name)
  c = Color::RGB.by_hex(hex).to_hsl
  set = LIFX::Color.hsl(c.hue, c.saturation / 100, c.luminosity / 1300)
  light.set_color(set)
end

client.flush
