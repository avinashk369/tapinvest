-keep class com.fintech.tapinvest.** { *; }
-keep class dagger.** { *; }
-keep class javax.inject.** { *; }
-keep class * extends java.lang.annotation.Annotation { *; }
-keep class ** implements com.fintech.tapinvest.** { *; }

# Retrofit
-keep class retrofit2.** { *; }
-keep class com.google.gson.** { *; }
-keep class com.squareup.okhttp.** { *; }
-keep class okhttp3.** { *; }
-keep class okio.** { *; }

# Retrofit-generated classes
-keep class com.fintech.tapinvest.api.** { *; }
-keep class com.fintech.tapinvest.models.** { *; }

# Retrofit annotations
-keepattributes *Annotation*
-keepattributes Signature
-keepattributes Exceptions

# Retrofit methods
-keepclasseswithmembers class * {
    @retrofit2.http.* <methods>;
}

# Keep Dio and related classes
-keep class io.flutter.plugins.** { *; }
-keep class com.dio.** { *; }
-keep class *.di.** { *; }

# Keep your generated code
-keep class com.fintech.tapinvest.generated.** { *; }
-keep class com.fintech.tapinvest.services.** { *; }


-keepclasseswithmembernames class * {
    native <methods>;
}