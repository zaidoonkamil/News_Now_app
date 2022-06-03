// import 'package:flutter/material.dart';
//
// class Contry extends StatefulWidget {
//    Contry({Key key}) : super(key: key);
//
//   @override
//   State<Contry> createState() => _ContryState();
// }
//
// class _ContryState extends State<Contry> {
//   String s;
//   String d;
//
//   savePref() async{
//     SharedPreferences pref=await SharedPreferences.getInstance();
//     pref.setString('country',s );
//     print('succes save');
//   }
//
//   getPref() async{
//     SharedPreferences pref=await SharedPreferences.getInstance();
//     var getdata= pref.getString('country');
//     print('succes get');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("News Now"),
//       ),
//       body:Column(
//         children: [
//           FlatButton(onPressed:(){
//
//           },
//             child: const Text('Egypt',
//             style: TextStyle(color: Colors.white),
//           ),)
//         ],
//     ),
//     );
//   }
// }
