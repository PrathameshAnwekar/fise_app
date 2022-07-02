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
          Text(
            'Savings',
            style: AppThemeData.textTheme.headline5,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.01,
          ),
          Text(
            '\$13,000',
            style: AppThemeData.textTheme.bodyText1,
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

          Text(
            'Current Value',
            style: AppThemeData.textTheme.headline5,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.01,
          ),
          Text(
            '\$17,000',
            style: AppThemeData.textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
