require './screen'
require './device'

d = Blinkofant::Device.new
s = Blinkofant::Screen.new

s.row(1, true)
d.flush(s)

while true do
  s.shift_rows
  d.flush(s)
  sleep(1)
end


require 'fcntl'
device = '/dev/input/js0'

fd = IO::sysopen(device, Fcntl::O_RDONLY)
f = IO.open(fd)

def input_byte(byte)
  puts "got #{byte}"
  case byte
  when 9045160
    puts "left"
  when 9045160
    puts "left"
  when 9045160
    puts "left"
  when 9045160
    puts "left"
  end
end

while true do
  puts "END BYTES"
  #input_byte(f.read(8).unpack("ccc").first)
end
