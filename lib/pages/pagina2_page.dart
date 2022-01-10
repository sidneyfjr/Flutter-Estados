import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
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
                  final newUser = Usuario(
                      nombre: 'Fernando Herrera',
                      edad: 34,
                      profesiones: [
                        'FullStack Developer',
                        'VideoJugador Veterano'
                      ]);
                  usuarioCubit.seleccionarUsuario(newUser);
                }),
            MaterialButton(
                child: Text(
                  'Cambiar Edad',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  usuarioCubit.cambiarEdad(30);
                }),
            MaterialButton(
                child: Text(
                  'Añadir Profesion',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  usuarioCubit.agregarProfesion();
                }),
          ],
        ),
      ),
    );
  }
}
