
module Ruby
  class GL
    class Application
      include Gl
      include Glu
      include Glut
      include Celluloid

      attr_reader :title, :x, :y, :width, :height, :framerate, :clear_color

      def initialize(options = {})
        @title        = options[:title]        || "My 3D Application"
        @width        = options[:width]        || Ruby::GL::screen_width
        @height       = options[:height]       || Ruby::GL::screen_height
        @framerate    = options[:framerate]    || Ruby::GL::DEFAULT_FRAMERATE
        @display_mode = options[:display_mode] || (GLUT_DOUBLE | GLUT_RGBA)
        @clear_color  = options[:clear_color]  || Ruby::GL::Color::BLACK
        @shade_model  = options[:shade_model]  || GL_SMOOTH
        @fullscreen   = !!options[:fullscreen]
        @x            = options[:x].to_i
        @y            = options[:y].to_i
        @running      = false
        @timer        = Timers::Group.new

        @timer.every(1 / @framerate.to_f) { update }
      end

      def display_mode=(new_display_mode)
        @display_mode = new_display_mode
        glutInitDisplayMode(@display_mode)
      end

      def title=(new_title)
        @title = new_title.to_s
        glutSetWindowTitle(@title)

        @title
      end

      def framerate=(new_framerate)
        @framerate = new_framerate.to_i

        @timer.cancel
        @timer.every(1 / @framerate.to_f) { update }

        @framerate
      end

      def set_position(x, y)
        @x = x.to_i
        @y = y.to_i
        glutInitWindowPosition(@x, @y)
      end

      def resize(width, height)
        @width  = width.to_i
        @height = height.to_i
        glutInitWindowSize(@width, @height)
      end

      def run!
        return if @running
        @rinning = true
        glutInitDisplayMode(@display_mode)
        glutInitWindowPosition(@x, @y)
        glutInitWindowSize(@width, @height)
        glutCreateWindow(@title)
        glutFullScreen() if @fullscreen

        glClearColor(@clear_color.r, @clear_color.g, @clear_color.b, @clear_color.a)
        glShadeModel(@shade_model)

        glutReshapeFunc(self.method(:reshape))
        glutDisplayFunc(self.method(:update))
        glutKeyboardFunc(self.method(:keyboard))
        glutIdleFunc(self.method(:idle))

        async.start_main_loop

        while @active
          sleep 0.01
        end
      end

      def clear
        glClear(GL_COLOR_BUFFER_BIT)
        glLoadIdentity()
      end

      def swap_buffers
        glutSwapBuffers()
      end

      def flush
        glFlush()
      end

      def update
      end

      def quit
        glutLeaveMainLoop()
        @active = false
        self.terminate
      end

      private

      def reshape(width, height)
        glViewport(0, 0, width, height)
        glMatrixMode(GL_PROJECTION)
        glLoadIdentity()
        glFrustum(-1.0, 1.0, -1.0, 1.0, 1, 100)
        glMatrixMode(GL_MODELVIEW);
      end

      def keyboard(key, x, y)
      end

      def idle
        @timer.wait
      end

      def start_main_loop
        glutMainLoop()
      end
    end
  end
end