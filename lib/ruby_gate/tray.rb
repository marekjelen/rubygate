module RubyGate

  class Tray

    def initialize

    end

    def setup(file=nil)
      @tray = RubyGate::Gtk.gtk_status_icon_new
      @file ||= RubyGate.app_path(file || 'icon.png')
      RubyGate::Gtk.gtk_status_icon_set_from_file(@tray, @file)
    end

    def title=(title)
      @title = title
      RubyGate::Gtk.gtk_status_icon_set_tooltip_text(@tray, @title)
    end

    def show(show=true)
      RubyGate::Gtk.gtk_status_icon_set_visible(@tray, show ? 1 : 0)
    end

    def tooltip=(text)
      RubyGate::Gtk.gtk_status_icon_set_tooltip_text(@tray, text)
    end

    def clicked(&callback)
      @clicked = FFI::Function.new(:void, [:pointer, :pointer]) do |icon, data|
        yield callback
      end
      RubyGate::Gtk.g_signal_connect_data(@tray, 'activate', @clicked, nil, nil, 0)
    end

    def popup(&callback)
      @popup = FFI::Function.new(:int, [:pointer, :int, :int, :pointer]) do |icon, button, time, popup|
        yield callback
      end
      RubyGate::Gtk.g_signal_connect_data(@tray, 'popup-menu', @popup, nil, nil, 0)

    end

  end

end