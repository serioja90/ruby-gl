
module Ruby
  class GL
    module SDL
      module GL
        extend FFI::Library

        ffi_lib 'SDL2'

        GLAttr = enum(
          :red_size,
          :green_size,
          :blue_size,
          :alpha_size,
          :buffer_size,
          :doublebuffer,
          :depth_size,
          :stencil_size,
          :accum_red_size,
          :accum_green_size,
          :accum_blue_size,
          :accum_alpha_size,
          :stereo,
          :multisamplebuffers,
          :multisamplesamples,
          :accelerated_visual,
          :retained_backing,
          :context_major_version,
          :context_minor_version,
          :context_egl,
          :context_flags,
          :context_profile_mask,
          :share_with_current_context,
          :framebuffer_srgb_capable,
          :context_release_behavior
        )

        RED_SIZE                   = GLAttr[:red_size]
        GREEN_SIZE                 = GLAttr[:green_size]
        BLUE_SIZE                  = GLAttr[:blue_size]
        ALPHA_SIZE                 = GLAttr[:alpha_size]
        BUFFER_SIZE                = GLAttr[:buffer_size]
        DOUBLEBUFFER               = GLAttr[:doublebuffer]
        DEPTH_SIZE                 = GLAttr[:depth_size]
        STENCIL_SIZE               = GLAttr[:stencil_size]
        ACCUM_RED_SIZE             = GLAttr[:accum_red_size]
        ACCUM_GREEN_SIZE           = GLAttr[:accum_green_size]
        ACCUM_BLUE_SIZE            = GLAttr[:accum_blue_size]
        ACCUM_ALPHA_SIZE           = GLAttr[:accum_alpha_size]
        STEREO                     = GLAttr[:stereo]
        MULTISAMPLEBUFFERS         = GLAttr[:multisamplebuffers]
        MULTISAMPLESAMPLES         = GLAttr[:multisamplesamples]
        ACCELERATED_VISUAL         = GLAttr[:accelerated_visual]
        RETAINED_BACKING           = GLAttr[:retained_backing]
        CONTEXT_MAJOR_VERSION      = GLAttr[:context_major_version]
        CONTEXT_MINOR_VERSION      = GLAttr[:context_minor_version]
        CONTEXT_EGL                = GLAttr[:context_egl]
        CONTEXT_FLAGS              = GLAttr[:context_flags]
        CONTEXT_PROFILE_MASK       = GLAttr[:context_profile_mask]
        SHARE_WITH_CURRENT_CONTEXT = GLAttr[:share_with_current_context]
        FRAMEBUFFER_SRGB_CAPABLE   = GLAttr[:framebuffer_srgb_capable]
        CONTEXT_RELEASE_BEHAVIOR   = GLAttr[:context_release_behavior]

        attach_function :create_context, :SDL_GL_CreateContext, [Window], :pointer
        attach_function :set_attribute, :SDL_GL_SetAttribute, [GLAttr, :int], :int
        attach_function :set_swap_interval, :SDL_GL_SetSwapInterval, [:int], :int
        attach_function :swap_window, :SDL_GL_SwapWindow, [Window], :void
      end
    end
  end
end