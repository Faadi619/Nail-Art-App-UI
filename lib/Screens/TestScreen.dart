// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class ShadowMatchingGame extends StatefulWidget {
//   @override
//   _ShadowMatchingGameState createState() => _ShadowMatchingGameState();
// }

// class _ShadowMatchingGameState extends State<ShadowMatchingGame> {
//   List<Animal> animals = [
//     Animal(
//         name: 'Lion',
//         imagePath: 'assets/images/lion.png',
//         shadowPath: 'assets/images/lion.png'),
//     Animal(
//         name: 'Elephant',
//         imagePath: 'assets/images/elephant.png',
//         shadowPath: 'assets/images/elephant.png'),
//     // Add more animals as needed
//   ];

//   String backgroundImage = 'assets/images/lion.png'; // Initial background image
//   String matchedImage = ''; // Image to be displayed after a correct match
//   String notMatchedImage = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFEF7F0),
//       appBar: AppBar(
//         backgroundColor: Colors.orange[50],
//         title: Text('Shadow Matching Game'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: animals.map((animal) {
//                 return Draggable(
//                   data: animal,
//                   child: Image.asset(
//                     animal.imagePath,
//                     width: 100.0,
//                     height: 100.0,
//                   ),
//                   feedback: Image.asset(
//                     animal.imagePath,
//                     width: 100.0,
//                     height: 100.0,
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//           SizedBox(height: 20.0),
//           Container(
//             child: DragTarget(
//               onWillAccept: (data) => data is Animal,
//               onAccept: (data) {
//                 // Check if the dropped animal matches the target
//                 if ((data as Animal).name == 'Lion' &&
//                     animals[0].name == 'Lion') {
//                   // Correct match
//                   setState(() {
//                     matchedImage = (data as Animal).imagePath;
//                   });
//                   print('Correct Match!');
//                   // onPlayAudio(correctAudio);
//                 } else if ((data as Animal).name == 'Elephant' &&
//                     animals[1].name == 'Elephant') {
//                   // Correct match
//                   setState(() {
//                     matchedImage = (data as Animal).imagePath;
//                   });
//                   print('Correct Match!');
//                   // onPlayAudio(correctAudio);
//                 } else {
//                   // Incorrect match
//                   setState(() {
//                     notMatchedImage = (data as Animal).imagePath;
//                   });
//                   print('Incorrect Match!');
//                   // onPlayAudio(wrongAudio);
//                 }
//               },
//               builder: (context, accepted, rejected) {
//                 return Opacity(
//                   opacity: matchedImage.isNotEmpty ? 1 : 0.2,
//                   child: matchedImage.isEmpty
//                       ? Image.asset(
//                           backgroundImage,
//                           color: Colors.black,
//                           width: 100.0,
//                           height: 100.0,
//                         )
//                       : Image.asset(
//                           backgroundImage,
//                           width: 100.0,
//                           height: 100.0,
//                         ),
//                 );
//               },
//             ),
//           ),
//           // matchedImage.isNotEmpty
//           //     ? Lottie.asset(
//           //         'assets/correct.json', // Replace with the path to your correct.json file
//           //         width: 200.0,
//           //         height: 200.0,
//           //         repeat: false,
//           //       )
//           //     : notMatchedImage.isNotEmpty
//           //         ? Lottie.asset(
//           //             'assets/incorrect.json', // Replace with the path to your correct.json file
//           //             width: 200.0,
//           //             height: 200.0,
//           //             repeat: false,
//           //           )
//           //         : SizedBox(),
//           IconButton(
//               onPressed: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (context) => BirdsMatchingGame(),
//                 //   ),
//                 // );
//               },
//               icon: Icon(Icons.navigate_next)),
//         ],
//       ),
//     );
//   }
// }

// class Animal {
//   final String name;
//   final String imagePath;
//   final String shadowPath;

//   Animal(
//       {required this.name, required this.imagePath, required this.shadowPath});
// }
