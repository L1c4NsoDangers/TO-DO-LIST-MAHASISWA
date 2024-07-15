// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_to_do_list/const/colors.dart';
// import 'package:flutter_to_do_list/data/firestor.dart';

// class Add_creen extends StatefulWidget {
//   const Add_creen({super.key});

//   @override
//   State<Add_creen> createState() => _Add_creenState();
// }

// class _Add_creenState extends State<Add_creen> {
//   final title = TextEditingController();
//   final subtitle = TextEditingController();

//   FocusNode _focusNode1 = FocusNode();
//   FocusNode _focusNode2 = FocusNode();
//   int indexx = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColors,
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             title_widgets(),
//             SizedBox(height: 20),
//             subtite_wedgite(),
//             SizedBox(height: 20),
//             imagess(),
//             SizedBox(height: 20),
//             button()
//           ],
//         ),
//       ),
//     );
//   }

//   Widget button() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: custom_orange,
//             minimumSize: Size(170, 48),
//           ),
//           onPressed: () {
//             Firestore_Datasource().AddNote(subtitle.text, title.text, indexx);
//             Navigator.pop(context);
//           },
//           child: Text('add task'),
//         ),
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.red,
//             minimumSize: Size(170, 48),
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Cancel'),
//         ),
//       ],
//     );
//   }

//   Container imagess() {
//     return Container(
//       height: 180,
//       child: ListView.builder(
//         itemCount: 4,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 indexx = index;
//               });
//             },
//             child: Padding(
//               padding: EdgeInsets.only(left: index == 0 ? 7 : 0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(
//                     width: 2,
//                     color: indexx == index ? custom_orange : Colors.grey,
//                   ),
//                 ),
//                 width: 140,
//                 margin: EdgeInsets.all(8),
//                 child: Column(
//                   children: [
//                     Image.asset('images/${index}.png'),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget title_widgets() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: TextField(
//           controller: title,
//           focusNode: _focusNode1,
//           style: TextStyle(fontSize: 18, color: Colors.black),
//           decoration: InputDecoration(
//               contentPadding:
//                   EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//               hintText: 'Judul',
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide(
//                   color: Color(0xffc5c5c5),
//                   width: 2.0,
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide(
//                   color: custom_orange,
//                   width: 2.0,
//                 ),
//               )),
//         ),
//       ),
//     );
//   }

//   Padding subtite_wedgite() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: TextField(
//           maxLines: 3,
//           controller: subtitle,
//           focusNode: _focusNode2,
//           style: TextStyle(fontSize: 18, color: Colors.black),
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//             hintText: 'Deskripsi',
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(
//                 color: Color(0xffc5c5c5),
//                 width: 2.0,
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(
//                 color: custom_orange,
//                 width: 2.0,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/const/colors.dart';
import 'package:flutter_to_do_list/data/firestor.dart';

class Add_creen extends StatefulWidget {
  const Add_creen({super.key});

  @override
  State<Add_creen> createState() => _AddScreenState();
}

class _AddScreenState extends State<Add_creen> {
  final title = TextEditingController();
  final subtitle = TextEditingController();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  int indexx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                titleWidgets(),
                SizedBox(height: 20),
                subtitleWidget(),
                SizedBox(height: 20),
                images(),
                SizedBox(height: 20),
                button()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: custom_orange,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Firestore_Datasource().AddNote(subtitle.text, title.text, indexx);
            Navigator.pop(context);
          },
          child: Text('Add Task',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              )),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel',
              style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ],
    );
  }

  Container images() {
    return Container(
      height: 180,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                indexx = index;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: indexx == index ? custom_orange : Colors.grey,
                ),
              ),
              width: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/$index.png',
                    height: 120,
                    width: 120,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget titleWidgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: TextField(
          controller: title,
          focusNode: _focusNode1,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'Judul',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: custom_orange,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding subtitleWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: TextField(
          maxLines: 3,
          controller: subtitle,
          focusNode: _focusNode2,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'Deskripsi',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: custom_orange,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
