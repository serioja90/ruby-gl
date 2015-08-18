
module Ruby
  class GL
    module OpenGL
      module Stenciling
        include Ruby::GL::OpenGL::Types
        extend FFI::Library
        ffi_lib 'GL'

        # Stenciling
        attach_function :glStencilFunc,  [GLenum, GLint, GLuint], :void
        attach_function :glStencilMask,  [GLuint], :void
        attach_function :glStencilOp,    [GLenum, GLenum, GLenum], :void
        attach_function :glClearStencil, [GLint], :void

      end
    end
  end
end