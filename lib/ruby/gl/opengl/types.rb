
module Ruby
  class GL
    module OpenGL
      module Types
        GL_FALSE = 0
        GL_TRUE  = 1

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