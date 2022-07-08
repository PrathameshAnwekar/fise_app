import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_theme.dart';

class Personal_Info_Page extends StatefulWidget {
  const Personal_Info_Page({Key? key}) : super(key: key);

  @override
  State<Personal_Info_Page> createState() => _Personal_Info_PageState();
}

class _Personal_Info_PageState extends State<Personal_Info_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.black26,
              height: 1.0,
            )),
        //
        backgroundColor: Colors.white,
        title: Text(
          "personal info",
          style: AppThemeData.textTheme.headline1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: CircleAvatar(
                  // backgroundImage: ,
                  radius: 80,
                  backgroundColor: Colors.transparent,
                  child: SvgPicture.asset(
                    "assets/images/setting_icons/personal_info2.svg",
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 22, 8, 8),
                      child: Text("Name", style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Email", style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Phone", style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("DOB", style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Address", style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Aadhar", style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("PAN", style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("KYC", style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: const EdgeInsets.only(top: 19.0),
                          child: Text(
                            "AKASHAT AGRAWAL", overflow: TextOverflow.ellipsis,
                            // widget.username.toString().toUpperCase()
                            style: TextStyle(
                              fontSize: 17.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 19.0),
                          child: Text(
                            "example@gmail.com",
                            overflow: TextOverflow.ellipsis,
                            // widget.email.toString()
                            style: TextStyle(
                              fontSize: 17.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 19.0),
                          child: Text(
                            "1234567899", overflow: TextOverflow.ellipsis,
                            // widget.contactNumber.toString()

                            style: TextStyle(
                              fontSize: 17.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 19.0),
                          child: Text(
                            "08/02/2292",
                            // widget.dob.toString()

                            style: TextStyle(
                              fontSize: 17.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 19.0),
                          child: Text(
                            "LMG 41, Sector 30, Faridabad, Haryana, India",
                            overflow: TextOverflow.ellipsis,
                            // widget.address.toString()
                            style: TextStyle(
                              fontSize: 17.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 19.0),
                          child: Text(
                            "0000000000000", overflow: TextOverflow.ellipsis,
                            // widget.aadhar.toString()
                            style: TextStyle(
                              fontSize: 17.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 19.0),
                          child: Text(
                            "ghjio123931", overflow: TextOverflow.ellipsis,
                            // widget.pannumber.toString().toUpperCase()
                            style: TextStyle(
                              fontSize: 17.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 19.0),
                          child: Text(
                            "verified",
                            style: TextStyle(
                              fontSize: 17.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80),
            const Text("To chane personal info on this page,"),
            TextButton(
              onPressed: () {
                //
              },
              child: const Text("Contact Us"),
            ),
          ],
        ),
      ),
    );
  }
}
