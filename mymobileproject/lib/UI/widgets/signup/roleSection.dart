import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/label.dart';
import 'package:mymobileproject/UI/widgets/updateUser/SizeboxBtwLabelField.dart';
import 'package:mymobileproject/constants.dart';

class RoleSection extends StatefulWidget {
  const RoleSection({super.key});

  @override
  State<RoleSection> createState() => _RoleSectionState();
}

class _RoleSectionState extends State<RoleSection> {
  TextEditingController roleController = TextEditingController();
  String roleSelected = 'Etudiant';
  var items = ['Etudiant', 'Agent', 'Portier', 'Admministarateur'];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Label(text: 'Rôle'),
        const SizeBoxBtwLabelField(),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: kSecondColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ],
              border: Border.all(color: kPrimaryColor, width: 3)),
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0),
            child: DropdownButtonFormField<String>(
              value: roleSelected,
              iconDisabledColor: kThirdColor,
              iconEnabledColor: kPrimaryColor,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              onChanged: (String? value) {
                setState(() {
                  roleSelected = value!;
                  if (roleSelected == true) {
                    print(roleSelected);
                    // String kw = roleSelected;
                    // context
                    //      .read<HistoricBloc>()
                    //      .add(SearchHistoricEvent(keyword: kw));
                  }
                });
              },
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      Text(
                        value,
                        style: const TextStyle(color: kThirdColor),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}
