import 'package:bytebank_v2/database/app_database.dart';
import 'package:bytebank_v2/models/contact.dart';
import 'package:bytebank_v2/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
        future: findAll(),
        builder: (context, snapshop) {
          switch (snapshop.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [CircularProgressIndicator(), Text('Buscando')],
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshop.data
                  as List<Contact>; //solução alternativa devido ao null safety
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return _ContactItem(contact);
                },
                itemCount: contacts.length,
              );
          }

          return Text('Erro desconhecido');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => ContactForm(),
            ),
          )
              .then(
            (value) {
              setState(() {});
            },
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _ContactItem extends StatefulWidget {
  final Contact contact;

  _ContactItem(this.contact);

  @override
  State<_ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<_ContactItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          widget.contact.name,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          widget.contact.accountNumber.toString(),
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
