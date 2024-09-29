import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://afodciebtshzgccjnvsd.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFmb2RjaWVidHNoemdjY2pudnNkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ1Njk3NTYsImV4cCI6MjAzMDE0NTc1Nn0.tU1QRGq-xMKp4t5X8DW0YCh2e_Bl7pk-NVPhH6K9MtI',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floating Button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _noteStream =
      Supabase.instance.client.from('note').stream(primaryKey: ['id']);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Floating Button Demo'),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
          stream: _noteStream,
          builder: (context, snapShot) {
            if (!snapShot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final note=snapShot.data!;
           return ListView.builder(itemCount: note.length,itemBuilder: (ctx,index){
              return ListTile(
                title: Text(note[index]['body']),
              );

            });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                title: const Text('Simple Dialog'),
                contentPadding: const EdgeInsets.all(16),
                children: [
                  TextFormField(
                    onFieldSubmitted: (value) async {
                      await Supabase.instance.client
                          .from('note')
                          .insert({'body': value});
                    },
                  )
                ],
              );
            },
          );
        },
        tooltip: 'Show Dialog',
        child: const Icon(Icons.add),
      ),
    );
  }
}
