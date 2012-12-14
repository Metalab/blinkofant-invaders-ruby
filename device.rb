require 'fcntl'
require 'wiringpi'

module Blinkofant
  class Device
    SPI_IOC_WR_MAX_SPEED_HZ = 0x40046b04
    DARKEN_PIN = 22

    def initialize
      @device = '/dev/spidev0.0'
      @io = WiringPi::GPIO.new
      @io.mode(DARKEN_PIN,OUTPUT)
    end

    def flush(screen)
      @io.write(DARKEN_PIN,LOW)
      @io.read(DARKEN_PIN)
      @fd = IO::sysopen(@device, Fcntl::O_WRONLY)
      f = IO.open(@fd)
      f.sync = true
      f.ioctl(SPI_IOC_WR_MAX_SPEED_HZ, [100_000].pack("L"))
      f.write(screen.bit_stream.pack("C*"))
      f.close

      @io.write(DARKEN_PIN,HIGH)
      @io.read(DARKEN_PIN)
    end
  end
end
