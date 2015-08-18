
module Ruby
  class GL
    module OpenGL
      module Transformation
        include Ruby::GL::OpenGL::Types
        extend FFI::Library
        ffi_lib 'GL'

        # Transformation
        attach_function :glMatrixMode,   [GLenum], :void
        attach_function :glOrtho,        [GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble], :void
        attach_function :glFrustum,      [GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble], :void
        attach_function :glViewport,     [GLint, GLint, GLsizei, GLsizei], :void
        attach_function :glPushMatrix,   [], :void
        attach_function :glPopMatrix,    [], :void
        attach_function :glLoadIdentity, [], :void
        attach_function :glLoadMatrixd,  [:pointer], :void
        attach_function :glLoadMatrixf,  [:pointer], :void
        attach_function :glMultMatrixd,  [:pointer], :void
        attach_function :glMultMatrixf,  [:pointer], :void
        attach_function :glRotated,      [GLdouble, GLdouble, GLdouble, GLdouble], :void
        attach_function :glRotatef,      [GLfloat, GLfloat, GLfloat, GLfloat], :void
        attach_function :glScaled,       [GLdouble, GLdouble, GLdouble], :void
        attach_function :glScalef,       [GLfloat, GLfloat, GLfloat], :void
        attach_function :glTranslated,   [GLdouble, GLdouble, GLdouble], :void
        attach_function :glTranslatef,   [GLfloat, GLfloat, GLfloat], :void

        # OpenGL 1.3
        attach_function :glLoadTransposeMatrixd, [:pointer], :void
        attach_function :glLoadTransposeMatrixf, [:pointer], :void
        attach_function :glMultTransposeMatrixd, [:pointer], :void
        attach_function :glMultTransposeMatrixf, [:pointer], :void
      end
    end
  end
end