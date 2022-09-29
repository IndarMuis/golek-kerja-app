import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lokerku/app/modules/recommendation_page/controllers/recommendation_page_controller.dart';
import 'package:lokerku/app/theme.dart';

class RecommendationJobCard extends StatelessWidget {
  final String? id;
  final String? namaToko;
  final String? gambar;
  final String? lowongan;
  final String? alamat;
  final String? tanggal;
  RecommendationJobCard({
    Key? key,
    this.id,
    this.namaToko,
    this.gambar,
    this.lowongan,
    this.alamat,
    this.tanggal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${namaToko}",
              style: primaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: semiBold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
          SizedBox(
            height: 10,
          ),
          Image.asset(
            "${gambar}",
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: Text("Posisi: ${lowongan}",
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: semiBold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Text(
              "Lokasi: ${alamat}",
              style:
                  primaryTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            "${tanggal}",
            style: primaryTextStyle.copyWith(fontSize: 13, fontWeight: medium),
          ),
        ],
      ),
    );
  }
}
