### Project Index

1. Splash-Screen:
    1. Primary (native):
       1. package: flutter_native_splash
    2. Secondary (Widget) 
       1. Adaptive (Android x Ios)


2. Adaptive approuch (Android x Ios):
   1. widgets
      1. Package: flutter_platform_widgets
   2. Splitted views 
   3. Specific widgets (SOLID 2)
   4. Platform Drivers
      1. Android_app_driver 
      2. Ios_app_driver
   5. Specific themes 
   6. TagBindings(GetX) + DArt.io_platform: 
      1. Selecting the specific dependency (Android x Ios), according the platform


3. Animations:
   1. Animated-Container
   2. Shadows
   3. GetxController 


4. Form 
   1. Field validations
   2. GetxController


5. GetX:
   1. state 
   2. route 
   3. dependencies
   4. TagBindings


6. MVC
   1. Core 
   2. entity+repo+service (business rules) 
      1. entity: package: JsonSerializable
   3. controller (state)
   4. view - activities


7. Exceptions:
   1. Assertion - Focus Developer:
      1. Is an ERROR
      2. Addressed for the Programmer
      3. Guide the Coder, to repair the App
      4. 'Releasing'(App Store) version excludes it
   2. Exception - Focus AppUser:
      1. It is not an ERROR
      2. It is handled in the App, by itself
      3. Should be catch, and show an exception for the user
      

9. FutureBuilder:
   1. Futures management