import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Database{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String _email;
  final String _password;
  FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User> get user {
  return _auth.onAuthStateChanged;
  }
  Database(  this._email,  this._password);
  Future signIn(String email, String password) async {

    try{
      var signInRes = await _auth.signInWithEmailAndPassword(email: email, password: password);

       return signInRes.user;

    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  Future signOut(){
    try{
      return _auth.signOut();
    }catch (e) {
      return null;
    }
  }
  List studentlist=[];
  final CollectionReference collectionRef=
  FirebaseFirestore.instance.collection("Data");
  Future getData() async {
    try {
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          studentlist.add(result.data());
        }
      });

      return studentlist;
    } catch (e) {
      debugPrint("error -$e");
      return null;
    }
  }

}
