import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joki_apps/app/modules/topup/controller/topup_controller.dart';

class TopUp extends GetView<TopUpController> {
  const TopUp({Key? key}) : super(key: key);
  back() {
    Get.offAllNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => back(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Top up"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed('list-all-topup');
                },
                icon: Icon(Icons.history))
          ],
        ),
        body: Obx(
          () => controller.isLoadinbg.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 10, right: 10, left: 10, bottom: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Silahkan pilih nominal",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BalanceWidget(
                              tittle: "50.000",
                              topUpController: controller,
                            ),
                            BalanceWidget(
                              tittle: "100.000",
                              topUpController: controller,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BalanceWidget(
                              tittle: "150.000",
                              topUpController: controller,
                            ),
                            BalanceWidget(
                              topUpController: controller,
                              tittle: "150.000",
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BalanceWidget(
                              topUpController: controller,
                              tittle: "200.000",
                            ),
                            BalanceWidget(
                              topUpController: controller,
                              tittle: "300.000",
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: controller.nominal,
                            decoration: InputDecoration(hintText: "Nominal"),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: Get.height * 6 / 100,
                              width: Get.width * 40 / 100,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.toNamed('pending-topup');
                                },
                                child: Text("Upload Bukti"),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 6 / 100,
                              width: Get.width * 40 / 100,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                      title: "Konfirmasi",
                                      middleText:
                                          "Apakah anda yakin ingin melakukan top up sebesar Rp. ${controller.nominal.text} ?",
                                      textConfirm: "Ya",
                                      textCancel: "Tidak",
                                      onConfirm: () {
                                        controller.topup();
                                      });
                                },
                                child: Text("Top Up"),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    Key? key,
    required this.tittle,
    required this.topUpController,
  }) : super(key: key);
  final String tittle;
  final TopUpController topUpController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        topUpController.nominal.text = tittle.replaceAll('.', '');
        print(tittle);
      },
      child: Container(
        height: Get.height * 8 / 100,
        width: Get.width * 40 / 100,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 0.6,
              spreadRadius: 0.4,
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.money),
            Text(
              tittle,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
