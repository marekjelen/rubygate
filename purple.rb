require 'ffi'

module Purple

  extend FFI::Library

  ffi_lib 'libpurple.so.0'

  attach_function(:purple_util_set_user_dir, [:string], :void)
  attach_function(:purple_debug_set_enabled, [:int], :void)

  attach_function(:purple_core_set_ui_ops, [:pointer], :void)
  attach_function(:purple_core_init, [:string], :int)

  attach_function(:purple_eventloop_set_ui_ops, [:pointer], :void)

  attach_function(:g_main_loop_new, [:pointer, :int], :pointer)
  attach_function(:g_main_loop_run, [:pointer], :void)
  attach_function(:g_timeout_add, [:uint, :pointer, :pointer], :int)
  attach_function(:g_source_remove, [:uint], :int)
  attach_function(:g_timeout_add_seconds, [:uint, :pointer, :pointer], :int)

  class CoreUiOps < FFI::Struct
    layout  :prefs_init, :pointer, 
            :debug_init, :pointer, 
            :init, :pointer, 
            :quit, :pointer,
            :ui_info, :pointer, 
            :res1, :pointer, 
            :res2, :pointer, 
            :res3, :pointer
  end

  class EventLoopUiOps < FFI::Struct
    layout  :timeout_add, :pointer,
            :timeout_remove, :pointer,
            :input_add, :pointer,
            :input_remove, :pointer,
            :input_get_error, :pointer,
            :timeout_add_seconds, :pointer,
            :res1, :pointer,
            :res2, :pointer,
            :res3, :pointer
  end
end

puts 'Setup  loop'
main_loop = Purple.g_main_loop_new(nil, 0)

puts 'Setup purple'
Purple.purple_util_set_user_dir(File.expand_path('../purple', __FILE__))
Purple.purple_debug_set_enabled(1)

puts 'core ops'
core_ops = Purple::CoreUiOps.new
Purple.purple_core_set_ui_ops(core_ops)

puts 'eventloop ops'
eventloop_ops = Purple::EventLoopUiOps.new 
Purple.purple_eventloop_set_ui_ops(eventloop_ops)

puts 'init'
if Purple.purple_core_init('ruby') == 1
  echo 'OK'
else
  echo 'Error'
end

puts 'set the loop'
Purple.g_main_loop_run(main_loop)
