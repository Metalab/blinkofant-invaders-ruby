require 'fcntl'

module Blinkofant
  module Pong
    class Joystick
      def initialize(device = '/dev/input/js0')
        @device = device
      end

      def read
        @fd = IO::sysopen(@device, Fcntl::O_RDONLY)
        f = IO.open(@fd)

        while true do
          puts f.getc
        end

      end

      def input_byte(byte)
        case byte
        when 9045160
          puts "left"
        end
      end
    end
  end
end