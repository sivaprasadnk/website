

// class HiNameContainer extends StatelessWidget {
//   const HiNameContainer({
//     Key? key,
//     required this.showName,
//     required this.screenWidth,
//   }) : super(key: key);

//   final bool showName;
//   final double screenWidth;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedOpacity(
//       duration: Duration(seconds: 1),
//       opacity: showName ? 1 : 0,
//       child: Container(
//         margin: EdgeInsets.only(
//           left: screenWidth * 0.1,
//         ),
//         width: screenWidth * 0.6,
//         child: Text(
//           "Hi ,\nI 'm Sivaprasad NK .",
//           style: Theme.of(context).textTheme.caption,
//         ),
//       ),
//     );
//   }
// }

// class FlutterDeveloperContainer extends StatelessWidget {
//   const FlutterDeveloperContainer({
//     Key? key,
//     required this.showName,
//     required this.screenWidth,
//   }) : super(key: key);

//   final bool showName;
//   final double screenWidth;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedOpacity(
//       duration: Duration(seconds: 1),
//       opacity: showName ? 1 : 0,
//       child: Padding(
//         padding: EdgeInsets.only(
//           top: 10,
//           left: screenWidth * 0.1,
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             FlutterLogo(
//               size: 30,
//               style: FlutterLogoStyle.markOnly,
//             ),
//             Text(
//               ' Flutter Developer from Tripunithura, Kerala .',
//               style: Theme.of(context).textTheme.subtitle2,
//               // style: TextStyle(
//               //   fontWeight: FontWeight.bold,
//               //   fontSize: 20,
//               //   color: Colors.white,
//               // ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
