module RubyGate

  class MainWindow < Window

    def initialize
      super
      @callback = FFI::Function.new(:void, [:pointer, :pointer]) do |widget, window|
        RubyGate.quit
      end
      RubyGate::Gtk.g_signal_connect_data(@window, 'destroy', @callback, nil, nil, 0)
    end

  end

end