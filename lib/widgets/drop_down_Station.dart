import 'package:flutter/material.dart';

class DropDownStation extends StatefulWidget {
  const DropDownStation({Key? key}) : super(key: key);

  @override
  State<DropDownStation> createState() => _DropDownStationState();
}

class _DropDownStationState extends State<DropDownStation> {
  String dropdownValue = 'Select WorkSpace';
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Workspaces'),
      subtitle: Container(
        width: double.infinity,
        height: 50,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text(dropdownValue),
            focusColor: Colors.white,
            borderRadius: BorderRadius.circular(10),
            // value: dropdownValue,
            items: <String>[
              'Work Space3',
              'Work Space2',
              'Work Space1',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
          ),
        ),
      ),
    );
  }
}
//////////////////////////////////////////////////////////////

class VisiablltyDrapDown extends StatefulWidget {
  const VisiablltyDrapDown({Key? key}) : super(key: key);

  @override
  _VisiablltyDrapDownState createState() => _VisiablltyDrapDownState();
}

class _VisiablltyDrapDownState extends State<VisiablltyDrapDown> {
  String dropdownValue = 'Select WorkSpace';
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Visibility'),
      subtitle: Container(
        width: double.infinity,
        height: 50,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text(dropdownValue),
            focusColor: Colors.white,
            borderRadius: BorderRadius.circular(10),
            // value: dropdownValue,
            items: <String>[
              'Work Space3',
              'Work Space2',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
          ),
        ),
      ),
    );
  }
}