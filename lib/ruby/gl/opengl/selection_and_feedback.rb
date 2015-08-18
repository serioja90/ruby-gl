
module Ruby
  class GL
    module OpenGL
      module SelectionAndFeedback
        include Ruby::GL::OpenGL::Types
        extend FFI::Library
        ffi_lib 'GL'

        # Selection And Feedback
        attach_function :glFeedbackBuffer, [GLsizei, GLenum, :pointer], :void
        attach_function :glPassThrough,    [GLfloat], :void
        attach_function :glSelectBuffer,   [GLsizei, :pointer], :void
        attach_function :glInitNames,      [], :void
        attach_function :glLoadName,       [GLuint], :void
        attach_function :glPushName,       [GLuint], :void
        attach_function :glPopName,        [], :void

      end
    end
  end
end