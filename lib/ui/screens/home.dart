import 'package:flutter/material.dart';

import '../../models/address.dart';
import '../../models/company.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Company> _companies = [
    Company(0, 'Entreprise 1', Address('street', 'city', 'postcode')),
    Company(1, 'Entreprise 2', Address('street', 'city', 'postcode')),
    Company(2, 'Entreprise 3', Address('street', 'city', 'postcode')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyDigitalMap'),
      ),
      body: ListView.separated(
        itemCount: _companies.length, // à remplacer,
        itemBuilder: (BuildContext context, int index) {
          final Company company = _companies[index];
          return ListTile(
            leading: const Icon(Icons.apartment),
            title: Text(company.name),
            subtitle: Text(
                '${company.address.street}, ${company.address.postcode} ${company.address.city}'),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 0);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Company? company =
              await Navigator.of(context).pushNamed('/addCompany') as Company?;

          if (company != null) {
            setState(() {
              _companies.add(company);
            });
          }

          // Navigator.of(context).pushNamed<Company?>('/addCompany').then((company) {
          //
          // });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
