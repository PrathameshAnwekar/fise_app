import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String email;
  String uid;
  String photoUrl;
  String username;
  String aadhar;
  String pancard;
  String address;
  String phoneNumber;
  String dob;
  String kyc;

  UserData(
      {required this.username,
      required this.uid,
      required this.photoUrl,
      required this.email,
      required this.kyc,
      required this.aadhar,
      required this.address,
      required this.dob,
      required this.pancard,
      required this.phoneNumber});

  factory UserData.fromDocument(DocumentSnapshot document) {
    return UserData(
        email: document['email'] ?? 'not set',
        username: document['username'] ?? 'not set',
        photoUrl: document['photoUrl'] ?? 'not set',
        uid: document['uid'] ?? 'not set',
        pancard: document['pancard'] ?? 'not set',
        phoneNumber: document['phoneNumber'] ?? 'not set',
        aadhar: document['aadhar'] ?? 'not set',
        address: document['address'] ?? 'not set',
        dob: document['dob'] ?? 'not set',
        kyc: document['kyc'] ?? 'not set');
  }
}
