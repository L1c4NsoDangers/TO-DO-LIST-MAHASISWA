// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_to_do_list/const/colors.dart';
// import 'package:flutter_to_do_list/screen/add_note_screen.dart';
// import 'package:flutter_to_do_list/widgets/stream_note.dart';

// class Home_Screen extends StatefulWidget {
//   const Home_Screen({super.key});

//   @override
//   State<Home_Screen> createState() => _Home_ScreenState();
// }

// bool show = true;

// class _Home_ScreenState extends State<Home_Screen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColors,
//       floatingActionButton: Visibility(
//         visible: show,
//         child: FloatingActionButton(
//           onPressed: () {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => Add_creen(),
//             ));
//           },
//           backgroundColor: custom_orange,
//           child: Icon(Icons.add, size: 30),
//         ),
//       ),
//       body: SafeArea(
//         child: NotificationListener<UserScrollNotification>(
//           onNotification: (notification) {
//             if (notification.direction == ScrollDirection.forward) {
//               setState(() {
//                 show = true;
//               });
//             }
//             if (notification.direction == ScrollDirection.reverse) {
//               setState(() {
//                 show = false;
//               });
//             }
//             return true;
//           },
//           child: Column(
//             children: [
//               Stream_note(false),
//               Text(
//                 'isDone',
//                 style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey.shade500,
//                     fontWeight: FontWeight.bold),
//               ),
//               Stream_note(true),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_to_do_list/const/colors.dart';
import 'package:flutter_to_do_list/screen/add_note_screen.dart';
import 'package:flutter_to_do_list/widgets/stream_note.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

bool show = true;

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      floatingActionButton: Visibility(
        visible: show,
        child: Stack(
          children: [
            Positioned(
              bottom: 80.0, // Adjust the position as needed
              right: 16.0,
              child: FloatingActionButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  // Implement logout functionality
                },
                backgroundColor: Colors.red,
                child: Icon(Icons.logout, size: 30),
              ),
            ),
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Add_creen(),
                  ));
                },
                backgroundColor: custom_orange,
                child: Icon(Icons.add, size: 30),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                show = true;
              });
            }
            if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                show = false;
              });
            }
            return true;
          },
          child: Column(
            children: [
              Stream_note(false),
              Text(
                'isDone',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.bold),
              ),
              Stream_note(true),
            ],
          ),
        ),
      ),
    );
  }
}
