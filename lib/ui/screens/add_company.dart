import 'package:flutter/material.dart';

import '../../models/company.dart';

class AddCompany extends StatelessWidget {
  AddCompany({Key? key}) : super(key: key);

  final TextEditingController _textFieldController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouvelle entreprise'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _textFieldController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Le champ ne doit pas être vide';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  prefixIcon: Icon(Icons.apartment),
                  labelText: "Nom de l'entreprise",
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // On récupère le nom
                      final String name = _textFieldController.text;
                      // On instancie l'objet company
                      final Company company = Company(0, name);
                      // Pop + on retourne l'objet company
                      Navigator.of(context).pop(company);
                    }
                  },
                  child: const Text('Valider'))
            ],
          ),
        ),
      ),
    );
  }
}
