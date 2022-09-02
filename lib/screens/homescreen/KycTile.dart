import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/screens/authentication/signupPage.dart';
import 'package:flutter/material.dart';

class kycTileHome extends StatelessWidget {
  const kycTileHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: const Text(
            "verify KYC",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(22.0, 0, 0, 15),
          child: Container(
            height: 2,
            color: Colors.grey.withOpacity(0.5),
            width: SizeConfig.screenWidth * 0.4,
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 28),
          child: Text(
            "start your dynamic investment journey today by verifying your KYC!",
          ),
        ),
        Center(
          child: Container(
            // height: 80,
            width: 180,
            child: OutlinedButton(
              onPressed: () {
                //
                Navigator.pushNamed(context, SignupPage.routeName);
                //
              },
              style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.2, color: Color(0xff005251)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // dot image here Image here
                  Text(
                    "Vericy KYC",
                    style: TextStyle(
                      color: Color(0xff005251),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Icon(Icons.arrow_forward_ios_sharp)
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
