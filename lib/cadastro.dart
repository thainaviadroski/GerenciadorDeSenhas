// main.dart
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'Data/perfil_datasource.dart';
import 'Data/Entity/ProfileEntity.dart';
import 'Data/perfil_datasource.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Perfil do usuário',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  File? _image;
  // final _picker = ImagePicker();

//  Future<void> _openImagePicker() async {
//    final XFile? pickedImage =
//        await _picker.pickImage(source: ImageSource.gallery);
//    if (pickedImage != null) {
//      setState(() {
//        _image = File(pickedImage.path);
//      });
//    }
//  }
  String nome = '';
  String email = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuário'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(children: [
            Center(
              child: ElevatedButton(
                onPressed: null, //print('_openImagePicker'),
                child: const Text('Selecione a imagem'),
              ),
            ),
            const SizedBox(height: 35),
            // Container(
            //   alignment: Alignment.center,
            //   width: double.infinity,
            //   height: 300,
            //   color: Colors.grey[300],
            //   child: _image != null
            //       ? Image.file(_image!, fit: BoxFit.cover)
            //       : const Text('Por favor selecione a imagem'),
            //),
            const SizedBox(height: 35),
            tff_nome(),
            const SizedBox(height: 35),
            tff_email(),
            const SizedBox(height: 35),
            tff_senha(),
            const SizedBox(height: 35),
            //salvar(_nome, _email, _senha),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        onPressed: () {
          //PerfilDatasource.insertPerfil(_nome, _email, _senha);
          PerfilDatasource.insertPerfil(nome, email, senha);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  TextFormField tff_email() {
    return TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'O campo e-mail é obrigatório';
          }
        },
        onChanged: (value) => setState(() {
              email = value;
            }),
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: 'E-mail'));
  }

  TextFormField tff_nome() {
    return TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'O campo nome é obrigatório';
          }
        },
        onChanged: (value) => setState(() {
              nome = value;
            }),
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: 'Nome'));
  }

  TextFormField tff_senha() {
    return TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'O campo senha é obrigatório';
          }
          if (value.length < 4) {
            return 'O campo senha não pode ser menor que 4 digitos';
          }
        },
        onChanged: (value) => setState(() {
              senha = value;
            }),
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: 'Senha'));
  }
}
