
module Ruby
  class GL
    module OpenGL
      module Types
        GL_FALSE = 0
        GL_TRUE  = 1

        GL_BYTE           = 0x1400
        GL_UNSIGNED_BYTE  = 0x1401
        GL_SHORT          = 0x1402
        GL_UNSIGNED_SHORT = 0x1403
        GL_INT            = 0x1404
        GL_UNSIGNED_INT   = 0x1405
        GL_FLOAT          = 0x1406
        GL_2_BYTES        = 0x1407
        GL_3_BYTES        = 0x1408
        GL_4_BYTES        = 0x1409
        GL_DOUBLE         = 0x140A

        GLenum     = :uint
        GLboolean  = :uchar
        GLbitfield = :uint
        GLvoid     = :void
        GLbyte     = :char
        GLshort    = :short
        GLint      = :int
        GLubyte    = :uchar
        GLushort   = :ushort
        GLuint     = :uint
        GLsizei    = :int
        GLfloat    = :float
        GLclampf   = :float
        GLdouble   = :double
        GLclampd   = :double
        GLchar     = :char
        GLhalf     = :ushort
      end
    end
  end
end