require 'formula'

class ClutterGtkGi < Formula
  homepage 'https://wiki.gnome.org/Clutter'
  url 'http://ftp.gnome.org/pub/gnome/sources/clutter-gtk/1.2/clutter-gtk-1.2.2.tar.xz'
  sha256 '743702bb230519553ca597b585b25af0b8783575fcd09c7fe5bed7dde292893c'

  depends_on 'pkg-config' => :build
  depends_on 'glib'
  depends_on 'gdk-pixbuf'
  depends_on 'cosmo0920/missing_gi/cogl-gi'
  depends_on 'atk'
  depends_on 'pango'
  depends_on 'cosmo0920/missing_gi/json-glib-gi'
  depends_on :x11 => '2.5.1' if build.with? 'x'
  depends_on 'gtk+3'
  depends_on 'cosmo0920/missing_gi/clutter-gi'
  depends_on 'gobject-introspection'

  def install
    args = %W[
      --disable-dependency-tracking
      --disable-debug
      --prefix=#{prefix}
      --enable-introspection=yes
      --disable-silent-rules
      --disable-gtk-doc-html
    ]

    system './configure', *args
    system 'make install'
  end
end
