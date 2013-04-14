require 'ffi'

module RubyGate

  module Notify

    extend FFI::Library

    ffi_lib('libnotify.so.4')

    attach_function(:notify_init, [:string], :bool)
    attach_function(:notify_uninit, [], :void)
    attach_function(:notify_notification_new, [:string, :string, :string, :pointer], :pointer)
    attach_function(:notify_notification_update, [:pointer, :string, :string, :string, :pointer], :pointer)
    attach_function(:notify_notification_set_urgency, [:pointer, :int], :void)
    attach_function(:notify_notification_set_timeout, [:pointer, :long], :void)
    attach_function(:notify_notification_set_hint_string, [:pointer, :string, :string], :void)
    attach_function(:notify_notification_set_hint_uint32, [:pointer, :string, :int], :void)
    attach_function(:notify_notification_clear_hints, [:pointer], :void)
    attach_function(:notify_notification_show, [:pointer, :pointer], :bool)
    attach_function(:notify_notification_close, [:pointer, :pointer], :bool)

  end

  module Gtk

    extend FFI::Library

    ffi_lib('libgtk-3.so.0')
    ffi_lib('libwebkitgtk-3.0.so.0')

    enum :gtk_window_type, [:toplevel, :popup]

    attach_function(:gtk_init, [:pointer, :pointer], :void)
    attach_function(:gtk_main, [], :void)
    attach_function(:gtk_main_quit, [], :void)

    attach_function(:g_signal_connect_data, [:pointer, :string, :pointer, :pointer, :pointer, :int], :void)
    attach_function(:g_error_free, [:pointer], :void)

    attach_function(:gtk_container_add, [:pointer, :pointer], :void)

    attach_function(:gtk_window_new, [:gtk_window_type], :pointer)
    attach_function(:gtk_window_set_title, [:pointer, :string], :void)
    attach_function(:gtk_window_set_default_size, [:pointer, :int, :int], :void)
    attach_function(:gtk_window_set_icon_from_file, [:pointer, :pointer], :int)

    attach_function(:gtk_scrolled_window_new, [:pointer, :pointer], :pointer)

    attach_function(:gtk_widget_show_all, [:pointer], :void)
    attach_function(:gtk_widget_destroy, [:pointer], :void)
    attach_function(:gtk_widget_grab_focus, [:pointer], :void)
    attach_function(:gtk_widget_hide, [:pointer], :void)

    attach_function(:webkit_web_view_new, [], :pointer)
    attach_function(:webkit_web_view_load_uri, [:pointer, :string], :void)

    attach_function(:gtk_status_icon_new, [], :pointer)
    attach_function(:gtk_status_icon_set_visible, [:pointer, :int], :void)
    attach_function(:gtk_status_icon_set_tooltip_text, [:pointer, :string], :void)
    attach_function(:gtk_status_icon_set_from_file, [:pointer, :pointer], :void)
    attach_function(:gtk_status_icon_position_menu, [:pointer, :pointer, :pointer, :pointer, :pointer], :void)
    attach_function(:gtk_status_icon_set_tooltip_text, [:pointer, :string], :void)

    attach_function(:gtk_menu_new, [], :pointer)
    attach_function(:gtk_menu_item_new_with_label, [:string], :pointer)
    attach_function(:gtk_menu_shell_append, [:pointer, :pointer], :void)
    attach_function(:gtk_menu_popup, [:pointer, :pointer, :pointer, :int, :int], :void)

  end


end