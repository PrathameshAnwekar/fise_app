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

  factory UserData.fromDocument(DocumentSnapshot doc) {
    var docData = doc.data().toString();
    return UserData(
        email: docData.contains('email') ? doc.get('email') : 'not set',
        username:
            docData.contains('username') ? doc.get('username') : 'not set',
        photoUrl:
            docData.contains('photoUrl') ? doc.get('photoUrl') : 'not set',
        uid: docData.contains('uid') ? doc.get('uid') : 'not set',
        pancard: docData.contains('pancard') ? doc.get('pancard') : 'not set',
        phoneNumber: docData.contains('phoneNumber')
            ? doc.get('phoneNumber')
            : 'not set',
        aadhar: docData.contains('aadhar') ? doc.get('aadhar') : 'not set',
        address: docData.contains('address') ? doc.get('address') : 'not set',
        dob: docData.contains('dob') ? doc.get('dob') : 'not set',
        kyc: docData.contains('kyc') ? doc.get('kyc') : 'not set');
  }
}
