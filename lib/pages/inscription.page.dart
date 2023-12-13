import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InscriptionPage extends StatelessWidget {
  late SharedPreferences prefs;
  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_password = TextEditingController();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Inscription',
          style: TextStyle(fontSize: 24, color: Colors.white ),
          textAlign: TextAlign.center,),

      ),
      body:
      Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txt_login,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: "Utilisateur",
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txt_password,
              obscureText: true, // This hides the password text
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock), // Use a lock icon for the password
                hintText: "Mot de passe",
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
                _onInscrire(context);
              },
              child: Text('Inscription',
                  style: TextStyle(fontSize: 22, color: Colors.white)),
            ),

          ),
          TextButton(
              child : Text("J'ai Déja un compte ",
                style: TextStyle(fontSize: 22, color: Colors.grey, decoration: TextDecoration.underline,),),
              onPressed:(){
                Navigator.pop(context);
                Navigator.pushNamed(context,'/authentification');

              }),

        ],
      ),
    );
  }

  Future<void> _onInscrire(BuildContext context) async {
    prefs =await SharedPreferences.getInstance();
    if(txt_login.text.isNotEmpty && txt_password.text.isNotEmpty){
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword (
            email: txt_login.text.trim(), password: txt_password.text.trim()); Navigator.pop(context);
        Navigator.pushNamed(context, '/home');
      } on FirebaseAuthException catch (e) {
        SnackBar snackBar = SnackBar (content: Text("")); if (e.code == 'weak-password') {
          snackBar = SnackBar(
            content: Text('Mot de passe faible'), ); } else if (e.code == 'email-already-in-use') {
          snackBar = SnackBar( content: Text('Email déjà existant'), );
        }
        ScaffoldMessenger.of(context).showSnackBar (snackBar);
      }
    }else{
      const snackBar=SnackBar(content: Text('Id ou mot passe vides'),);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
