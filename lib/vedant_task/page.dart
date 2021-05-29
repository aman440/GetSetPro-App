import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:todoey_flutter/widgets/tasks_list.dart';
//import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
//import 'package:todoey_flutter/models/task_data.dart';
import 'package:taskify/task_list/widgets/tasks_list.dart';
import 'package:taskify/task_list/models/task_data.dart';
import 'package:taskify/task_list/screens/add_task_screen.dart';

class Paaage {
  final String name;
  final IconData iconName;
  Paaage({required this.name, required this.iconName});
}

// class Content extends StatefulWidget {
//   Widget? content;
//   var empty = Container();
//   Content({this.content});
//   @override
//   _ContentState createState() => _ContentState();
// }

// class _ContentState extends State<Content> {
//   @override
//   Widget build(BuildContext context) {
//     return widget.content != null
//         ? widget.content!
//         : Container(
//             width: MediaQuery.of(context).size.width,
//             color: Colors.pink,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () => print('hi'),
//                         child: Container(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 15),
//                           margin: EdgeInsets.symmetric(
//                               vertical: 30, horizontal: 20),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20)),
//                           child: Text(
//                             'Task',
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () => print('hi'),
//                         child: Container(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 15),
//                           margin: EdgeInsets.symmetric(
//                               vertical: 30, horizontal: 20),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20)),
//                           child: Text(
//                             'Rank',
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 // Container(
//                 //   height: 200,
//                 //   padding: EdgeInsets.symmetric(horizontal: 20.0),
//                 //   decoration: BoxDecoration(
//                 //     color: Colors.white,
//                 //     borderRadius: BorderRadius.only(
//                 //       topLeft: Radius.circular(20.0),
//                 //       topRight: Radius.circular(20.0),
//                 //     ),
//                 //   ),
//                 //   child: TasksList(),
//                 // ),
//               ],
//             ),
//           );
//   }
// }
