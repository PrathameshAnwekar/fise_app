import 'package:auto_size_text/auto_size_text.dart';
import 'package:fise_app/constants/constants.dart';
import 'package:flutter/material.dart';

class GeneralReturnsWidget extends StatelessWidget {
  const GeneralReturnsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.38,
      height: SizeConfig.screenHeight * 0.15,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AutoSizeText('Returns',maxLines: 1, style: TextStyle(fontSize: 15),),
              Container(
                height: 1,
                color: Colors.grey,
                width: SizeConfig.screenWidth * 0.2,
              ),
              Container(
                height: 2,
              ),
              AutoSizeText('+4000.0',
              maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: AppThemeData.lightColorScheme.primary)),
              Container(
                height: 2,
              ),
              Text('+30.7%',maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      color: AppThemeData.lightColorScheme.primary))
            ]),
      ),
    );
  }
}
