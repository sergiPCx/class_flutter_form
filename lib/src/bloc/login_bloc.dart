import 'dart:async';

import 'package:hola_mundo/src/bloc/validators/Validators.dart';

class LoginBloc with Validators{

  final _emailController    = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  Function(String) get emailChange    => _emailController.sink.add;
  Function(String) get passwordChange => _passwordController.sink.add;

  Stream<String> get emailStream    => _emailController.stream.transform( validarEmail );
  Stream<String> get passwordStream => _passwordController.stream.transform( validarPassword );

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }

}