import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://afodciebtshzgccjnvsd.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFmb2RjaWVidHNoemdjY2pudnNkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ1Njk3NTYsImV4cCI6MjAzMDE0NTc1Nn0.tU1QRGq-xMKp4t5X8DW0YCh2e_Bl7pk-NVPhH6K9MtI',
  );
  runApp(MyApp());
}
        

// It's handy to then extract the Supabase client in a variable for later uses
// final supabase = Supabase.instance.client;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(context) {
    return MaterialApp(
      title: "supabase",
      home: Scaffold(
        body: const Text("hello world"),
        appBar: AppBar(
          title: const Text("hello supabase"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: ((context) {
                  return SimpleDialog(
                    title: const Text('add a note'),
                    contentPadding: const EdgeInsets.all(20),
                    children: [
                      TextFormField(
                        onFieldSubmitted: (value) async {
                          // await Supabase.instance.client
                          //     .from('notes')
                          //     .insert({'body': value});
                        },
                      )
                    ],
                  );
                }));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
