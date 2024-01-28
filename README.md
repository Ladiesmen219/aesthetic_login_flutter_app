# login_flutter_app

Thank you for your support ❤️❤️

## Getting Started

This project is a starting point for a Flutter application.
A few resources to get you started if this is your first Flutter project:

## Tutorials
- [DESIGN PLAYLIST](https://www.youtube.com/playlist?list=PL5jb9EteFAODpfNJu8U2CMqKFp4NaXlto)
- [FIREBASE PLAYLIST](https://www.youtube.com/playlist?list=PL5jb9EteFAOC9V6ZHAIg3ycLtjURdVxUH)
- [Firebase setup](https://www.youtube.com/watch?v=fxDusoMcWj8)



## UPDATE
  1. Updated Deprecated TextTheme Attributes  [headline1], [headline2], ...[Link](https://codingwitht.com/how-to-use-theme-in-flutter-light-dark-theme)
  2. Elevated Button Properties updated from [onPrimary] to [foregroundColor] & [primary] to [backgroundColor]
  3. Style Update from Stadium to Radius[15]



## Docs
     1. Show Splash Screen till data loads & when loaded call FlutterNativeSplash.remove(); In this case I'm removing it inside AuthenticationRepository() -> onReady() method.
     2. Before running App - Initialize Firebase and after initialization, Call Authentication Repository so that It can check which screen to show.
     3. Solves the issues of Get.lazyPut and Get.Put() by defining all Controllers in InitialBinding
     4. Screen Transitions: Use these 2 properties in GetMaterialApp
            - defaultTransition: Transition.leftToRightWithFade,
            - transitionDuration: const Duration(milliseconds: 500),
     5. HOME SCREEN:
            - Show Progress Indicator OR SPLASH SCREEN until Screen Loads all its data from cloud.
            - Let the AuthenticationRepository decide which screen to appear as first.
     6. Authentication Repository:
            - We use this repository to authenticate the user and manage screen redirects.
            - This repo is being called from the main.dart on app launch.
            - It's onReady() func set the firebaseUser state, remove the Splash Screen and redirect the user to relevant screen.
            - To use this repo in other classes we will call [final auth = AuthenticationRepository.instance;]
