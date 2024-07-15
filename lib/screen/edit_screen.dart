// import 'package:flutter/material.dart';
// import 'package:flutter_to_do_list/const/colors.dart';
// import 'package:flutter_to_do_list/data/firestor.dart';
// import 'package:flutter_to_do_list/model/notes_model.dart';

// class Edit_Screen extends StatefulWidget {
//   Note _note;
//   Edit_Screen(this._note, {super.key});

//   @override
//   State<Edit_Screen> createState() => _Edit_ScreenState();
// }

// class _Edit_ScreenState extends State<Edit_Screen> {
//   TextEditingController? title;
//   TextEditingController? subtitle;

//   FocusNode _focusNode1 = FocusNode();
//   FocusNode _focusNode2 = FocusNode();
//   int indexx = 0;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     title = TextEditingController(text: widget._note.title);
//     subtitle = TextEditingController(text: widget._note.subtitle);
//   }

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
//             Firestore_Datasource().Update_Note(
//                 widget._note.id, indexx, title!.text, subtitle!.text);
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
//                     Image.asset(
//                       'images/${index}.png',
//                       height: 120,
//                       width: 120,
//                     ),
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
//               hintText: 'title',
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

import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/const/colors.dart';
import 'package:flutter_to_do_list/data/firestor.dart';
import 'package:flutter_to_do_list/model/notes_model.dart';

class EditScreen extends StatefulWidget {
  final Note note;

  EditScreen(this.note, {Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController? titleController;
  TextEditingController? subtitleController;

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    subtitleController = TextEditingController(text: widget.note.subtitle);
    // selectedIndex = widget.note.index;
  }

  @override
  void dispose() {
    titleController?.dispose();
    subtitleController?.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    super.dispose();
  }

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
                buttonRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonRow() {
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
            Firestore_Datasource().Update_Note(
              widget.note.id,
              selectedIndex,
              titleController!.text,
              subtitleController!.text,
            );
            Navigator.pop(context);
          },
          child: Text('Update Task', style: TextStyle(fontSize: 16)),
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
          child: Text('Cancel', style: TextStyle(fontSize: 16)),
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
                selectedIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: selectedIndex == index ? custom_orange : Colors.grey,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/$index.png', height: 120),
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
          controller: titleController,
          focusNode: _focusNode1,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'Title',
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

  Widget subtitleWidget() {
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
          controller: subtitleController,
          focusNode: _focusNode2,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'Description',
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
