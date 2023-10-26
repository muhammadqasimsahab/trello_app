import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

import '../ui/cards/create_card_screen.dart';

class ContactShowScreen extends StatefulWidget {
  ContactShowScreen({Key? key}) : super(key: key);

  @override
  State<ContactShowScreen> createState() => _ContactShowScreenState();
}

class _ContactShowScreenState extends State<ContactShowScreen> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;
  // Contact? contact;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();
      setState(() => _contacts = contacts);
    }
  }

  @override
  Widget build(BuildContext context) {
    // ScreenSize().init(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(child: _body())),
    );
  }

  String returnString(String name) {
    var it = name.characters.iterator;
    for (var i = 0; i <= 8; i++) {
      if (!it.expandNext()) return name;
    }
    it.dropLast(2);
    return "${it.current}\u2026";
  }

  Widget _body() {
    if (_permissionDenied) {
      return const Center(child: Text('Permission denied'));
    }
    if (_contacts == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _contacts!.length,
        itemBuilder: (context, i) => Padding(
            padding: const EdgeInsets.all(12),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateCardScreen(
                        name: _contacts![i].displayName,
                        // number: _contacts![i].id,
                      ),
                    ));
                // // Get.toNamed(Paths.twoWayChating);
              },
              leading: CircleAvatar(
                radius: 25,
                child: Text(_contacts![i].displayName[0]),
              ),
              title: Column(
                children: [
                  Text(_contacts![i].displayName),
                ],
              ),
            )));
  }
}
