
module Ruby
  class GL
    module OpenGL
      module AccumulationBuffer
        include Ruby::GL::OpenGL::Types
        extend FFI::Library
        ffi_lib 'GL'

        # Accumulation Buffer
        attach_function :glClearAccum, [GLfloat, GLfloat, GLfloat, GLfloat], :void
        attach_function :glAccum,      [GLenum, GLfloat], :void

      end
    end
  end
end