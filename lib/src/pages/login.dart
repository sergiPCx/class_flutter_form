import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            _background(),
            _login(context)
          ],
        )
    );
  }

  Widget _login(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(child: Container(
              height: 120,
            )),
            Container(
              width: size.width *0.85,
              padding: EdgeInsets.symmetric(vertical: 50),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 3.0,
                        offset: Offset(0.0, 5.0),
                        spreadRadius: 3.0
                    )
                  ]
              ),
              child: Column(
                children: <Widget>[
                  Text('Login', style: TextStyle(fontSize: 20),),
                  SizedBox(height: 30,),
                  _createUser(),
                  SizedBox(height: 30,),
                  _createPassword(),
                  SizedBox(height: 30,),
                  _createButton(context)
                ],
              ),
            )
          ],
        )
    );
  }

  Widget _createUser() {

        return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Usuarios',
                hintText: 'Ingrese su usuario',
                icon: Icon(
                    Icons.person, color: Color(0xff4D3CA5)),
              ),
            )
        );

  }

  _createPassword() {

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Contraseña',
            icon: Icon( Icons.lock, color: Color(0xff4D3CA5)),
          ),
        )
    );
  }

  _createButton(context){
    return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
          child: Text('Ingresar'),
        ),
        textColor: Colors.white,
        color: Color(0xff4D3CA5),
        onPressed: (){
//        Navigator.pushReplacementNamed(context, 'home');
        }
    );
  }

  _background() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color> [
                Colors.red,
                Color.fromRGBO(90, 70, 178, 1.0)
              ]
          )
      ),
    );
  }

}