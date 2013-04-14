$: << File.expand_path('../lib', __FILE__)

require 'ruby_gate'

RubyGate.setup(File.expand_path('../app', __FILE__), 'RubyGate')

window = RubyGate::MainWindow.new
window.url = RubyGate.web_path('index.html')
window.show

window.tray.setup
window.tray.title = 'RubyGate'

window.tray.clicked do
  window.toggle
end

window.tray.popup do
  RubyGate.notify('Change', 'Longer text')
end
window.tray.show

RubyGate.main