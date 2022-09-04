import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fise_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/user_data.dart';
import '../../util/initializer.dart';

final userUid = FirebaseAuth.instance.currentUser!.uid;
var _aadharFrontImage = null;
var _aadharBackImage = null;
var _panCardImage = null;

class SignupPage extends StatefulWidget {
  static const routeName = '/Signuppage';

  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // await saveDetailsToFirebase();
          await checkValues();
          await Navigator.of(context).pushNamedAndRemoveUntil(
              InitializerWidget.routeName, (route) => false);
        },
        backgroundColor: AppThemeData.lightColorScheme.primary,
        label: Container(
          width: SizeConfig.screenWidth * 0.82,
          child: Center(
            child: Text(
              "submit",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverCustomHeaderDelegate(
                title: '   enter your details',
                collapsedHeight: 50,
                expandedHeight: 240,
                paddingTop: MediaQuery.of(context).padding.top,
                coverImg: "assets/images/test.png"),
          ),
          SliverToBoxAdapter(
            child: SignupTiles(),
          )
        ],
      ),
    );
  }
}

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final String coverImg;
  final String title;
  String statusBarMode = 'dark';

  SliverCustomHeaderDelegate({
    required this.collapsedHeight,
    required this.expandedHeight,
    required this.paddingTop,
    required this.coverImg,
    required this.title,
  });

  @override
  double get minExtent => collapsedHeight + paddingTop;

  @override
  double get maxExtent => expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  void updateStatusBarBrightness(shrinkOffset) {
    if (shrinkOffset > 50 && statusBarMode == 'dark') {
      statusBarMode = 'light';
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ));
    } else if (shrinkOffset <= 50 && statusBarMode == 'light') {
      statusBarMode = 'dark';
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));
    }
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha =
        (shrinkOffset / (maxExtent - minExtent) * 255).clamp(0, 255).toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha =
          (shrinkOffset / (maxExtent - minExtent) * 255).clamp(0, 255).toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    updateStatusBarBrightness(shrinkOffset);

    return Container(
      height: maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(coverImg, fit: BoxFit.cover),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: makeStickyHeaderBgColor(shrinkOffset),
              child: SafeArea(
                bottom: false,
                child: SizedBox(
                  height: collapsedHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          //
                          Navigator.pop(context);
                        },
                        icon: const FaIcon(
                          Icons.arrow_back_ios,
                          // color: Colors.white,
                        ),
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: makeStickyHeaderTextColor(shrinkOffset, false),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignupTiles extends ConsumerStatefulWidget {
  const SignupTiles({super.key});

  @override
  ConsumerState<SignupTiles> createState() => _SignupTilesState();
}

class _SignupTilesState extends ConsumerState<SignupTiles> {
  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    var _userData = ref.watch(currentUserDataProvider);

    _emailController.text = _userData!.email;
    _mobileController.text = _userData.phoneNumber;

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 233, 233, 233),
            child: Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 0, 4),
            child: Text(
              "enter your details",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Divider(
            endIndent: 210,
            indent: 20,
            thickness: 1,
            color: Colors.black.withOpacity(0.5),
          ),
          //
          detailTile(
            title: 'name',
            detailcontroller: _nameController,
            hinttext: '',
          ),
          detailTile(
            title: "mobile",
            useablebool: false,
            detailcontroller: _mobileController,
            hinttext: "",
          ),
          detailTile(
            title: "email",
            useablebool: false,
            detailcontroller: _emailController,
            hinttext: "",
          ),
          detailTile(
            title: "address",
            detailcontroller: _addressController,
            hinttext: "",
          ),
          detailTile(
            title: "state",
            detailcontroller: _stateController,
            hinttext: "",
          ),
          detailTile(
            title: "pincode",
            detailcontroller: _pincodeController,
            hinttext: "",
          ),
          detailTile(
            title: "aadhar card no.",
            detailcontroller: _aadhaarcardnoController,
            hinttext: "",
          ),
          detailTile(
            title: "pan no.",
            detailcontroller: _panNoController,
            hinttext: "",
          ),

          //
          //
          _aadharFrontImage == null
              ? imagesTile(
                  title: "upload your aadhaar front side",
                )
              : Center(
                  child: Image.file(
                    File(_aadharFrontImage.path),
                    fit: BoxFit.cover,
                  ),
                ),
          _aadharBackImage == null
              ? imagesTile(
                  title: "upload your aadhaar back side",
                )
              : Center(
                  child: Image.file(
                    File(_aadharBackImage.path),
                    fit: BoxFit.cover,
                  ),
                ),
          _panCardImage == null
              ? imagesTile(title: "upload your pan")
              : Center(
                  child: Image.file(
                    File(_panCardImage.path),
                    fit: BoxFit.cover,
                  ),
                ),
          //
          //
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  imagesTile({required String title}) {
    return GestureDetector(
      onTap: () async {
        try {
          final XFile? pickedFile = await _picker.pickImage(
            source: ImageSource.gallery,
            maxWidth: SizeConfig.screenWidth,
            maxHeight: SizeConfig.screenHeight * 0.25,
            imageQuality: 100,
          );
          setState(() {
            title.contains("back") ? _aadharBackImage = pickedFile : 0;
            title.contains("front") ? _aadharFrontImage = pickedFile : 0;
            title.contains("pan") ? _panCardImage = pickedFile : 0;
          });
        } catch (e) {}
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
            child: Text(
              title,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Container(
              height: SizeConfig.screenHeight * 0.25,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                color: Color(0xffECF1F1),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Center(
                  child: Icon(
                Icons.camera_alt,
                size: 45,
                color: Colors.white,
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class detailTile extends StatelessWidget {
  const detailTile(
      {super.key,
      required this.title,
      required this.detailcontroller,
      required this.hinttext,
      this.useablebool});

  final useablebool;
  final String title;
  final String hinttext;
  final TextEditingController detailcontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.lightBlueAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
            child: Text(
              title,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: TextFormField(
              enabled: useablebool,
              controller: detailcontroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              },
              style: TextStyle(fontSize: 19.7),
              decoration: InputDecoration(
                hintText: hinttext,
                filled: true,
                fillColor: Color(0xffECF1F1),
                contentPadding: EdgeInsets.fromLTRB(10, 1, 10, 1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

TextEditingController _nameController = TextEditingController();
TextEditingController _mobileController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _addressController = TextEditingController();
TextEditingController _stateController = TextEditingController();
TextEditingController _pincodeController = TextEditingController();
TextEditingController _aadhaarcardnoController = TextEditingController();
TextEditingController _panNoController = TextEditingController();

checkValues() async {
  String name = _nameController.text.trim();
  String address = _addressController.text.trim();
  String aadhar = _aadhaarcardnoController.text.trim();
  String pancard = _panNoController.text.trim();
  String state = _stateController.text.trim();
  String pincode = _pincodeController.text.trim();

  if (name == "" ||
      address == "" ||
      aadhar == "" ||
      pancard == "" ||
      state == "" ||
      pincode == "") {
    log("please fill all the details");
    //snackbar
  } else if (double.tryParse(pincode) == null || pincode.length != 6) {
    log("invalide pincode");
    // snakbar
  } else if (double.tryParse(aadhar) == null || aadhar.length != 12) {
    log("invalid aadhar no.");
    // snakbar
  } else {
    log("value are filled");
    await saveDetailsToFirebase();
  }
}

saveDetailsToFirebase() async {
  await FirebaseStorage.instance
      .ref()
      .child("${userUid}/aadharfront")
      .putFile(File(_aadharFrontImage.path));
  await FirebaseStorage.instance
      .ref()
      .child("${userUid}/aadharback")
      .putFile(File(_aadharBackImage.path));
  await FirebaseStorage.instance
      .ref()
      .child("${userUid}/pancard")
      .putFile(File(_panCardImage.path));
  await FirebaseFirestore.instance.collection('Profiles').doc(userUid).set({
    'username': _nameController.text,
    'phoneNumber': _mobileController.text,
    'email': _emailController.text,
    'address': _addressController.text +
        ',' +
        _stateController.text +
        ',' +
        _pincodeController.text,
    'aadhar': _aadhaarcardnoController.text,
    'pancard': _panNoController.text,
  });
}
