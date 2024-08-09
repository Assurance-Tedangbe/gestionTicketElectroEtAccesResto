import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/home/bloctitle.dart';
import 'package:mymobileproject/UI/widgets/home/imageasset.template.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.template.dart';
import 'package:mymobileproject/UI/widgets/home/stat.label.dart';
import 'package:mymobileproject/constants.dart';

class StatisticsStudent extends StatefulWidget {
  const StatisticsStudent({super.key});

  @override
  State<StatisticsStudent> createState() => _StatisticsStudentState();
}

class _StatisticsStudentState extends State<StatisticsStudent> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [BlocTitle(text: "Statistiques")],
      ),
      const SizeboxTemplate(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(children: [
            Container(
              //width: size.width / 3.0,
              //  height: size.height / 7.5,
              width: size.width / 3.5,
              height: size.height / 9.5,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(234, 234, 244, 1),
                  borderRadius: const BorderRadius.all(Radius.circular(17.0)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2))
                  ],
                  border: Border.all(color: kPrimaryColor, width: 1)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: size.width / 30.0,
                              height: size.height / 35.0,
                              child: const ImageAsset(
                                  iconpath: "images/increase.JPG")),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),
                            child: StatisticsLabel(label: "Total tickets"),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                        child: Text(
                          "20",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
          Stack(
            children: [
              Container(
                /* width: size.width / 2.0,
                height: size.height / 7.5, */
                width: size.width / 2.0,
                height: size.height / 9.5,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(234, 234, 244, 1),
                    borderRadius: const BorderRadius.all(Radius.circular(17.0)),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2))
                    ],
                    border: Border.all(color: kPrimaryColor, width: 1)),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: size.width / 25.0,
                                height: size.height / 30.0,
                                child: const ImageAsset(
                                    iconpath: "images/ticket_icon.JPG")),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),
                              child: StatisticsLabel(label: "Non utilisés"),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                          child: Text(
                            "10",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: size.width / 25.0,
                                  height: size.height / 30.0,
                                  child: const ImageAsset(
                                      iconpath: "images/ticket_icon.JPG")),
                              const Padding(
                                padding:
                                    EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),
                                child: StatisticsLabel(label: "Utilisés"),
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                            child: Text(
                              "10",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
