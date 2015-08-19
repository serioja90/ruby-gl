
module Ruby
  class GL
    module OpenGL
      module DepthBuffer
        include Ruby::GL::OpenGL::Types
        extend FFI::Library
        ffi_lib 'GL'

        # Depth Buffer
        attach_function :glClearDepth, [GLclampd], :void
        attach_function :glDepthFunc,  [GLenum], :void


        attach_function :_glDepthMask, :glDepthMask, [GLboolean], :void

        def glDepthMask(flag)
          _glDepthMask(flag ? GL_TRUE : GL_FALSE)
        end


        attach_function :glDepthRange, [GLclampd, GLclampd], :void

      end
    end
  end
end