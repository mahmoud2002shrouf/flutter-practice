// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:provider_app/mymodels.dart';

// class Homes extends StatefulWidget {
//   const Homes({Key? key}) : super(key: key);

//   @override
//   _HomesState createState() => _HomesState();
// }

// class _HomesState extends State<Homes> {
//   Mymodel mymodel=Mymodel();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:  Text(mymodel.name),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Consumer<Mymodel>(
//               builder: (context, value, child) {
//                 return Container(
//                   child:  Text(value.name),
//                 );
//               },
//             ),
//             Consumer<Mymodel>(
//               builder: (context, value, child) {
//                 return ElevatedButton(
//                   onPressed: (){
//                     value.changeName("soso");
//                   },
//                   child: const Text('chnge name'),
//                 );
//               },
//             ),
//             Consumer<AntherModel>(
//               builder: (context, value, child) {
//                 return ElevatedButton(
//                   onPressed: (){
//                     value.changeNameAnther();
//                   },
//                   child: const Text('chnge name anther'),
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
