import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:time_link_shehroz/auth_module/view/login_view.dart';
import 'package:path/path.dart' as path;

Future<User?> createAccount(String name, String email, String password,
    String businessphone, String personalphone, File url) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    UserCredential userCrendetial = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    print("Account created Succesfull");

    userCrendetial.user!.updateDisplayName(name);

    Reference imageUrl = FirebaseStorage.instance
        .ref()
        .child('profile/${path.basename(url.path)}');
    await imageUrl.putFile(File(url.path));
    String image = await imageUrl.getDownloadURL();

    await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
      "business name": name,
      "email": email,
      "imageUrl": image,
      "business password": password,
      "business phone number": businessphone,
      "personal phone number": personalphone,
      "uid": _auth.currentUser!.uid,
    });

    return userCrendetial.user;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> logIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    print("Login Sucessfull");
    _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) => userCredential.user!.updateDisplayName(value['name']));

    return userCredential.user;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> updateProfile(TextEditingController nameController,
    TextEditingController passwordController, File url) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Reference imageUrl = FirebaseStorage.instance
      .ref()
      .child('profile/${path.basename(url.path)}');
  await imageUrl.putFile(File(url.path));
  String image = await imageUrl.getDownloadURL();
  await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
    'business name': nameController.text,
    'business password': passwordController.text,
    'imageUrl': image
  });
  return null;
}

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
    });
  } catch (e) {
    print("error");
  }
}

Future order({ordername, ordernumber}) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  await FirebaseFirestore.instance.collection('orders')
      //.doc(FirebaseAuth.instance.currentUser!.email)
      .add({
    "email": FirebaseAuth.instance.currentUser!.email,
    "name": ordername.text,
    "order number": ordernumber.text,
  });
}

deleteorder(id) async {
  await FirebaseFirestore.instance.collection("orders").doc(id).delete();
}
