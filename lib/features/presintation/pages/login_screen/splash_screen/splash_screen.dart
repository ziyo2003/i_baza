// import 'dart:async';
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     Timer(const Duration(seconds: 3), () {
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => Onboarding(),
//         ),
//       );
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(52, 87, 0, 0),
//             child: Container(
//               width: 18,
//               height: 18,
//               decoration: BoxDecoration(
//                 color: Color(0xFF65B136),
//                 borderRadius: BorderRadius.zero,
//               ),
//             ),
//           ),
//           BackdropFilter(
//             filter: ImageFilter.blur(sigmaY: 9, sigmaX: 9),
//             child: Container(
//               decoration: const BoxDecoration(color: Colors.transparent),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(383, 100, 0, 0),
//             child: Container(
//               width: 104,
//               height: 104,
//               decoration: BoxDecoration(
//                   color: Color(0xFFFFE054),
//                   borderRadius: BorderRadius.circular(200)),
//             ),
//           ),
//           BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 15),
//             child: Container(
//               decoration: const BoxDecoration(color: Colors.transparent),
//             ),
//           ),
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(112, 380, 112, 0),
//               child: Column(
//                 children: [
//                   SvgPicture.asset(AppIcons.logo),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(100, 400, 200, 0),
//                     child: SvgPicture.asset(
//                       AppIcons.line,
//                       width: 200,
//                       height: 20,
//                     ),
//                   ),
//                   SvgPicture.asset(AppIcons.loading),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }