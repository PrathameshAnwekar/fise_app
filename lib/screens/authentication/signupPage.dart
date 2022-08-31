import 'package:fise_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/user_data.dart';

class SignupPage extends StatelessWidget {
  static const routeName = '/Signuppage';

  SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //
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
                title: 'enter your details',
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
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: makeStickyHeaderTextColor(shrinkOffset, true),
                        ),
                        onPressed: () => Navigator.pop(context),
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
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _mobileController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _addressController = TextEditingController();
    TextEditingController _stateController = TextEditingController();
    TextEditingController _pincodeController = TextEditingController();
    TextEditingController _aadhaarcardnoController = TextEditingController();
    TextEditingController _panNoController = TextEditingController();

    var _userData = ref.watch(currentUserDataProvider);

    return Column(
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
          hinttext: _userData!.phoneNumber,
        ),
        detailTile(
          title: "email",
          useablebool: false,
          detailcontroller: _emailController,
          hinttext: _userData.email,
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
        ImagesTile(title: "upload your aadhaar front side"),
        ImagesTile(title: "upload your aadhaar back side"),
        ImagesTile(title: "upload your pan"),
//
//
        SizedBox(
          height: 100,
        )
      ],
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
            child: TextField(
              enabled: useablebool,
              controller: detailcontroller,
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

class ImagesTile extends StatelessWidget {
  const ImagesTile({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        )
      ],
    );
  }
}
