
module Ruby
  class GL
    module Helper
      def screen_width
        glutGet(Ruby::GL::GLUT_SCREEN_WIDTH)
      end

      def screen_height
        glutGet(Ruby::GL::GLUT_SCREEN_HEIGHT)
      end
    end
  end
end