import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}

Future<String?> getDeviceToken() async {
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  String? token = await FirebaseMessaging.instance.getToken();
  print('FirebaseMessaging token: $token');

  return token;
}

// class tet extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       body: Column(
//         children: [
//           child :Padding(
//               padding: EdgeInsets.only(left: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       Text("주거지",
//                         style: TextStyle(
//                             letterSpacing: 2.0,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 80.0,
//                       ),
//                       Text("공원",
//                         style: TextStyle(
//                             letterSpacing: 2.0,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold
//                         ),
//                       ),
//                       SizedBox(
//                         height: 80.0,
//                       ),
//                       Text("수변지",
//                         style: TextStyle(
//                             letterSpacing: 2.0,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(right: 30),
//                     child: Column(
//                       children: [
//                         Padding(padding: EdgeInsets.only(top: 40, bottom: 90),
//                           child: Container(
//                             width: 15,
//                             height: 15,
//                             decoration: BoxDecoration(
//                               color: Colors.red,
//                               borderRadius: BorderRadius.circular(20.0),
//                             ),
//                           ),
//                         ),
//                         Padding(padding: EdgeInsets.only(bottom: 80),
//                           child: Container(
//                             width: 15,
//                             height: 15,
//                             decoration: BoxDecoration(
//                               color: Colors.red,
//                               borderRadius: BorderRadius.circular(20.0),
//                             ),
//                           ),
//                         ),
//                         Padding(padding: EdgeInsets.only(bottom: 50),
//                           child: Container(
//                             width: 15,
//                             height: 15,
//                             decoration: BoxDecoration(
//                               color: Colors.red,
//                               borderRadius: BorderRadius.circular(20.0),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(padding: EdgeInsets.only(),
//                     child:Row(
//                       children: [
//                         Image.asset("images/Group2.png",
//                           height: 100,
//                           width: 100,)
//                       ],
//                     )
//                     ,)
//                 ],
//               )
//           ),
//         ],
//       )
//     );
//   }
// }