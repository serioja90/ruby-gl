
module Ruby
  class GL
    module OpenGL
      module Lighting
        include Ruby::GL::OpenGL::Types
        extend FFI::Library
        ffi_lib 'GL'

        # Lighting
        attach_function :glShadeModel,    [GLenum], :void
        attach_function :glLightf,        [GLenum, GLenum, GLfloat], :void
        attach_function :glLighti,        [GLenum, GLenum, GLint], :void
        attach_function :glLightfv,       [GLenum, GLenum, :pointer], :void
        attach_function :glLightiv,       [GLenum, GLenum, :pointer], :void
        attach_function :glGetLightfv,    [GLenum, GLenum, :pointer], :void
        attach_function :glGetLightiv,    [GLenum, GLenum, :pointer], :void
        attach_function :glLightModelf,   [GLenum, GLfloat], :void
        attach_function :glLightModeli,   [GLenum, GLint], :void
        attach_function :glLightModelfv,  [GLenum, :pointer], :void
        attach_function :glLightModeliv,  [GLenum, :pointer], :void
        attach_function :glMaterialf,     [GLenum, GLenum, GLfloat], :void
        attach_function :glMateriali,     [GLenum, GLenum, GLint], :void
        attach_function :glMaterialfv,    [GLenum, GLenum, :pointer], :void
        attach_function :glMaterialiv,    [GLenum, GLenum, :pointer], :void
        attach_function :glGetMaterialfv, [GLenum, GLenum, :pointer], :void
        attach_function :glGetMaterialiv, [GLenum, GLenum, :pointer], :void
        attach_function :glColorMaterial, [GLenum, GLenum], :void
      end
    end
  end
end