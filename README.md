# RubyGate

Write desktop app in Ruby and expose UI using web.

## How?

FFI bindings to some libraries that are cross-platform to cover most desktop deployments

* Mac
* Windows
* Linux, BSD
  * QT based (KDE)
  * GTK based (Gnome, Cinnamon, Mate, XFCE)

FFI to cover other Ruby implementations than MRI, i.e. JRuby and Rubinius.

## Tech

At this moment

* GTK + WebKitGtk
* MRI 1.9.3 (should not be required, not tested)
* Fedora 18 (where to check for libraries in system)

## Status

Experiment ... 5 hours on Sunday.

## License

Currently released under the terms of (MIT License)[http://www.opensource.org/licenses/MIT].