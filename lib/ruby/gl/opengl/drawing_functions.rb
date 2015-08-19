
module Ruby
  class GL
    module OpenGL
      module DrawingFunctions
        extend FFI::Library
        ffi_lib 'GL'

        include Ruby::GL::OpenGL::Utils
        include Ruby::GL::OpenGL::Types

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

        attach_function :_glVertex2dv, :glVertex2dv, [:pointer], :void
        def glVertex2dv(coords)
          _glVertex2dv(array_to_pointer(coords, GLdouble))
        end

        attach_function :_glVertex2fv, :glVertex2fv, [:pointer], :void
        def glVertex2fv(coords)
          _glVertex2fv(array_to_pointer(coords, GLfloat))
        end

        attach_function :_glVertex2iv, :glVertex2iv, [:pointer], :void
        def glVertex2iv(coords)
          _glVertex2iv(array_to_pointer(coords, GLint))
        end

        attach_function :_glVertex2sv, :glVertex2sv, [:pointer], :void
        def glVertex2sv(coords)
          _glVertex2sv(array_to_pointer(coords, GLshort))
        end

        attach_function :_glVertex3dv, :glVertex3dv, [:pointer], :void
        def glVertex3dv(coords)
          _glVertex3dv(array_to_pointer(coords, GLdouble))
        end

        attach_function :_glVertex3fv, :glVertex3fv, [:pointer], :void
        def glVertex3fv(coords)
          _glVertex3fv(array_to_pointer(coords, GLfloat))
        end

        attach_function :_glVertex3iv, :glVertex3iv, [:pointer], :void
        def glVertex3iv(coords)
          _glVertex3iv(array_to_pointer(coords, GLint))
        end

        attach_function :_glVertex3sv, :glVertex3sv, [:pointer], :void
        def glVertex3sv(coords)
          _glVertex3sv(array_to_pointer(coords, GLshort))
        end

        attach_function :_glVertex4dv, :glVertex4dv, [:pointer], :void
        def glVertex4dv(coords)
          _glVertex4dv(array_to_pointer(coords, GLdouble))
        end

        attach_function :_glVertex4fv, :glVertex4fv, [:pointer], :void
        def glVertex4fv(coords)
          _glVertex4fv(array_to_pointer(coords, GLfloat))
        end

        attach_function :_glVertex4iv, :glVertex4iv, [:pointer], :void
        def glVertex4iv(coords)
          _glVertex4iv(array_to_pointer(coords, GLint))
        end

        attach_function :_glVertex4sv, :glVertex4sv, [:pointer], :void
        def glVertex4sv(coords)
          _glVertex4sv(array_to_pointer(coords, GLshort))
        end

        attach_function :glNormal3b,     [GLbyte, GLbyte, GLbyte], :void
        attach_function :glNormal3d,     [GLdouble, GLdouble, GLdouble], :void
        attach_function :glNormal3f,     [GLfloat, GLfloat, GLfloat], :void
        attach_function :glNormal3i,     [GLint, GLint, GLint], :void
        attach_function :glNormal3s,     [GLshort, GLshort, GLshort], :void

        attach_function :_glNormal3bv, :glNormal3bv, [:pointer], :void
        def glNormal3bv(normals)
          _glNormal3bv(array_to_pointer(normals, GLbyte))
        end

        attach_function :_glNormal3dv, :glNormal3dv, [:pointer], :void
        def glNormal3dv(normals)
          _glNormal3dv(array_to_pointer(normals, GLdouble))
        end

        attach_function :_glNormal3fv, :glNormal3fv, [:pointer], :void
        def glNormal3fv(normals)
          _glNormal3fv(array_to_pointer(normals, GLfloat))
        end

        attach_function :_glNormal3iv, :glNormal3iv, [:pointer], :void
        def glNormal3iv(normals)
          _glNormal3iv(array_to_pointer(normals, GLint))
        end

        attach_function :_glNormal3sv, :glNormal3sv, [:pointer], :void
        def glNormal3sv(normals)
          _glNormal3sv(array_to_pointer(normals, GLshort))
        end

        attach_function :glIndexd,       [GLdouble], :void
        attach_function :glIndexf,       [GLfloat], :void
        attach_function :glIndexi,       [GLint], :void
        attach_function :glIndexs,       [GLshort], :void
        attach_function :glIndexub,      [GLubyte], :void

        attach_function :_glIndexdv, :glIndexdv, [:pointer], :void
        def glIndexdv(color_idx)
          _glIndexdv(array_to_pointer(color_idx, GLdouble))
        end

        attach_function :_glIndexfv, :glIndexfv, [:pointer], :void
        def glIndexfv(color_idx)
          _glIndexfv(array_to_pointer(color_idx, GLfloat))
        end

        attach_function :_glIndexiv, :glIndexiv, [:pointer], :void
        def glIndexiv(color_idx)
          _glIndexiv(array_to_pointer(color_idx, GLint))
        end

        attach_function :_glIndexsv, :glIndexsv, [:pointer], :void
        def glIndexsv(color_idx)
          _glIndexsv(array_to_pointer(color_idx, GLshort))
        end

        attach_function :_glIndexubv, :glIndexubv, [:pointer], :void
        def glIndexubv(color_idx)
          _glIndexubv(array_to_pointer(color_idx, GLbyte))
        end

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

        attach_function :_glColor3bv, :glColor3bv, [:pointer], :void
        def glColor3bv(color)
          _glColor3bv(array_to_pointer(color, GLbyte))
        end

        attach_function :_glColor3dv, :glColor3dv, [:pointer], :void
        def glColor3dv(color)
          _glColor3dv(array_to_pointer(color, GLdouble))
        end

        attach_function :_glColor3fv, :glColor3fv, [:pointer], :void
        def glColor3fv(color)
          _glColor3fv(array_to_pointer(color, GLfloat))
        end

        attach_function :_glColor3iv, :glColor3iv, [:pointer], :void
        def glColor3iv(color)
          _glColor3iv(array_to_pointer(color, GLint))
        end

        attach_function :_glColor3sv, :glColor3sv, [:pointer], :void
        def glColor3sv(color)
          _glColor3sv(array_to_pointer(color, GLshort))
        end

        attach_function :_glColor3ubv, :glColor3ubv, [:pointer], :void
        def glColor3ubv(color)
          _glColor3ubv(array_to_pointer(color, GLubyte))
        end

        attach_function :_glColor3uiv, :glColor3uiv, [:pointer], :void
        def glColor3uiv(color)
          _glColor3uiv(array_to_pointer(color, GLuint))
        end

        attach_function :_glColor3usv, :glColor3usv, [:pointer], :void
        def glColor3usv(color)
          _glColor3usv(array_to_pointer(color, GLushort))
        end

        attach_function :_glColor4bv, :glColor4bv, [:pointer], :void
        def glColor4bv(color)
          _glColor4bv(array_to_pointer(color, GLbyte))
        end

        attach_function :_glColor4dv, :glColor4dv, [:pointer], :void
        def glColor4dv(color)
          _glColor4dv(array_to_pointer(color, GLdouble))
        end

        attach_function :_glColor4fv, :glColor4fv, [:pointer], :void
        def glColor4fv(color)
          _glColor4fv(array_to_pointer(color, GLfloat))
        end

        attach_function :_glColor4iv, :glColor4iv, [:pointer], :void
        def glColor4iv(color)
          _glColor4iv(array_to_pointer(color, GLint))
        end

        attach_function :_glColor4sv, :glColor4sv, [:pointer], :void
        def glColor4sv(color)
          _glColor4sv(array_to_pointer(color, GLshort))
        end

        attach_function :_glColor4ubv, :glColor4ubv, [:pointer], :void
        def glColor4ubv(color)
          _glColor4ubv(array_to_pointer(color, GLubyte))
        end

        attach_function :_glColor4uiv, :glColor4uiv, [:pointer], :void
        def glColor4uiv(color)
          _glColor4uiv(array_to_pointer(color, GLuint))
        end

        attach_function :_glColor4usv, :glColor4usv, [:pointer], :void
        def glColor4usv(color)
          _glColor4usv(array_to_pointer(color, GLushort))
        end

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

        attach_function :_glTexCoord1dv, :glTexCoord1dv, [:pointer], :void
        def glTexCoord1dv(coords)
          _glTexCoord1dv(array_to_pointer(coords, GLdouble))
        end

        attach_function :_glTexCoord1fv, :glTexCoord1fv, [:pointer], :void
        def glTexCoord1fv(coords)
          _glTexCoord1fv(array_to_pointer(coords, GLfloat))
        end

        attach_function :_glTexCoord1iv, :glTexCoord1iv, [:pointer], :void
        def glTexCoord1iv(coords)
          _glTexCoord1iv(array_to_pointer(coords, GLint))
        end

        attach_function :_glTexCoord1sv, :glTexCoord1sv, [:pointer], :void
        def glTexCoord1sv(coords)
          _glTexCoord1sv(array_to_pointer(coords, GLshort))
        end

        attach_function :_glTexCoord2dv, :glTexCoord2dv, [:pointer], :void
        def glTexCoord2dv(coords)
          _glTexCoord2dv(array_to_pointer(coords, GLdouble))
        end

        attach_function :_glTexCoord2fv, :glTexCoord2fv, [:pointer], :void
        def glTexCoord2fv(coords)
          _glTexCoord2fv(array_to_pointer(coords, GLfloat))
        end

        attach_function :_glTexCoord2iv, :glTexCoord2iv, [:pointer], :void
        def glTexCoord2iv(coords)
          _glTexCoord2iv(array_to_pointer(coords, GLint))
        end

        attach_function :_glTexCoord2sv, :glTexCoord2sv, [:pointer], :void
        def glTexCoord2sv(coords)
          _glTexCoord2sv(array_to_pointer(coords, GLshort))
        end

        attach_function :_glTexCoord3dv, :glTexCoord3dv, [:pointer], :void
        def glTexCoord3dv(coords)
          _glTexCoord3dv(array_to_pointer(coords, GLdouble))
        end

        attach_function :_glTexCoord3fv, :glTexCoord3fv, [:pointer], :void
        def glTexCoord3fv(coords)
          _glTexCoord3fv(array_to_pointer(coords, GLfloat))
        end

        attach_function :_glTexCoord3iv, :glTexCoord3iv, [:pointer], :void
        def glTexCoord3iv(coords)
          _glTexCoord3iv(array_to_pointer(coords, GLint))
        end

        attach_function :_glTexCoord3sv, :glTexCoord3sv, [:pointer], :void
        def glTexCoord3sv(coords)
          _glTexCoord3sv(array_to_pointer(coords, GLshort))
        end

        attach_function :_glTexCoord4dv, :glTexCoord4dv, [:pointer], :void
        def glTexCoord4dv(coords)
          _glTexCoord4dv(array_to_pointer(coords, GLdouble))
        end

        attach_function :_glTexCoord4fv, :glTexCoord4fv, [:pointer], :void
        def glTexCoord4fv(coords)
          _glTexCoord4fv(array_to_pointer(coords, GLfloat))
        end

        attach_function :_glTexCoord4iv, :glTexCoord4iv, [:pointer], :void
        def glTexCoord4iv(coords)
          _glTexCoord4iv(array_to_pointer(coords, GLint))
        end

        attach_function :_glTexCoord4sv, :glTexCoord4sv, [:pointer], :void
        def glTexCoord4sv(coords)
          _glTexCoord4sv(array_to_pointer(coords, GLshort))
        end

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

        attach_function :_glRasterPos2dv, :glRasterPos2dv, [:pointer], :void
        def glRasterPos2dv(coords)
          _glRasterPos2dv(array_to_pointer(coords, GLdouble))
        end

        attach_function :_glRasterPos2fv, :glRasterPos2fv, [:pointer], :void
        def glRasterPos2fv(coords)
          _glRasterPos2fv(array_to_pointer(coords, GLfloat))
        end

        attach_function :_glRasterPos2iv, :glRasterPos2iv, [:pointer], :void
        def glRasterPos2iv(coords)
          _glRasterPos2iv(array_to_pointer(coords, GLint))
        end

        attach_function :_glRasterPos2sv, :glRasterPos2sv, [:pointer], :void
        def glRasterPos2sv(coords)
          _glRasterPos2sv(array_to_pointer(coords, GLshort))
        end

        attach_function :_glRasterPos3dv, :glRasterPos3dv, [:pointer], :void
        def glRasterPos3dv(coords)
          _glRasterPos3dv(array_to_pointer(coords, GLdouble))
        end

        attach_function :_glRasterPos3fv, :glRasterPos3fv, [:pointer], :void
        def glRasterPos3fv(coords)
          _glRasterPos3fv(array_to_pointer(coords, GLfloat))
        end

        attach_function :_glRasterPos3iv, :glRasterPos3iv, [:pointer], :void
        def glRasterPos3iv(coords)
          _glRasterPos3iv(array_to_pointer(coords, GLint))
        end

        attach_function :_glRasterPos3sv, :glRasterPos3sv, [:pointer], :void
        def glRasterPos3sv(coords)
          _glRasterPos3sv(array_to_pointer(coords, GLshort))
        end

        attach_function :_glRasterPos4dv, :glRasterPos4dv, [:pointer], :void
        def glRasterPos4dv(coords)
          _glRasterPos4dv(array_to_pointer(coords, GLdouble))
        end

        attach_function :_glRasterPos4fv, :glRasterPos4fv, [:pointer], :void
        def glRasterPos4fv(coords)
          _glRasterPos4fv(array_to_pointer(coords, GLfloat))
        end

        attach_function :_glRasterPos4iv, :glRasterPos4iv, [:pointer], :void
        def glRasterPos4iv(coords)
          _glRasterPos4iv(array_to_pointer(coords, GLint))
        end

        attach_function :_glRasterPos4sv, :glRasterPos4sv, [:pointer], :void
        def glRasterPos4sv(coords)
          _glRasterPos4sv(array_to_pointer(coords, GLshort))
        end

        attach_function :glRectd,        [GLdouble, GLdouble, GLdouble, GLdouble], :void
        attach_function :glRectf,        [GLfloat, GLfloat, GLfloat, GLfloat], :void
        attach_function :glRecti,        [GLint, GLint, GLint, GLint], :void
        attach_function :glRects,        [GLshort, GLshort, GLshort, GLshort], :void

        attach_function :_glRectdv, :glRectdv, [:pointer, :pointer], :void
        def glRectdv(coord1, coord2)
          _glRectdv(array_to_pointer(coord1, GLdouble), array_to_pointer(coord2, GLdouble))
        end

        attach_function :_glRectfv, :glRectfv, [:pointer, :pointer], :void
        def glRectfv(coord1, coord2)
          _glRectfv(array_to_pointer(coord1, GLfloat), array_to_pointer(coord2, GLfloat))
        end

        attach_function :_glRectiv, :glRectiv, [:pointer, :pointer], :void
        def glRectiv(coord1, coord2)
          _glRectiv(array_to_pointer(coord1, GLint), array_to_pointer(coord2, GLint))
        end

        attach_function :_glRectsv, :glRectsv, [:pointer, :pointer], :void
        def glRectsv(coord1, coord2)
          _glRectsv(array_to_pointer(coord1, GLshort), array_to_pointer(coord2, GLshort))
        end
      end
    end
  end
end