import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {
      'name': 'Wissal Ren',
      'email': 'wissal.ren@gmail.com',
      'phone': '+212 612345678'
    },
    {
      'name': 'Hanane El Youbi',
      'email': 'Hanane.elyoubi@gmail.com',
      'phone': '+212 677889900'
    },
    {
      'name': 'Mohamed kerbal',
      'email': 'mohamed.kerbal@devmail.com',
      'phone': '+212 645678910'
    },
    {
      'name': 'Salma Mouline',
      'email': 'salma.mouline@techmail.com',
      'phone': '+212 698745123'
    },
    {
      'name': 'Sara Ziani',
      'email': 'sara.ziani@workmail.com',
      'phone': '+212 611223344'
    },
    {
      'name': 'Reda El Fassi',
      'email': 'reda.elfassi@startup.ma',
      'phone': '+212 600123456'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          final initials = contact['name']!
              .split(' ')
              .map((e) => e.isNotEmpty ? e[0] : '')
              .take(2)
              .join();

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  initials,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(contact['name']!),
              subtitle: Text("${contact['email']}\n${contact['phone']}"),
              isThreeLine: true,
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Action à ajouter si besoin
              },
            ),
          );
        },
      ),
    );
  }
}
