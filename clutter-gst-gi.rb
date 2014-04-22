require 'formula'

class ClutterGstGi < Formula
  homepage 'https://wiki.gnome.org/Clutter'
  url 'http://ftp.gnome.org/pub/gnome/sources/clutter-gst/2.0/clutter-gst-2.0.10.tar.xz'
  sha256 'f00cf492a6d4f1036c70d8a0ebd2f0f47586ea9a9b49b1ffda79c9dc7eadca00'

  depends_on 'pkg-config' => :build
  depends_on 'glib'
  depends_on 'gdk-pixbuf'
  depends_on 'cosmo0920/missing_gi/cogl-gi'
  depends_on 'atk'
  depends_on 'pango'
  depends_on 'cosmo0920/missing_gi/json-glib-gi'
  depends_on :x11 => '2.5.1' if build.with? 'x'
  depends_on 'gtk+3'
  depends_on 'cosmo0920/missing_gi/gst-plugins-base-gi'
  depends_on 'cosmo0920/missing_gi/clutter-gi'
  depends_on 'gobject-introspection'
  patch :DATA

  def install
    args = %W[
      --disable-dependency-tracking
      --disable-debug
      --prefix=#{prefix}
      --enable-introspection=yes
      --disable-silent-rules
      --disable-gtk-doc-html
    ]
    ENV.append "CFLAGS", "-framework OpenGL"
    ENV.append "LDFLAGS", "-framework OpenGL"

    system './configure', *args
    system 'make install'
  end
end
__END__
diff --git a/clutter-gst/clutter-gst-video-sink.h b/clutter-gst/clutter-gst-video-sink.h
index 3a06804..fbfb10b 100644
--- a/clutter-gst/clutter-gst-video-sink.h
+++ b/clutter-gst/clutter-gst-video-sink.h
@@ -44,6 +44,8 @@

 G_BEGIN_DECLS

+#define GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS 0x8B4D
+
 #define CLUTTER_GST_TYPE_VIDEO_SINK clutter_gst_video_sink_get_type()

 #define CLUTTER_GST_VIDEO_SINK(obj) \
