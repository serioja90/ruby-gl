
module Ruby
  class GL
    module OpenGL
      module Fog
        include Ruby::GL::OpenGL::Types
        extend FFI::Library
        ffi_lib 'GL'

        # Fog
        attach_function :glFogf,  [GLenum, GLfloat], :void
        attach_function :glFogi,  [GLenum, GLint], :void
        attach_function :glFogfv, [GLenum, :pointer], :void
        attach_function :glFogiv, [GLenum, :pointer], :void

      end
    end
  end
end