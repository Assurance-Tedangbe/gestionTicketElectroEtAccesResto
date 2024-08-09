import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:http/http.dart' as http;
import 'package:mymobileproject/UI/widgets/consult.account/dataConsultBack.dart';
import 'dart:convert';
import 'package:mymobileproject/UI/widgets/home/stat.label.dart';

class ConsultData extends StatefulWidget {
  const ConsultData({super.key});

  @override
  State<ConsultData> createState() => _ConsultDataState();
}

class _ConsultDataState extends State<ConsultData> {
  static const String _title = 'Informations sur le compte';
  String name = "- - - - ";
  String username = "- - - - ";
  String email = "- - - - ";
  String password = "- - - - ";
  String balance = "- - - - ";

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
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: size.height * 0.6,
                  width: size.width * 6.0,
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
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  StatisticsLabel(label: 'N° compte'),
                                  SizedBox(height: 5),
                                  /* Text(
                                    "- - - -",
                                    style: TextStyle(
                                        color: kThirdColor,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ), */
                                  DataConsultBack()
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  StatisticsLabel(label: 'Nom complet'),
                                  SizedBox(height: 5),
                                  DataConsultBack()
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  StatisticsLabel(label: 'Nom d\'utilisateur'),
                                  SizedBox(height: 5),
                                  DataConsultBack()
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  StatisticsLabel(label: 'Email'),
                                  SizedBox(height: 5),
                                  DataConsultBack()
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  StatisticsLabel(label: 'Mot de passe'),
                                  SizedBox(height: 5),
                                  DataConsultBack()
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  StatisticsLabel(label: 'Solde'),
                                  SizedBox(height: 5),
                                  DataConsultBack()
                                ],
                              ),
                            ],
                          ),
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
                ),
              ]),
        )));
  }
}
