
module Ruby
  class GL
    module OpenGL
      module Evaluators
        include Ruby::GL::OpenGL::Types
        extend FFI::Library
        ffi_lib 'GL'

        # Evaluators
        attach_function :glMap1d,        [GLenum, GLdouble, GLdouble, GLint, GLint, :pointer], :void
        attach_function :glMap1f,        [GLenum, GLfloat, GLfloat, GLint, GLint, :pointer], :void
        attach_function :glMap2d,        [GLenum, GLdouble, GLdouble, GLint, GLint, GLdouble, GLdouble, GLint, GLint, :pointer], :void
        attach_function :glMap2f,        [GLenum, GLfloat, GLfloat, GLint, GLint, GLfloat, GLfloat, GLint, GLint, :pointer], :void
        attach_function :glGetMapdv,     [GLenum, GLenum, :pointer], :void
        attach_function :glGetMapfv,     [GLenum, GLenum, :pointer], :void
        attach_function :glGetMapiv,     [GLenum, GLenum, :pointer], :void
        attach_function :glEvalCoord1d,  [GLdouble], :void
        attach_function :glEvalCoord1f,  [GLfloat], :void
        attach_function :glEvalCoord1dv, [:pointer], :void
        attach_function :glEvalCoord1fv, [:pointer], :void
        attach_function :glEvalCoord2d,  [GLdouble, GLdouble], :void
        attach_function :glEvalCoord2f,  [GLfloat, GLfloat], :void
        attach_function :glEvalCoord2dv, [:pointer], :void
        attach_function :glEvalCoord2fv, [:pointer], :void
        attach_function :glMapGrid1d,    [GLint, GLdouble, GLdouble], :void
        attach_function :glMapGrid1f,    [GLint, GLfloat, GLfloat], :void
        attach_function :glMapGrid2d,    [GLint, GLdouble, GLdouble, GLint, GLdouble, GLdouble], :void
        attach_function :glMapGrid2f,    [GLint, GLfloat, GLfloat, GLint, GLfloat, GLfloat], :void
        attach_function :glEvalPoint1,   [GLint], :void
        attach_function :glEvalPoint2,   [GLint, GLint], :void
        attach_function :glEvalMesh1,    [GLenum, GLint, GLint], :void
        attach_function :glEvalMesh2,    [GLenum, GLint, GLint, GLint, GLint], :void

      end
    end
  end
end