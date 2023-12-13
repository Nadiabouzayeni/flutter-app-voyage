import 'package:atelier3/pages/meteoDetails..page.dart';
import 'package:flutter/material.dart';

import '../menu/drawer.widget.dart';

class MeteoPage extends StatefulWidget {
  @override
  _MeteoPageState createState() => _MeteoPageState();
}

class _MeteoPageState extends State<MeteoPage> {
  final TextEditingController txtVille = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text('Page Météo')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: txtVille,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_city),
                hintText: 'Entrez le nom de la ville',
                labelText: 'Ville',
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _onGetMeteoDetails(context);
              },
              child: Text('Chercher', style: TextStyle(fontSize: 22)),
            ),
          ],
        ),
      ),
    );
  }

  void _onGetMeteoDetails(BuildContext context) {
    String ville = txtVille.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MeteoDetailsPage(ville),
      ),
    );
    txtVille.text = "";
  }
}
