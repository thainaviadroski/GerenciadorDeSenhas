// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:password_manager/passwordmaker.dart';

import 'cad_senhas.dart';
import 'cartaoCredito.dart';
import 'navbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            drawer: Drawer(
              child: ListView(
                // ignore: prefer_const_literals_to_create_immutables, duplicate_ignore
                children: [
                  // ignore: prefer_const_constructors
                  UserAccountsDrawerHeader(
                    accountName: const Text('John Do'),
                    accountEmail: const Text('exemplo@exemplo.com'),
                    // ignore: prefer_const_constructors
                    currentAccountPicture: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: const NetworkImage(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                    ),
                  ),
                  ListTile(
                    title: const Text('Cartões de Credito'),
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return cartaoCredito();
                      }))
                    },
                  ),
                  ListTile(
                    title: const Text('Gerador de senhas'),
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return geradorSenha();
                      }))
                    },
                  ),
                  ListTile(
                    title: const Text('Gerenciador de senhas'),
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return cadsenhas();
                      }))
                    },
                  )
                ],
              ),
            ),
            appBar: AppBar(
              title: const Text("Home"),
            ),
            bottomNavigationBar: bottonNavbar()));
  }
}
