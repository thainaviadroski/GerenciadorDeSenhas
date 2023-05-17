import 'package:flutter/material.dart';

Widget bottonNavbar() {
  return BottomNavigationBar(
    // ignore: prefer_const_literals_to_create_immutables
    items: [
      const BottomNavigationBarItem(
          icon: Icon(Icons.person), label: "Minha Conta"),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Senhas"),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cartões")
    ],
  );
}
