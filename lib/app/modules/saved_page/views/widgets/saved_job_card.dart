import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lokerku/app/modules/saved_page/controllers/saved_page_controller.dart';
import 'package:lokerku/app/theme.dart';

class SavedJobCard extends StatelessWidget {
  final String? namaToko;
  final String? gambar;
  final String? lowongan;
  final String? alamat;
  final String? tanggal;
  final int? idLowongan;
  const SavedJobCard({
    Key? key,
    this.namaToko,
    this.gambar,
    this.lowongan,
    this.alamat,
    this.tanggal,
    this.idLowongan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SavedPageController());
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "${namaToko}",
              style:
                  primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Image.asset(
            "${gambar}",
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "${lowongan}",
                  style:
                      primaryTextStyle.copyWith(fontSize: 17, fontWeight: bold),
                )),
                IconButton(
                  onPressed: () {
                    controller.hapusSimpanLowongan(idLowongan: idLowongan);
                  },
                  icon: Icon(
                    Icons.bookmark,
                    color: primaryColor,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "${alamat}",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Text(
              "${tanggal}",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
          ),
        ],
      ),
    );
  }
}
