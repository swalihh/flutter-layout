
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:tradehub/data/models/logged_in_user.dart';
// import 'package:tradehub/features/dicount_request/data/presentation/bloc/single_request_view/single_invoice_bloc.dart';
// import 'package:tradehub/features/dicount_request/data/presentation/bloc/single_request_view/single_invoice_event.dart';
// import 'package:tradehub/features/dicount_request/discount_request_deatils_screen.dart';
// import 'package:tradehub/features/disbursal/discounting/presentaion/bloc/disbursal_listing_view/disbursal_view_bloc.dart';
// import 'package:tradehub/features/disbursal/discounting/presentaion/bloc/disbursal_listing_view/disbursal_view_event.dart';
// import 'package:tradehub/features/disbursal/discounting/presentaion/screen/disbursal_screen.dart';
// import 'package:tradehub/features/login/presentation/screen/forgot_password_screen.dart';
// import 'package:tradehub/features/login/presentation/screen/login_screen.dart';
// import 'package:tradehub/features/login/presentation/screen/reset_password_screen.dart';
// import 'package:tradehub/features/propposals/presentation/screens/proposal_screen.dart';
// import 'package:tradehub/features/settings/presentation/screens/settings_screen_main.dart';
// import 'package:tradehub/features/stakeholder_kyc/presentation/kyc_verification_screen.dart';
// import 'package:tradehub/features/stakeholder_kyc/presentation/verification_completed_screen.dart';
// import 'package:tradehub/features/transaction/presentation/screen/transaction_screen.dart';
// import '../../features/business/presentation/view/business_screen.dart';
// import '../../features/business/reports/report_screen.dart';
// import '../../features/dicount_request/discount_request_screen.dart';
// import '../../features/dicount_request/invoice_batch_add.dart';
// import '../../features/disbursal/discounting/presentaion/screen/disbursal_details_screen.dart';
// import '../../features/home/presentation/home_screen/dashboard_screen.dart';
// import '../../features/login/presentation/screen/login_otp_screen.dart';
// import '../../features/notifications/presentation/notification_screen.dart';
// import '../../features/side_menu/presentation/side_menu.dart';
// import '../../features/signu_up/registration_screen.dart';
// import '../../features/stakeholder_kyc/presentation/kyc_intro_screen.dart';

// class RouteNames {
//   static const String adminLogin = 'adminLogin';
//   static const String adminOtpVerify = 'adminOtpVerify';
//   static const String settings = 'settings';
//   static const String adminSideMenu = 'adminSideMenu';
//   static const String adminDashBoard = 'adminDashBoard';
//   static const String adminInvestor = 'adminInvestor';

//   //Business Route
//   static const String forgotPassword = 'businessForgotScreen';

//   static const String businessLogin = 'businessLogin';
//   static const String businessHome = 'businessHome';

//   static const String businessOtpLoginScreen = 'businessOtpLoginScreen';
//   static const String businessRegistrationFirstScreen =
//       'businessRegistrationFirstScreen';
//   static const String businessRegistrationSecondScreen =
//       'businessRegistrationSecondScreen';
//   static const String businessRegistrationEmailVerifyScreen =
//       'businessRegistrationEmailVerifyScreen';
//   static const String businessRegistrationPhoneVerifyScreen =
//       'businessRegistrationPhoneVerifyScreen';
// }

// class RouterConfigClass {
//   final router = GoRouter(
//     initialLocation: '/',
//     redirect: (context, state) async {
// //not logged in
//       if (LoggedInUser.accessToken == null) {
//         bool updatePassword = state.matchedLocation == '/business-update';
//         bool isForgot = state.matchedLocation == '/business-forgot';
//         bool isLoginPage = state.matchedLocation == '/business-Login';
//         bool isRegistrationPage =
//             state.matchedLocation == '/business-registration-screen';
//         bool isOtpPage = state.matchedLocation == '/business-otp-login-verify';
//         bool isKyc = state.matchedLocation == '/kyc-intro';
//         // ||
//         //     state.matchedLocation == '/kyc-verification-screen' ||
//         //   state.matchedLocation == '/verification-completed';

//         if (!isLoginPage &&
//             !isRegistrationPage &&
//             !isOtpPage &&
//             !isKyc &&
//             !isForgot &&
//             !updatePassword) {
//           return '/business-Login';
//         }
//       }

// // If logged in, allow access to home screen and others
//       return null;
//     },
//     routes: [
//       GoRoute(
//         name: RouteNames.businessLogin,
//         path: '/business-Login',
//         pageBuilder: (context, state) => CustomTransitionPage<void>(
//           key: state.pageKey,
//           child: const LoginScreen(),
//           transitionsBuilder: (context, animation, secondaryAnimation, child) =>
//               FadeTransition(opacity: animation, child: child),
//         ),
//       ),
//       GoRoute(
//         name: RouteNames.businessOtpLoginScreen,
//         path: '/business-otp-login-verify',
//         pageBuilder: (context, state) {
//           final Map<String, String>? credentials =
//               state.extra as Map<String, String>?;
//           final String? username = credentials?['email'];
//           final String? password = credentials?['password'];
//           return CustomTransitionPage<void>(
//             key: state.pageKey,
//             child: credentials == null || username == null || password == null
//                 ? const LoginScreen()
//                 : LoginOtpScreen(
//                     businessDetails: {'email': username, 'password': password}),
//             transitionsBuilder:
//                 (context, animation, secondaryAnimation, child) =>
//                     FadeTransition(opacity: animation, child: child),
//           );
//         },
//       ),
//       GoRoute(
//         name: RouteNames.forgotPassword,
//         path: '/business-forgot',
//         // path: '/business-registration-screen',

//         pageBuilder: (BuildContext context, GoRouterState state) =>
//             CustomTransitionPage<void>(
//           key: state.pageKey,
//           child: const BusinessForgotScreen(),
//           transitionsBuilder: (BuildContext context,
//                   Animation<double> animation,
//                   Animation<double> secondaryAnimation,
//                   Widget child) =>
//               FadeTransition(opacity: animation, child: child),
//         ),
//       ),
//       GoRoute(
//         path: '/business-update',
//         // path: '/business-registration-screen',

//         pageBuilder: (BuildContext context, GoRouterState state) =>
//             CustomTransitionPage<void>(
//           key: state.pageKey,
//           child: const ResetPasswordScreen(),
//           transitionsBuilder: (BuildContext context,
//                   Animation<double> animation,
//                   Animation<double> secondaryAnimation,
//                   Widget child) =>
//               FadeTransition(opacity: animation, child: child),
//         ),
//       ),

//       GoRoute(
//         name: RouteNames.businessRegistrationFirstScreen,
//         path: '/business-registration-screen',
//         pageBuilder: (context, state) => CustomTransitionPage<void>(
//           key: state.pageKey,
//           child: const RegistrationScreen(),
//           transitionsBuilder: (context, animation, secondaryAnimation, child) =>
//               FadeTransition(opacity: animation, child: child),
//         ),
//       ),

//       /// Business Side router
//       ShellRoute(
//           builder: (context, state, child) {
//             return SideMenu(child: child); // Sidebar is persistent
//           },
//           routes: [
//             GoRoute(
//               path: '/',
//               pageBuilder: (context, state) => CustomTransitionPage<void>(
//                 key: state.pageKey,
//                 child: const DashboardScreen(),
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) =>
//                         FadeTransition(opacity: animation, child: child),
//               ),
//             ),
//             // GoRoute(
//             //   path: '/investors',
//             //   pageBuilder: (context, state) => CustomTransitionPage<void>(
//             //     key: state.pageKey,
//             //     child: const BusinessScreen(),
//             //     transitionsBuilder:
//             //         (context, animation, secondaryAnimation, child) =>
//             //             FadeTransition(opacity: animation, child: child),
//             //   ),
//             // ),
//             GoRoute(
//                 path: '/business_listing',
//                 pageBuilder: (context, state) {
//                   Map<String, int>? extra = state.extra as Map<String, int>?;
//                   int initialIndex = extra?['currentIndex'] ?? 0;
//                   return CustomTransitionPage<void>(
//                     key: state.pageKey,
//                     child: BusinessScreen(initialIndex: initialIndex),
//                     transitionsBuilder:
//                         (context, animation, secondaryAnimation, child) =>
//                             FadeTransition(opacity: animation, child: child),
//                   );
//                 }),
//             GoRoute(
//               path: '/business-discount-request',
//               pageBuilder: (context, state) => CustomTransitionPage<void>(
//                 key: state.pageKey,
//                 child: const DiscountRequestScreen(),
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) =>
//                         FadeTransition(opacity: animation, child: child),
//               ),
//             ),
//             GoRoute(
//                 name: 'businessDiscountView',
//                 path: '/business-discount-view',
//                 pageBuilder: (context, state) {
//                   final String? invoiceId =
//                       state.uri.queryParameters['invoiceId'];
//                   context
//                       .read<SingleInvoiceBloc>()
//                       .add(FetchSingleInvoice(invoiceId: invoiceId ?? ''));
//                   return CustomTransitionPage<void>(
//                     key: state.pageKey,
//                     child: const BusinessDiscountView(),
//                     transitionsBuilder:
//                         (context, animation, secondaryAnimation, child) =>
//                             FadeTransition(opacity: animation, child: child),
//                   );
//                 }),
//             GoRoute(
//               path: '/business-proposal',
//               pageBuilder: (context, state) => CustomTransitionPage<void>(
//                 key: state.pageKey,
//                 child: const ProposalScreen(),
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) =>
//                         FadeTransition(opacity: animation, child: child),
//               ),
//             ),
//             GoRoute(
//                 path: '/business-discounting',
//                 pageBuilder: (context, state) => CustomTransitionPage<void>(
//                       key: state.pageKey,
//                       child: const DisbursalScreen(),
//                       transitionsBuilder:
//                           (context, animation, secondaryAnimation, child) =>
//                               FadeTransition(opacity: animation, child: child),
//                     ),
//                 routes: [
//                   GoRoute(
//                     path: 'send-invoice-request',
//                     pageBuilder: (context, state) => CustomTransitionPage<void>(
//                       key: state.pageKey,
//                       child: const InvoiceBatchAdd(),
//                       transitionsBuilder:
//                           (context, animation, secondaryAnimation, child) =>
//                               FadeTransition(opacity: animation, child: child),
//                     ),
//                   ),
//                 ]),
//             GoRoute(
//                 name: 'disbursalMainPageView',
//                 path: '/disbursal-main-page',
//                 pageBuilder: (context, state) {
//                   final String? invoiceId =
//                       state.uri.queryParameters['invoiceId'];

//                   context
//                       .read<DisbursalViewBloc>()
//                       .add(FetchDisbursalView(invoiceId: invoiceId ?? ''));
//                   context
//                       .read<SingleInvoiceBloc>()
//                       .add(FetchSingleInvoice(invoiceId: invoiceId ?? ''));
//                   return CustomTransitionPage<void>(
//                     key: state.pageKey,
//                     child: const DisbursalDetailsScreen(),
//                     transitionsBuilder:
//                         (context, animation, secondaryAnimation, child) =>
//                             FadeTransition(opacity: animation, child: child),
//                   );
//                 }),
//             GoRoute(
//               path: '/business-transaction',
//               pageBuilder: (context, state) => CustomTransitionPage<void>(
//                 key: state.pageKey,
//                 child: const TransactionScreen(),
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) =>
//                         FadeTransition(opacity: animation, child: child),
//               ),
//             ),
//             GoRoute(
//               path: '/business-reports',
//               pageBuilder: (context, state) => CustomTransitionPage<void>(
//                 key: state.pageKey,
//                 child: const ReportsScreen(),
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) =>
//                         FadeTransition(opacity: animation, child: child),
//               ),
//             ),
//             GoRoute(
//               path: '/business-settings',
//               pageBuilder: (context, state) => CustomTransitionPage<void>(
//                 key: state.pageKey,
//                 child: const SettingsScreen(),
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) =>
//                         FadeTransition(opacity: animation, child: child),
//               ),
//             ),
//             GoRoute(
//               path: '/notifications-reports',
//               pageBuilder: (context, state) => CustomTransitionPage<void>(
//                 key: state.pageKey,
//                 child: const NotificationScreen(),
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) =>
//                         FadeTransition(opacity: animation, child: child),
//               ),
//             ),
//           ]),

//       GoRoute(
//           path: '/kyc-intro',
//           pageBuilder: (context, state) {
//             String id = state.uri.queryParameters['token'] ?? '';
//             LoggedInUser.kycToken(id);
//             return CustomTransitionPage<void>(
//               key: state.pageKey,
//               child: const KYCIntroScreen(),
//               transitionsBuilder:
//                   (context, animation, secondaryAnimation, child) =>
//                       FadeTransition(opacity: animation, child: child),
//             );
//           }),
//       GoRoute(
//           path: '/kyc-verification-screen',
//           pageBuilder: (context, state) {
//             String id = state.uri.queryParameters['token'] ?? '';
//             LoggedInUser.kycToken(id);
//             return CustomTransitionPage<void>(
//               key: state.pageKey,
//               child: const KYCVerificationScreen(),
//               transitionsBuilder:
//                   (context, animation, secondaryAnimation, child) =>
//                       FadeTransition(opacity: animation, child: child),
//             );
//           }),
//       GoRoute(
//         path: '/verification-completed',onExit: (context, state) => false,
//         pageBuilder: (context, state) => CustomTransitionPage<void>(
//           key: state.pageKey,
//           child: const VerificationCompletedScreen(),
//           transitionsBuilder: (context, animation, secondaryAnimation, child) =>
//               FadeTransition(opacity: animation, child: child),
//         ),
//       ),
//     ],
//   );
// }
