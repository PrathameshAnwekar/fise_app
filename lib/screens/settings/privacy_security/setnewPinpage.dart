import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class setNewPinpage extends StatelessWidget {
  const setNewPinpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/background.png"),
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            SizedBox(height: 180),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(27),
                      topLeft: Radius.circular(27)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 25, 20, 10),
                      child: Text(
                        "reset login PIN",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                    Divider(
                      endIndent: 200,
                      indent: 20,
                      thickness: 1,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 50),
                      child: Text(
                        "enter new pin",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                    Center(
                      child: Pinput(
                        defaultPinTheme: PinTheme(
                          height: 60,
                          width: 60,
                          textStyle: TextStyle(fontSize: 24),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.black)),
                          ),
                        ),
                        validator: (value) {
                          //
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
