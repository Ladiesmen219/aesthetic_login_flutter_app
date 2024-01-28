# login_flutter_app

## Getting Started

This project is a starting point for a Flutter application.


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
