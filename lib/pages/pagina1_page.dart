import 'package:estados/bloc/user_bloc.dart';
import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 1'),
        actions: [
          IconButton(
              icon: Icon(Icons.delete_outline),
              onPressed: () {
                BlocProvider.of<UserBloc>(context, listen: false).add(DeleteUser());
              })
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.existUser
              ? InformacionUsuario(state.user)
              : Center(
                  child: Text('No hay usuario seleccionado'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final User user;

  const InformacionUsuario(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(title: Text('Nombre: ${user.nombre}')),
          ListTile(title: Text('Edad: ${user.edad}')),
          const Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ...user.profesiones
              .map((prof) => ListTile(title: Text(prof)))
              .toList()
        ],
      ),
    );
  }
}
