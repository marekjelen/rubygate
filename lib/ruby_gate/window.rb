module RubyGate

  class Window

    def initialize
      @window = RubyGate::Gtk.gtk_window_new(:toplevel)
      @scroll = RubyGate::Gtk.gtk_scrolled_window_new(nil, nil)
      @web = RubyGate::Gtk.webkit_web_view_new
      self.title = ''
      self.resize(800, 600)
      @callback = FFI::Function.new(:bool, [:pointer, :pointer]) do |widget, window|
        RubyGate::Gtk.gtk_widget_destroy(window)
        true
      end
      RubyGate::Gtk.g_signal_connect_data(@web, 'close-web-view', @callback, @window, nil, 0)
      RubyGate::Gtk.gtk_container_add(@scroll, @web)
      RubyGate::Gtk.gtk_container_add(@window, @scroll)
      RubyGate::Gtk.gtk_window_set_icon_from_file(@window, RubyGate.app_path('icon.png'))
    end

    def show
      RubyGate::Gtk.gtk_widget_show_all(@window)
      @visible = true
    end

    def hide
      RubyGate::Gtk.gtk_widget_hide(@window)
      @visible = false
    end

    def toggle
      @visible ? hide : show
    end

    def resize(width, height)
      @width = width
      @height = height
      RubyGate::Gtk.gtk_window_set_default_size(@window, @width, @height)
    end

    def tray
      @tray ||= Tray.new
    end

    def title=(title)
      @title = title
      RubyGate::Gtk.gtk_window_set_title(@window, title)
    end

    def width=(width)
      @width = width
      RubyGate::Gtk.gtk_window_set_default_size(@window, @width, @height)
    end

    def height=(height)
      @height = height
      RubyGate::Gtk.gtk_window_set_default_size(@window, @width, @height)
    end

    def url=(url)
      @url = url
      RubyGate::Gtk.webkit_web_view_load_uri(@web,@url)
    end

    def push(name, content)

    end

    def pull(name)

    end

  end

end