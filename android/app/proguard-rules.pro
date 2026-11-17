# Proguard rules for Madhavani Studios Apps & Games

# ─── Flutter Engine & Plugins (CRITICAL: Prevents black screen) ──────────────
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.embedding.engine.deferredcomponents.** { *; }

# ─── Native / JNI / Method Channels ──────────────────────────────────────────
-keepclasseswithmembernames class * {
    native <methods>;
}
-keepclassmembers class * {
    native <methods>;
}

# ─── Activity & Lifecycle Callbacks ──────────────────────────────────────────
-keepclassmembers class * extends android.app.Activity {
    public void on*(android.os.Bundle);
}

# ─── Reflection Annotations & Metadata ───────────────────────────────────────
-keepattributes *Annotation*
-keepattributes RuntimeVisibleAnnotations,RuntimeVisibleParameterAnnotations
-keepattributes AnnotationDefault,Signature,InnerClasses,EnclosingMethod
-keepclassmembers class * {
    @androidx.annotation.Keep *;
}
-keep class kotlin.Metadata { *; }

# ─── Kotlin Coroutines (Used by modern Flutter plugins) ──────────────────────
-keepnames class kotlinx.coroutines.internal.MainDispatcherFactory {}
-keepnames class kotlinx.coroutines.CoroutineExceptionHandler {}
-keepnames class kotlinx.coroutines.android.AndroidExceptionPreHandler {}
-keepnames class kotlinx.coroutines.android.AndroidDispatcherFactory {}

# ─── Security & Crypto Bindings ──────────────────────────────────────────────
-keep class javax.crypto.** { *; }
-keep class javax.crypto.spec.** { *; }
-keep class org.bouncycastle.** { *; }
-dontwarn org.bouncycastle.**
-keep class dart.ffi.** { *; }

# ─── Google Mobile Ads (AdMob) & UMP Consent ─────────────────────────────────
-keep class com.google.android.gms.ads.** { *; }
-dontwarn com.google.android.gms.ads.**
-keep class com.google.android.ump.** { *; }
-dontwarn com.google.android.ump.**

# ─── AndroidX Startup, WorkManager, and Room ─────────────────────────────────
-keep class androidx.startup.** { *; }
-dontwarn androidx.startup.**

-keep class androidx.work.** { *; }
-keep class androidx.work.impl.** { *; }
-keep class androidx.work.impl.WorkDatabase { *; }
-keep class androidx.work.impl.WorkDatabase_Impl {
    public <init>();
    *;
}
-keep class * extends androidx.work.impl.WorkDatabase { *; }
-keep class * extends androidx.work.ListenableWorker {
    public <init>(android.content.Context, androidx.work.WorkerParameters);
}
-keep class * extends androidx.work.Worker {
    public <init>(android.content.Context, androidx.work.WorkerParameters);
}
-keep class * extends androidx.work.InputMerger {
    public <init>();
}
-dontwarn androidx.work.**

-keep class androidx.room.** { *; }
-keep class * extends androidx.room.RoomDatabase {
    public <init>();
    *;
}
-dontwarn androidx.room.**

# ─── In-App Purchases, Play Core, Storage & Audioplayers ─────────────────────
-keep class com.google.android.play.core.** { *; }
-dontwarn com.google.android.play.core.**
-keep class com.tekartik.sqflite.** { *; }
-dontwarn com.tekartik.sqflite.**
-keep class io.flutter.plugins.sharedpreferences.** { *; }
-dontwarn io.flutter.plugins.sharedpreferences.**
-keep class io.flutter.plugins.urllauncher.** { *; }
-dontwarn io.flutter.plugins.urllauncher.**
-keep class xyz.luan.audioplayers.** { *; }
-dontwarn xyz.luan.audioplayers.**

# ─── Suppress non-critical third-party warnings ──────────────────────────────
-dontwarn io.flutter.**
-dontwarn com.google.android.gms.**
-dontwarn com.google.android.play.core.**
