import 'package:flutter/material.dart';

class SoldeSection extends StatefulWidget {
  const SoldeSection({super.key});

  @override
  State<SoldeSection> createState() => _SoldeSectionState();
}

class _SoldeSectionState extends State<SoldeSection> {
//LocalStorage storage = LocalStorage('user_information');
//  bool isVisible = false;
  // String defaultValue = "----------";
//  String solde = "";
  String afficher = "- - - - ";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 6.5,
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(17.0))),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Solde",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w700),
              ),
              const Text(
                "- - - -",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: MediaQuery.of(context).size.width / 12,
                width: MediaQuery.of(context).size.width / 12,
                decoration: const BoxDecoration(
                    color: Colors.black,
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
                    icon: const Icon(
                      Icons.visibility_off,
                      //  isVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
