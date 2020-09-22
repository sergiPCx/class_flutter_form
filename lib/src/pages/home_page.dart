import 'package:flutter/material.dart';
import 'package:hola_mundo/src/model/person_model.dart';
import 'package:hola_mundo/src/service/user_service.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  UserService userProvider = new UserService();
  Person person;
  int saldo = 0;
  String name = 'usuario';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black45,
        appBar: AppBar(
          title: Text('Datos del Usuario'),
          centerTitle: true,
          backgroundColor: Colors.grey[800],
          elevation: 0.0,
        ),
        floatingActionButton: FloatingActionButton( child: Icon(Icons.add), backgroundColor: Colors.pink,
          onPressed: () {
            setState(() {
              saldo += 1;
            });
          },
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: _createForm(),
        )
    );
  }

  labelText(String text, Color color, fontSize, fontWeight){
    return Text(
      text,
      style: TextStyle(
          color: color,
          letterSpacing: 2.0,
          fontSize: fontSize,
          fontWeight: fontWeight
      ),
    );
  }

  Widget _createForm() {

    return FutureBuilder(
        future: userProvider.getUser(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          person = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(person.data.avatar),
//                backgroundImage: AssetImage('assets/images/spiderman.png'),
                  radius: 40.0,
                ),
              ),
              Divider(
                height: 90.0,
                color: Colors.blue[800],
              ),
              labelText('Nombre', Colors.grey, 14.0, FontWeight.normal),
              SizedBox(height: 10.0,),
              labelText(person.data.email, Colors.amberAccent[200], 28.0, FontWeight.bold),
              SizedBox(height: 20.0,),
              labelText('Saldo en Cuenta', Colors.grey, 14.0, FontWeight.normal),
              SizedBox(height: 10.0,),
              labelText('$saldo', Colors.amberAccent[200], 28.0, FontWeight.bold),
            ],
          );
        }
    );


  }

}