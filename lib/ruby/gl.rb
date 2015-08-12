require "singleton"
require "opengl"
require "glu"
require "glut"
require "ruby/gl/version"
require "ruby/gl/helper"

module Ruby
  class GL
    include Singleton
    include Gl
    include Glu
    include Glut
    include Helper

    def initialize
      glutInit()
    end

    class << self
      def method_missing(name, *args, &block)
        instance.send name, *args, &block
      end
    end
  end
end
