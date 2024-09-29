import 'package:flutter/material.dart';

void main()  {

  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: "flutter",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("app par"),
          actions: [ElevatedButton(onPressed: (){     showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      
      constraints:const BoxConstraints(minWidth: double.infinity,),
      context: context,
      builder: (ctx) => const Text('cascas'),
    );
}, child: const Icon(Icons.abc))],
        ),
        body: Container(),
        
    
      ),
    );
  }
}
