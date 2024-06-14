import 'package:flutter/material.dart';

class SoldeSection extends StatefulWidget {
  const SoldeSection({super.key});

  @override
  State<SoldeSection> createState() => _SoldeSectionState();
}

class _SoldeSectionState extends State<SoldeSection> {
//LocalStorage storage = LocalStorage('user_information');
  bool isVisible = false;
  String defaultValue = "----------";
  String solde = "";
  String afficher = "----------";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 5.5,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(23, 101, 152, 1),
              borderRadius: BorderRadius.all(Radius.circular(17.0))),
        ),
        Container(
          decoration: BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 7.5,
                  // decoration: BoxDecoration(color: Colors.red),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "+ 2.70% Aujourd'hui",
                        style: TextStyle(
                            color: Color.fromRGBO(235, 155, 216, 1),
                            fontSize: 17.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                        child: Text(
                          '₿ $afficher',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )),
              Image.asset("images/bitcoin.png"),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 4.8,
          width: MediaQuery.of(context).size.width / 5,
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              height: MediaQuery.of(context).size.width / 7.5,
              width: MediaQuery.of(context).size.width / 7.5,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(160, 32, 130, 1),
                  borderRadius: BorderRadius.all(Radius.circular(50.0))),
              child: IconButton(
                  onPressed: () {},
                  /*  () async {
                      Map response = await SellBtcService().getBalance();
                      if (response['solde'] == '0E-8') {
                        storage.setItem('solde', '0.00000');
                      } else {
                        storage.setItem('solde', response['solde']);
                      }

                      setState(() {
                        isVisible = !isVisible;
                        if (isVisible) {
                          afficher = '${storage.getItem('solde')}';
                        } else {
                          afficher = defaultValue;
                        }
                      });
                    },*/
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  )),
            )
          ]),
        )
      ],
    );
  }
}
