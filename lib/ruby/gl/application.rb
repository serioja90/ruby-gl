module Ruby
  class GL
    class Application
      include Gl
      include Glu
      include Glut
      include SDL::Events
      include Celluloid

      finalizer :quit
      trap_exit :exit

      attr_reader :title, :x, :y, :width, :height, :framerate, :clear_color

      def initialize(options = {})
        @title        = options[:title]        || "My 3D Application"
        @width        = options[:width]        || Ruby::GL::DEFAULT_WIDTH
        @height       = options[:height]       || Ruby::GL::DEFAULT_HEIGHT
        @framerate    = options[:framerate]    || Ruby::GL::DEFAULT_FRAMERATE
        @clear_color  = options[:clear_color]  || Ruby::GL::Color::BLACK
        @shade_model  = options[:shade_model]  || GL_SMOOTH
        @world_size   = options[:world_size]   || Ruby::GL::DEFAULT_WORLD_SIZE
        @fullscreen   = !!options[:fullscreen]
        @maximized    = !!options[:maximized]
        @x            = options[:x].to_i
        @y            = options[:y].to_i
        @window       = nil
        @active       = false

        every(1 / @framerate.to_f) { async.update }
      end

      def title=(new_title)
        @title = new_title.to_s
        
        SDL::WM.set_caption(@title, nil) if @active

        @title
      end

      def set_position(x, y)
        @x = x.to_i
        @y = y.to_i
        glutInitWindowPosition(@x, @y)
      end

      def resize(width, height)
        @width  = width.to_i
        @height = height.to_i
      end

      def run!
        return if @active
        @active  = true
        setup_sdl_screen

        glClearColor(@clear_color.r, @clear_color.g, @clear_color.b, @clear_color.a)
        glShadeModel(@shade_model)

        reshape(@width, @height)

        async.events_loop

        wait :termination
      end

      def setup_sdl_screen
        #screen_info = SDL::Screen.info

        SDL::GL.set_attribute(SDL::GL::RED_SIZE, 5)
        SDL::GL.set_attribute(SDL::GL::GREEN_SIZE, 5)
        SDL::GL.set_attribute(SDL::GL::BLUE_SIZE, 5)
        SDL::GL.set_attribute(SDL::GL::ALPHA_SIZE, 5)
        SDL::GL.set_attribute(SDL::GL::DEPTH_SIZE, 16)
        SDL::GL.set_attribute(SDL::GL::DOUBLEBUFFER, 1)
        SDL::GL.set_attribute(SDL::GL::CONTEXT_MAJOR_VERSION, 2)
        SDL::GL.set_attribute(SDL::GL::CONTEXT_MINOR_VERSION, 1)

        flags = SDL::WINDOW_OPENGL | SDL::WINDOW_SHOWN
        flags = ( flags | SDL::WINDOW_RESIZABLE )
        flags = ( flags | SDL::WINDOW_MAXIMIZED ) if @maximized
        flags = ( flags | SDL::WINDOW_FULLSCREEN ) if @fullscreen

        @window  = SDL::create_window(@title, @x, @y, @width, @height, flags)
        context  = SDL::GL::create_context(@window)
        SDL::GL::set_swap_interval(1)
      end

      def clear
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        glLoadIdentity()
      end

      def flip
        SDL::GL::swap_window(@window)
      end

      def update
      end

      def exit(actor = nil, reason = nil)
        quit
      end

      def quit
        signal :termination
        @active = false
      end

      private

      def events_loop
        event_pointer = SDL::Event.create_pointer
        while @active
          while SDL::poll_event(event_pointer) != 0
            event = SDL::Event.create_event(event_pointer)
            process_event(event)
          end
          sleep 0.01
        end
      end

      def reshape(width, height)
        @width  = width
        @height = height
        min = [width, height].min.to_f
        x_ratio = width.to_f / min
        y_ratio = height.to_f / min
        glViewport(0, 0, width, height)
        glMatrixMode(GL_PROJECTION)
        glLoadIdentity()
        glFrustum(-x_ratio, x_ratio, -y_ratio, y_ratio, 1, @world_size)
        glMatrixMode(GL_MODELVIEW);
      end

      def process_event(event)
        case event
        when WindowEvent
          reshape(event.data1, event.data2) if event.resized?
        when QuitEvent
          quit
        end
      end
    end
  end
end