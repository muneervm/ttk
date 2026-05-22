# Flutter wrapper
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.plugin.** { *; }
-dontwarn io.flutter.embedding.**

# Keep Flutter engine
-keep class io.flutter.embedding.** { *; }

# cached_network_image / OkHttp / Glide
-keep class com.bumptech.glide.** { *; }
-dontwarn com.bumptech.glide.**
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**
-dontwarn okio.**

# flutter_svg
-keep class com.caverock.androidsvg.** { *; }
-dontwarn com.caverock.androidsvg.**

# barcode_scan2 / ZXing
-keep class com.google.zxing.** { *; }
-dontwarn com.google.zxing.**
-keep class de.mintware.barcode_scan.** { *; }

# image_picker
-keep class io.flutter.plugins.imagepicker.** { *; }

# file_picker
-keep class com.mr.flutter.plugin.filepicker.** { *; }

# shared_preferences
-keep class io.flutter.plugins.sharedpreferences.** { *; }

# Play Core (review, update, asset-delivery)
-keep class com.google.android.play.** { *; }
-dontwarn com.google.android.play.**

# Kotlin coroutines
-keepnames class kotlinx.coroutines.internal.MainDispatcherFactory {}
-keepnames class kotlinx.coroutines.CoroutineExceptionHandler {}
-dontwarn kotlinx.coroutines.**

# General keep rules to avoid stripping model/data classes
-keepattributes *Annotation*
-keepattributes Signature
-keepattributes Exceptions
-keepattributes InnerClasses
-keepattributes EnclosingMethod

# Prevent stripping of native methods
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep Parcelable classes
-keepclassmembers class * implements android.os.Parcelable {
    static ** CREATOR;
}

# Keep Serializable classes
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readReadResolve();
}

# Multidex
-keep class androidx.multidex.** { *; }
