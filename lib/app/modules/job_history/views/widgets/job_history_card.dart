import 'package:flutter/material.dart';
import 'package:lokerku/app/theme.dart';

class JobHistoryCard extends StatelessWidget {
  final String? namaToko;
  final String? gambar;
  final String? lowongan;
  final String? alamat;
  final String? tanggal;
  const JobHistoryCard(
      {Key? key,
      this.namaToko,
      this.gambar,
      this.lowongan,
      this.alamat,
      this.tanggal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
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
