require 'ruby_gate/gtk'
require 'ruby_gate/tray'
require 'ruby_gate/window'
require 'ruby_gate/main_window'

module RubyGate

  def name
    @name
  end

  def self.setup(path, name)
    @path = path
    @name = name
    RubyGate::Gtk.gtk_init(nil, nil)
    RubyGate::Notify.notify_init(@name)
  end

  def self.main
    RubyGate::Gtk.gtk_main
  end

  def self.quit
    RubyGate::Gtk.gtk_main_quit
    RubyGate::Notify.notify_uninit
  end

  def self.notify(title, text=nil, icon=nil)
    icon = app_path('icon.png')
    notification = RubyGate::Notify.notify_notification_new(title, text, icon, nil)
    RubyGate::Notify.notify_notification_show(notification, nil)
  end

  def self.app_path(path)
    File.join(@path, path)
  end

  def self.web_path(path)
    'file://' + app_path(path)
  end

end