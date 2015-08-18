
module Ruby
  class GL
    module OpenGL
      module DrawingFunctions
        include Ruby::GL::OpenGL::Types
        extend FFI::Library
        ffi_lib 'GL'

        # Drawing Functions
        attach_function :glBegin,        [GLenum], :void
        attach_function :glEnd,          [], :void
        attach_function :glVertex2d,     [GLdouble, GLdouble], :void
        attach_function :glVertex2f,     [GLfloat, GLfloat], :void
        attach_function :glVertex2i,     [GLint, GLint], :void
        attach_function :glVertex2s,     [GLshort, GLshort], :void
        attach_function :glVertex3d,     [GLdouble, GLdouble, GLdouble], :void
        attach_function :glVertex3f,     [GLfloat, GLfloat, GLfloat], :void
        attach_function :glVertex3i,     [GLint, GLint, GLint], :void
        attach_function :glVertex3s,     [GLshort, GLshort, GLshort], :void
        attach_function :glVertex4d,     [GLdouble, GLdouble, GLdouble, GLdouble], :void
        attach_function :glVertex4f,     [GLfloat, GLfloat, GLfloat, GLfloat], :void
        attach_function :glVertex4i,     [GLint, GLint, GLint, GLint], :void
        attach_function :glVertex4s,     [GLshort, GLshort, GLshort, GLshort], :void
        attach_function :glVertex2dv,    [:pointer], :void
        attach_function :glVertex2fv,    [:pointer], :void
        attach_function :glVertex2iv,    [:pointer], :void
        attach_function :glVertex2sv,    [:pointer], :void
        attach_function :glVertex3dv,    [:pointer], :void
        attach_function :glVertex3fv,    [:pointer], :void
        attach_function :glVertex3iv,    [:pointer], :void
        attach_function :glVertex3sv,    [:pointer], :void
        attach_function :glVertex4dv,    [:pointer], :void
        attach_function :glVertex4fv,    [:pointer], :void
        attach_function :glVertex4iv,    [:pointer], :void
        attach_function :glVertex4sv,    [:pointer], :void
        attach_function :glNormal3b,     [GLbyte, GLbyte, GLbyte], :void
        attach_function :glNormal3d,     [GLdouble, GLdouble, GLdouble], :void
        attach_function :glNormal3f,     [GLfloat, GLfloat, GLfloat], :void
        attach_function :glNormal3i,     [GLint, GLint, GLint], :void
        attach_function :glNormal3s,     [GLshort, GLshort, GLshort], :void
        attach_function :glNormal3bv,    [:pointer], :void
        attach_function :glNormal3dv,    [:pointer], :void
        attach_function :glNormal3fv,    [:pointer], :void
        attach_function :glNormal3iv,    [:pointer], :void
        attach_function :glNormal3sv,    [:pointer], :void
        attach_function :glIndexd,       [GLdouble], :void
        attach_function :glIndexf,       [GLfloat], :void
        attach_function :glIndexi,       [GLint], :void
        attach_function :glIndexs,       [GLshort], :void
        attach_function :glIndexub,      [GLubyte], :void
        attach_function :glIndexdv,      [:pointer], :void
        attach_function :glIndexfv,      [:pointer], :void
        attach_function :glIndexiv,      [:pointer], :void
        attach_function :glIndexsv,      [:pointer], :void
        attach_function :glIndexubv,     [:pointer], :void
        attach_function :glColor3b,      [GLbyte, GLbyte, GLbyte], :void
        attach_function :glColor3d,      [GLdouble, GLdouble, GLdouble], :void
        attach_function :glColor3f,      [GLfloat, GLfloat, GLfloat], :void
        attach_function :glColor3i,      [GLint, GLint, GLint], :void
        attach_function :glColor3s,      [GLshort, GLshort, GLshort], :void
        attach_function :glColor3ub,     [GLubyte, GLubyte, GLubyte], :void
        attach_function :glColor3ui,     [GLuint, GLuint, GLuint], :void
        attach_function :glColor3us,     [GLushort, GLushort, GLushort], :void
        attach_function :glColor4b,      [GLbyte, GLbyte, GLbyte, GLbyte], :void
        attach_function :glColor4d,      [GLdouble, GLdouble, GLdouble, GLdouble], :void
        attach_function :glColor4f,      [GLfloat, GLfloat, GLfloat, GLfloat], :void
        attach_function :glColor4i,      [GLint, GLint, GLint, GLint], :void
        attach_function :glColor4s,      [GLshort, GLshort, GLshort, GLshort], :void
        attach_function :glColor4ub,     [GLubyte, GLubyte, GLubyte, GLubyte], :void
        attach_function :glColor4ui,     [GLuint, GLuint, GLuint, GLuint], :void
        attach_function :glColor4us,     [GLushort, GLushort, GLushort, GLushort], :void
        attach_function :glColor3bv,     [:pointer], :void
        attach_function :glColor3dv,     [:pointer], :void
        attach_function :glColor3fv,     [:pointer], :void
        attach_function :glColor3iv,     [:pointer], :void
        attach_function :glColor3sv,     [:pointer], :void
        attach_function :glColor3ubv,    [:pointer], :void
        attach_function :glColor3uiv,    [:pointer], :void
        attach_function :glColor3usv,    [:pointer], :void
        attach_function :glColor4bv,     [:pointer], :void
        attach_function :glColor4dv,     [:pointer], :void
        attach_function :glColor4fv,     [:pointer], :void
        attach_function :glColor4iv,     [:pointer], :void
        attach_function :glColor4sv,     [:pointer], :void
        attach_function :glColor4ubv,    [:pointer], :void
        attach_function :glColor4uiv,    [:pointer], :void
        attach_function :glColor4usv,    [:pointer], :void
        attach_function :glTexCoord1d,   [GLdouble], :void
        attach_function :glTexCoord1f,   [GLfloat], :void
        attach_function :glTexCoord1i,   [GLint], :void
        attach_function :glTexCoord1s,   [GLshort], :void
        attach_function :glTexCoord2d,   [GLdouble, GLdouble], :void
        attach_function :glTexCoord2f,   [GLfloat, GLfloat], :void
        attach_function :glTexCoord2i,   [GLint, GLint], :void
        attach_function :glTexCoord2s,   [GLshort, GLshort], :void
        attach_function :glTexCoord3d,   [GLdouble, GLdouble, GLdouble], :void
        attach_function :glTexCoord3f,   [GLfloat, GLfloat, GLfloat], :void
        attach_function :glTexCoord3i,   [GLint, GLint, GLint], :void
        attach_function :glTexCoord3s,   [GLshort, GLshort, GLshort], :void
        attach_function :glTexCoord4d,   [GLdouble, GLdouble, GLdouble, GLdouble], :void
        attach_function :glTexCoord4f,   [GLfloat, GLfloat, GLfloat, GLfloat], :void
        attach_function :glTexCoord4i,   [GLint, GLint, GLint, GLint], :void
        attach_function :glTexCoord4s,   [GLshort, GLshort, GLshort, GLshort], :void
        attach_function :glTexCoord1dv,  [:pointer], :void
        attach_function :glTexCoord1fv,  [:pointer], :void
        attach_function :glTexCoord1iv,  [:pointer], :void
        attach_function :glTexCoord1sv,  [:pointer], :void
        attach_function :glTexCoord2dv,  [:pointer], :void
        attach_function :glTexCoord2fv,  [:pointer], :void
        attach_function :glTexCoord2iv,  [:pointer], :void
        attach_function :glTexCoord2sv,  [:pointer], :void
        attach_function :glTexCoord3dv,  [:pointer], :void
        attach_function :glTexCoord3fv,  [:pointer], :void
        attach_function :glTexCoord3iv,  [:pointer], :void
        attach_function :glTexCoord3sv,  [:pointer], :void
        attach_function :glTexCoord4dv,  [:pointer], :void
        attach_function :glTexCoord4fv,  [:pointer], :void
        attach_function :glTexCoord4iv,  [:pointer], :void
        attach_function :glTexCoord4sv,  [:pointer], :void
        attach_function :glRasterPos2d,  [GLdouble, GLdouble], :void
        attach_function :glRasterPos2f,  [GLfloat, GLfloat], :void
        attach_function :glRasterPos2i,  [GLint, GLint], :void
        attach_function :glRasterPos2s,  [GLshort, GLshort], :void
        attach_function :glRasterPos3d,  [GLdouble, GLdouble, GLdouble], :void
        attach_function :glRasterPos3f,  [GLfloat, GLfloat, GLfloat], :void
        attach_function :glRasterPos3i,  [GLint, GLint, GLint], :void
        attach_function :glRasterPos3s,  [GLshort, GLshort, GLshort], :void
        attach_function :glRasterPos4d,  [GLdouble, GLdouble, GLdouble, GLdouble], :void
        attach_function :glRasterPos4f,  [GLfloat, GLfloat, GLfloat, GLfloat], :void
        attach_function :glRasterPos4i,  [GLint, GLint, GLint, GLint], :void
        attach_function :glRasterPos4s,  [GLshort, GLshort, GLshort, GLshort], :void
        attach_function :glRasterPos2dv, [:pointer], :void
        attach_function :glRasterPos2fv, [:pointer], :void
        attach_function :glRasterPos2iv, [:pointer], :void
        attach_function :glRasterPos2sv, [:pointer], :void
        attach_function :glRasterPos3dv, [:pointer], :void
        attach_function :glRasterPos3fv, [:pointer], :void
        attach_function :glRasterPos3iv, [:pointer], :void
        attach_function :glRasterPos3sv, [:pointer], :void
        attach_function :glRasterPos4dv, [:pointer], :void
        attach_function :glRasterPos4fv, [:pointer], :void
        attach_function :glRasterPos4iv, [:pointer], :void
        attach_function :glRasterPos4sv, [:pointer], :void
        attach_function :glRectd,        [GLdouble, GLdouble, GLdouble, GLdouble], :void
        attach_function :glRectf,        [GLfloat, GLfloat, GLfloat, GLfloat], :void
        attach_function :glRecti,        [GLint, GLint, GLint, GLint], :void
        attach_function :glRects,        [GLshort, GLshort, GLshort, GLshort], :void
        attach_function :glRectdv,       [:pointer, :pointer], :void
        attach_function :glRectfv,       [:pointer, :pointer], :void
        attach_function :glRectiv,       [:pointer, :pointer], :void
        attach_function :glRectsv,       [:pointer, :pointer], :void
      end
    end
  end
end