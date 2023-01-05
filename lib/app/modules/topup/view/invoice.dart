import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class InvoiceTopup extends StatelessWidget {
  const InvoiceTopup({Key? key}) : super(key: key);

  back() {
    Get.offAllNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return WillPopScope(
      onWillPop: () => back(),
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 30 / 100,
            decoration: BoxDecoration(color: Colors.blue),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 15 / 100,
                ),
                Container(
                  height: Get.height * 60 / 100,
                  width: Get.width * 70 / 100,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Transaksi Dibuat",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tanggal'),
                          Text(Get.arguments['tanggal']),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Code Unik'),
                          Text(Get.arguments['code'].toString()),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Jenis Transaksi'),
                          Text("Top Up Saldo"),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Transaksi'),
                          Text(Get.arguments['total']),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Bayar'),
                          Text(
                              "${int.parse(Get.arguments['total']) + int.parse(Get.arguments['code'])}"),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Silahkan Transfer via bank ke rekening",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "xxxxxxxx",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Atas Nama xxxxxx",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  width: Get.width * 70 / 100,
                  height: Get.height * 7 / 100,
                  margin: EdgeInsets.only(bottom: 30),
                  child: ElevatedButton(
                    onPressed: () => back(),
                    child: Text('OK'),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
