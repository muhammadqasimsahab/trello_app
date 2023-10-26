import 'package:flutter/material.dart';

class DaysDrapDown extends StatefulWidget {
  const DaysDrapDown({Key? key}) : super(key: key);

  @override
  _DaysDrapDownState createState() => _DaysDrapDownState();
}

class _DaysDrapDownState extends State<DaysDrapDown> {

  // Initial Selected Value
  String dropdownvalue = 'Today';

  // List of items in our dropdown menu
  var items = [
    'Today',
    'Tomorrow',
    'Next Friday',
    'pick a date...',
  ];
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(

              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ],
        ),
      );
  }
}
//////////////////////////////////////////////////////////////////////////

class TimeDrapDown extends StatefulWidget {
  const TimeDrapDown({Key? key}) : super(key: key);

  @override
  _TimeDrapDownState createState() => _TimeDrapDownState();
}

class _TimeDrapDownState extends State<TimeDrapDown> {

  // Initial Selected Value
  String dropdownvalue = 'Morning';

  // List of items in our dropdown menu
  var items = [
    'Morning',
    'Afternoon',
    'Evening',
    'pick a time...',
  ];
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(

            // Initial Value
            value: dropdownvalue,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ],
      ),
    );
  }
}