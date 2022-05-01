import 'package:flutter/material.dart';
import 'package:lokerku/app/theme.dart';

class RecommendationJobCard extends StatelessWidget {
  final String? namaToko;
  final String? gambar;
  final String? lowongan;
  final String? alamat;
  final String? tanggal;
  const RecommendationJobCard(
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
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${namaToko}", style: primaryTextStyle.copyWith(fontSize: 15, fontWeight: medium), overflow: TextOverflow.ellipsis,),
          SizedBox(height: 10,),
          Image.asset("${gambar}",),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(child: Text("${lowongan}", style: primaryTextStyle.copyWith(fontSize: 15, fontWeight: medium),)),
              Icon(Icons.bookmark_outline_sharp, color: Colors.grey,)
            ],
          ),
          SizedBox(height: 5,),
          Text("${alamat}", style: primaryTextStyle.copyWith(fontSize: 15, fontWeight: medium),),
          SizedBox(height: 5,),
          Text("${tanggal}", style: primaryTextStyle.copyWith(fontSize: 15, fontWeight: medium),),
        ],
      ),
    );
  }
}
