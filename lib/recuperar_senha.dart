// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

// ignore: camel_case_types
class recuperar_senha extends StatelessWidget {
  const recuperar_senha({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text('Recuperar conta:'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'e-mail'))),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.save),
                      label: Text('Salvar'),
                      onPressed: () {
                        // ignore: avoid_print
                        print("E-mail de recuperacao enviado!!!");
                        Navigator.pop(context);
                      },
                    )),
              ],
            ),
          )),
    );
  }
}
