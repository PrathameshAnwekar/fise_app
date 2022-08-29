import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/payments/cashfree_pg.dart';
import 'package:fise_app/screens/asset_screens/equity/basket_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InvestMorePage extends StatefulWidget {
  const InvestMorePage({super.key});

  @override
  State<InvestMorePage> createState() => _InvestMorePageState();
}

class _InvestMorePageState extends State<InvestMorePage> {
  @override
  Widget build(BuildContext context) {
    var amountController = TextEditingController();

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"))),
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
                      padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
                      child: Text(
                        "enter the amount",
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
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        "this amount will be added to your\nequity cart",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                      child: TextField(
                        controller: amountController,
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                          hintText: "₹ 0",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Color(0xffD8D8D8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffD8D8D8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // 500
                          ElevatedButton(
                            onPressed: () {
                              const newText = '500';
                              final updatedText = newText;
                              amountController.value =
                                  amountController.value.copyWith(
                                text: updatedText,
                                selection: TextSelection.collapsed(
                                    offset: updatedText.length),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffD8D8D8),
                            ),
                            child: Text(
                              "+500",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              const newText = '1000';
                              final updatedText = newText;
                              amountController.value =
                                  amountController.value.copyWith(
                                text: updatedText,
                                selection: TextSelection.collapsed(
                                    offset: updatedText.length),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffD8D8D8),
                            ),
                            child: Text(
                              "+1000",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              const newText = '1500';
                              final updatedText = newText;
                              amountController.value =
                                  amountController.value.copyWith(
                                text: updatedText,
                                selection: TextSelection.collapsed(
                                    offset: updatedText.length),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffD8D8D8),
                            ),
                            child: Text(
                              "+1500",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              const newText = '2000';
                              final updatedText = newText;
                              amountController.value =
                                  amountController.value.copyWith(
                                text: updatedText,
                                selection: TextSelection.collapsed(
                                    offset: updatedText.length),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffD8D8D8),
                            ),
                            child: Text(
                              "+2000",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: SizeConfig.screenWidth * 0.8,
                          height: 47,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CashfreePage(orderAmount: amountController.text, orderNote: 'EQUITY',);
                              }));
                            },
                            child: Text(
                              "continue",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
