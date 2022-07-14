import 'package:auto_size_text/auto_size_text.dart';
import 'package:fise_app/constants/constants.dart';
import 'package:flutter/material.dart';

class GeneralStatusWidget extends StatelessWidget {
  const GeneralStatusWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AutoSizeText(
            'Savings',
            maxLines: 1,
            style:  TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.01,
          ),
          const AutoSizeText(
            '\$13,000',
            maxLines: 1,
            style:  TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.02,
          ),

          Container(
            height: 1,
            color: Colors.white,
            width: SizeConfig.screenWidth * 0.2,
          ),
          ////For some reason divider isnt visible
          SizedBox(
            height: SizeConfig.screenHeight * 0.02,
          ),

          const AutoSizeText(
            'Current Value',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            maxLines: 1,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.01,
          ),
          const AutoSizeText(
            '\$17,000',
            style:  TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
            maxLines: 1,
          )
        ],
      ),
    );
  }
}
