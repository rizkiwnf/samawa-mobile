import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AfterLogin extends StatelessWidget{
  void _handleSignOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pop(context);
    } catch (e) {
      print("Error signing out: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    return Center(
      child: Container(
        child: Column(
          children: [
            Text('Selamat Anda Telah Login'),
            Text('${user?.displayName ?? "Guest"}!'),
            ElevatedButton(
                onPressed: () => _handleSignOut(context),
                child: Text('SignOut')
            )
          ],
        ),
      ),
    );
  }
}