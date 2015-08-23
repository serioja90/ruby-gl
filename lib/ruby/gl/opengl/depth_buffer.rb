
module Ruby
  class GL
    module OpenGL
      module DepthBuffer
        include Ruby::GL::OpenGL::Types
        include Ruby::GL::OpenGL::Utils
        extend FFI::Library
        ffi_lib 'GL'

        # Depth Buffer
        attach_function :glClearDepth, [GLclampd], :void
        attach_function :glDepthFunc,  [GLenum], :void


        attach_function :_glDepthMask, :glDepthMask, [GLboolean], :void

        def glDepthMask(flag)
          _glDepthMask(to_glbool(flag))
        end


        attach_function :glDepthRange, [GLclampd, GLclampd], :void

      end
    end
  end
end