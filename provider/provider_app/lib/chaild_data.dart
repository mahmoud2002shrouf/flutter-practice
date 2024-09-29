// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:provider_app/main.dart';
// class CildData extends StatelessWidget {
//   const CildData({super.key});
//   Widget build(context) {
//     // var model = Provider.of<Model>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("provider"),
//       ), 
//       body: Center(
//         child: Column(
//           children: [
//             Consumer<Model>(builder: (context,model,child){
//               return Text(model.name);

//             }),
//             Consumer<Counter>(builder: (context,coun,child){
//               return Text("${coun.counter}");

//             }),
            
//             Consumer<Model>(builder: (context,model,child){
//               return ElevatedButton(onPressed: (){
//                 model.changeonw();
//               },child: const Text("one"),);
// // 
//             }),
//             Consumer<Model>(builder: (context,model,child){
//               return ElevatedButton(onPressed: (){
//                 model.changeTow();
//               },child: const Text("tow"),);

//             }),
//               Consumer<Counter>(builder: (context,coun,child){
//               return ElevatedButton(onPressed: (){
//                 coun.chaneCounter();
//               },child: const Text("update"),);

//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
