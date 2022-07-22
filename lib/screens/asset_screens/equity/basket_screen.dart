import 'package:auto_size_text/auto_size_text.dart';
import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/util/initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasketScreen extends ConsumerStatefulWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends ConsumerState<BasketScreen> {
  int sum = 0;
  @override
  Widget build(BuildContext context) {
    var basketMap = ref.read(basketStocksProvider.state).state;
    var keys = basketMap.keys.toList();
    basketMap.forEach(
      (key, value) {
        sum += value;
      },
    );
    print(sum);
    return Scaffold(
      appBar: AppBar(title: Text('basket')),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: AutoSizeText(
                      'Stocks (${keys.length}/10)',
                      style: TextStyle(fontSize: 17),
                    )),
              ),
              Expanded(
                child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(20),
                    child: AutoSizeText(
                      'Weightage',
                      style: TextStyle(fontSize: 17),
                    )),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: basketMap.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: AutoSizeText(
                      keys[index].companyName,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.all(4),
                          alignment: Alignment.center,
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(color: Colors.grey)),
                          child: AutoSizeText(
                            basketMap[keys[index]].toString(),
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        AutoSizeText(
                          (basketMap[keys[index]]! / sum * 100)
                                  .toStringAsFixed(0) +
                              '%',
                        ),
                      ],
                    ),
                  );
                })),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        width: SizeConfig.screenWidth * 0.8,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}



  