// ignore: file_names
import 'dart:ui';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class cartaoCredito extends StatelessWidget {
  const cartaoCredito({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: const Text('Cadastro de cartões'),
      ),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple[300],
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget fieldDescricao() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    child: TextFormField(
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
          border: const OutlineInputBorder(), labelText: 'Descrição'),
    ),
  );
}

Widget fieldSenha() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    child: TextFormField(
        obscureText: true,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: 'Senha')),
  );
}

Widget fieldNumero() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    child: TextFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(), labelText: 'Numero'),
    ),
  );
}

Widget fieldValidade() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    child: TextFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(), labelText: 'Validade'),
    ),
  );
}

Widget fieldCvv() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    child: TextFormField(
      decoration:
          const InputDecoration(border: OutlineInputBorder(), labelText: 'CVV'),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget ContainerPreto() {
  return (Container(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Container(
      height: 40,
      color: Colors.black,
    ),
  ));
}

// ignore: non_constant_identifier_names
Widget ContainerCinza() {
  // ignore: avoid_unnecessary_containers
  return (Container(
    child: Container(
      height: 50,
      color: Colors.black,
    ),
  ));
}

Widget textNome() {
  // ignore: prefer_const_constructors
  return Text(
    "John Do",
    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
    textAlign: TextAlign.right,
  );
}

// ignore: non_constant_identifier_names
Widget CartaoFrente(context) {
  return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [cartaoFront(context)],
      ));
}

Widget cartaoFront(context) {
  return Container(
    width: MediaQuery.of(context).size.width * .9,
    height: 200,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 16, 121, 22)),
    child: Column(
      children: [fieldNumero(), fieldValidade(), textNome()],
    ),
  );
}

// ignore: non_constant_identifier_names
Widget CartaoVerso(context) {
  return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [cartaoVerse(context)],
      ));
}

Widget cartaoVerse(context) {
  return Container(
    width: MediaQuery.of(context).size.width * .9,
    height: 200,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 255, 193, 7)),
    child: Column(
      children: [ContainerPreto(), ContainerCinza(), fieldCvv()],
    ),
  );
}

// ignore: must_be_immutable
class Body extends StatelessWidget {
  bool mostraSenha = false;

  Body({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        fieldDescricao(),
        const SizedBox(
          height: 10,
        ),
        CartaoFrente(context),
        const SizedBox(
          height: 20,
        ),
        CartaoVerso(context),
        const SizedBox(
          height: 10,
        ),
        fieldSenha(),
      ],
    );
  }
}
