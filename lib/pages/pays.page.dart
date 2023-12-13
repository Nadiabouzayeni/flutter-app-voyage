import 'package:atelier3/pages/paysDetails.page.dart';
import 'package:flutter/material.dart';

class PaysPage extends StatelessWidget {
  final TextEditingController _paysController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Pays'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 100),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: _paysController,
              decoration: InputDecoration(
                prefix: Icon(Icons.place),
                hintText: "Pays",
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                _onGetPaysDetails(context);
              },
              child: Text('Chercher', style: TextStyle(fontSize: 22)),
            ),
          ),
        ],
      ),
    );
  }

  void _onGetPaysDetails(BuildContext context) {
    String pays = _paysController.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaysDetailsPage(pays),
      ),
    );
  }
}
