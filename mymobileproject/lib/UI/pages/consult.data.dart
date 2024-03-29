import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConsultData extends StatefulWidget {
  const ConsultData({super.key});

  @override
  State<ConsultData> createState() => _ConsultDataState();
}

class _ConsultDataState extends State<ConsultData> {
  static const String _title = 'Mon compte';

  /* Future<StudentModel> consulterCpt() async {
    var data =
        await http.get('http://localhost:8080/api/etudiants/consultAccount');
    var jsonData = jsonDecode(data.body);

    for (var etu in jsonData) {
      StudentModel etudiant;
      etudiant.solde = etu["solde"];
      etudiant.nom = etu["nom"];
      etudiant.prenom = etu["prenom"];
      etudiant.filiere = etu["filiere"];
      etudiant.tel = etu["tel"];
      etudiant. = etu["id"];
      etudiant.idCpt = etu["idCpt"];
    }
  }*/

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(_title)),
        body: Background(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 120),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: size.height * 0.5,
                  width: size.width * 5,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2))
                    ],
                  ),
                  child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        /*  FutureBuilder(
                         future: consulterCpt,
                         builder: (BuildContext context, AsyncSnapshot snapshot){
                          if (snapshot.data == null){
                            return Container(child: Center(child: Icon(Icons.error)));
                          }
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index){
                              return ListTile(
                                title: Text(
                                  'Solde' + ' ' + ' Nom' +  ' ' + 'Prénom' + ' ' + 'N° compte' + ' '
                                ),
                                subtitle: 
                                Text(
                                  '$(snapshot.data[index].solde}' +
                                  '$(snapshot.data[index].nom}' +
                                   '$(snapshot.data[index].prenom}' +
                                   '$(snapshot.data[index].numeroCompte}'
                                  )',
                                  onTap:() {
                                    
                                  },
                                  );
                              )} );
                         } ),
                         */
                      ]),
                ),
              ]),
        )));
  }
}
