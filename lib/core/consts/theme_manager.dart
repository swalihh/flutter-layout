// import 'package:flutter/material.dart';


// import 'color_manager.dart';
// import 'font_manager.dart';

// ThemeData getApplicationTheme() {
//   return ThemeData(
//       // useMaterial3: true,
//       // main colors of the app
//       primaryColor: ColorManager.primary,
//       primaryColorLight: ColorManager.primaryOpacity70,
//       primaryColorDark: ColorManager.darkPrimary,
//       disabledColor: ColorManager.grey1,
//       scaffoldBackgroundColor: ColorManager.backgroundColor,
//       // ripple color

//       // card view theme
//       cardTheme: CardTheme(
//           color: ColorManager.white,
//           shadowColor: ColorManager.grey,
//           elevation: AppSize.s4),
//       // App bar theme
//       appBarTheme: AppBarTheme(
// // systemOverlayStyle: SystemUiOverlayStyle.dark,
//         titleSpacing: 0,
//         centerTitle: false,
//         surfaceTintColor: ColorManager.black,

//         // color: ColorManager.white,
//         elevation: 0,
//         backgroundColor: ColorManager.white,
//         iconTheme: IconThemeData(color: ColorManager.black),
//         titleTextStyle:
//             getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s16),
//       ),
//       // Button theme
//       buttonTheme: ButtonThemeData(
//           shape: const StadiumBorder(),
//           disabledColor: ColorManager.grey1,
//           buttonColor: ColorManager.primary,
//           splashColor: ColorManager.primaryOpacity70),

//       // elevated button theme
//       elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//               textStyle: getRegularStyle(color: ColorManager.white), backgroundColor: ColorManager.black,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(AppSize.s8)))),

//       //Final Design Text theme
//       textTheme: TextTheme(
//           displayLarge: getSemiBoldStyle(
//               color: ColorManager.black, fontSize: FontSize.s60),
//           displayMedium: getRegularStyle(
//               color: ColorManager.black, fontSize: FontSize.s36),
//           displaySmall:
//               getBoldStyle(color: ColorManager.black, fontSize: FontSize.s30),
//           headlineMedium:
//               getBoldStyle(color: ColorManager.black, fontSize: FontSize.s24),
//           headlineSmall: getRegularStyle(
//               color: ColorManager.black, fontSize: FontSize.s14),
//           titleLarge:
//               getBoldStyle(color: ColorManager.black, fontSize: FontSize.s20),
//           titleMedium:
//               getBoldStyle(color: ColorManager.black, fontSize: FontSize.s18),
//           titleSmall: getRegularStyle(
//               color: ColorManager.black, fontSize: FontSize.s16),
//           bodySmall: getRegularStyle(color: ColorManager.grey1),
//           bodyLarge:
//               getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
//           bodyMedium:
//               getBoldStyle(color: ColorManager.grey, fontSize: FontSize.s14)),

//       // // Text theme
//       // textTheme: TextTheme(
//       //     headline1: getSemiBoldStyle(
//       //         color: ColorManager.black, fontSize: FontSize.s60),
//       //     headline2: getRegularStyle(
//       //         color: ColorManager.black, fontSize: FontSize.s36),
//       //     headline3:
//       //         getBoldStyle(color: ColorManager.black, fontSize: FontSize.s30),
//       //     headline4: getRegularStyle(
//       //         color: ColorManager.black, fontSize: FontSize.s20),
//       //     headline5:getRegularStyle(
//       //         color: ColorManager.black, fontSize: FontSize.s14),
//       //     headline6: getRegularStyle(
//       //     color: ColorManager.black, fontSize: FontSize.s12),
//       //     subtitle1: getMediumStyle(
//       //         color: ColorManager.black, fontSize: FontSize.s16),
//       //     subtitle2: getRegularStyle(
//       //         color: ColorManager.black, fontSize: FontSize.s16),
//       //     bodyText2: getMediumStyle(color: ColorManager.lightGrey),
//       //     caption: getRegularStyle(color: ColorManager.grey1),
//       //     bodyText1: getRegularStyle(color: ColorManager.grey)),

//       // input decoration theme (text form field)

//       inputDecorationTheme: InputDecorationTheme(
//         contentPadding: const EdgeInsets.all(AppPadding.p8),
//         // hint style
//         hintStyle: getRegularStyle(color: ColorManager.grey1),

//         // label style
//         labelStyle: getMediumStyle(color: ColorManager.darkGrey),
//         // error style
//         errorStyle: getRegularStyle(color: ColorManager.error),

//         // enabled border
//         enabledBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(color: ColorManager.secondary, width: AppSize.s1_5),
//             borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

//         // focused border
//         focusedBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(color: ColorManager.secondary, width: AppSize.s1_5),
//             borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
//         // error border
//         errorBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(color: ColorManager.error, width: AppSize.s1_5),
//             borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
//         // focused error border
//         focusedErrorBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(color: ColorManager.secondary, width: AppSize.s1_5),
//             borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
//       ));
// }
