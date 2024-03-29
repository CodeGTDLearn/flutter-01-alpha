### Project Index

1. Splash-Screen:
    1. Primary (native):
       1. package: flutter_native_splash
          1. https://pub.dev/packages/flutter_native_splash
    2. Secondary (Widget) 
       1. Adaptive (Android x Ios)
          1. Ex.:https://github.com/jonbhanson/flutter_native_splash/blob/master/example/lib/main.dart


2. Adaptive approuch (Android x Ios):
   1. widgets
      1. Package: flutter_platform_widgets
   2. Splitted views 
   3. Specific widgets (SOLID 2)
   4. Platform Drivers
      1. Android_app_driver 
      2. Ios_app_driver
   5. Specific themes
   6. Styles-Cupertino:
      1. How to apply styles:
         1. https://github.com/googlecodelabs/flutter-cupertino-store/blob/master/step-06/lib/product_row_item.dart
         2. 
   7. TagBindings(GetX) + DArt.io_platform: 
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
   3. Exception handler:
      1. Handle the exceptions
      

8. FutureBuilder:
   1. Futures management


9. PostMan as FakeApi/BackEnd:
    1. https://www.youtube.com/watch?v=tn4IkucFEAw
    2. https://learning.postman.com/docs/designing-and-developing-your-api/mocking-data/mocking-with-examples/
    

10. Crash App Management:
    1. Catcher:
       1. https://medium.com/flutter-community/handling-flutter-errors-with-catcher-efce74397862
       2. BackEnd in java for storage the crashes:
          1. https://github.com/jhomlala/catcher/tree/master/backend
       3. Email problem: https://github.com/taljacobson/flutter_mailer/issues/38