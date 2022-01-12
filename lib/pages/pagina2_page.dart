import 'package:estados/bloc/user_bloc.dart';
import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Página 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                child: Text(
                  'Establecer Usuario',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  final newUser = User(
                      nombre: 'Fernando',
                      edad: 36,
                      profesiones: ['FullStack Developer']);
                  userBloc.add(ActivateUser(newUser));
                }),
            MaterialButton(
                child: Text(
                  'Cambiar Edad',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  userBloc.add(ChangeUserAge(25));
                }),
            MaterialButton(
                child: Text(
                  'Añadir Profesion',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  userBloc.add(AddProfession('Nueva Profesion'));
                }),
          ],
        ),
      ),
    );
  }
}
