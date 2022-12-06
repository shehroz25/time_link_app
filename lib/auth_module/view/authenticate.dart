import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_link_shehroz/auth_module/view/login_view.dart';
import 'package:time_link_shehroz/utils/navigation_bar.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return const BottomNav();
    } else {
      return const Login();
    }
  }
}
