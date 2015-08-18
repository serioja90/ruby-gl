require "singleton"
require "opengl"
require "glu"
require "glut"
require "celluloid/current"
require "thread_safe"
require "ruby/gl/version"
require "ruby/gl/constants"
require "ruby/gl/opengl"
require "ruby/gl/sdl"
require "ruby/gl/helper"
require "ruby/gl/color"
require "ruby/gl/event_queue"
require "ruby/gl/timer"
require "ruby/gl/application"

module Ruby
  class GL
    include Singleton
    include Gl
    include Glu
    include Glut
    include Helper

    def initialize
      # initialize the GLUT library
      glutInit()

      # initialize the SDL library
      SDL.init(SDL::INIT_EVERYTHING)
    end

    class << self
      def method_missing(name, *args, &block)
        instance.send name, *args, &block
      end
    end
  end
end

# Initialize Ruby::GL library in order to be sure
# to initialize also the GLUT library
Ruby::GL.instance