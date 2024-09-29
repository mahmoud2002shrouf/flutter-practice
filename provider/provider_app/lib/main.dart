import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:provider_app/Homes.dart";
import "package:provider_app/mymodels.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      create: (context) => someAsynic(),
      initialData: MyModel(someValue: "initail"),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
          ),
          body: Row(
            children: [Container(child: Consumer<MyModel>(builder: (context, value, child) {
              return ElevatedButton(onPressed: (){
                value.doSomeThing();
              }, child: const Text("do something"));
            },),),Container(child: Consumer<MyModel>(builder: (context, value, child) {
              return Text(value.someValue);
            },),)],
          ),
        ),
      ),
    );
  }
}
















// import "package:flutter/material.dart";
// import "package:provider/provider.dart";
// import "package:provider_app/Homes.dart";
// import "package:provider_app/mymodels.dart";

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureProvider(
//       create: (context) => someAsynic(),
//       initialData: MyModel(someValue: "initail"),
//       child: MaterialApp(
//         home: Scaffold(
//           appBar: AppBar(
//             title: const Text("Home"),
//           ),
//           body: Row(
//             children: [Container(child: Consumer<MyModel>(builder: (context, value, child) {
//               return ElevatedButton(onPressed: (){
//                 value.doSomeThing();
//               }, child: const Text("do something"));
//             },),),Container(child: Consumer<MyModel>(builder: (context, value, child) {
//               return Text(value.someValue);
//             },),)],
//           ),
//         ),
//       ),
//     );
//   }
// }




























// class FirstApp extends StatelessWidget {
//   const FirstApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) {
//           return Mymodel();
//         },),
//         ProxyProvider<Mymodel,AntherModel>(update: (context, mymodel, anthremodel) {
//           return AntherModel(mymodel);
//         },
//         )
//       ],
//       child:const  MaterialApp(
//         debugShowMaterialGrid: false,
//         debugShowCheckedModeBanner: false,
//         title: "smart home",
//         home: Homes(),
//       ),
//     );
//   }
// }
