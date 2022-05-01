import 'package:flutter/material.dart';
import 'package:lokerku/app/theme.dart';

class RecommendationHeader extends StatelessWidget {
  const RecommendationHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 190,
        width: double.infinity,
        color: primaryColor,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Cari Pekerjaan",
                    style: primaryTextStyle.copyWith(
                      fontSize: 30,
                      fontWeight: semiBold,
                      color: backgroundColor,
                    ),
                  ),
                ),
                Icon(
                  Icons.message,
                  size: 30,
                  color: backgroundColor,
                )
              ],
            ),
            SizedBox(height: 35),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Pencarian",
                      hintStyle: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: light,
                          color: Colors.black.withOpacity(0.5)),
                      contentPadding: EdgeInsets.all(13),
                     focusColor: backgroundColor,
                     hoverColor: backgroundColor,
                      disabledBorder: InputBorder.none,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      fillColor: backgroundColor.withOpacity(0.7),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Icon(Icons.filter_alt, size: 30, color: backgroundColor,),
              ],
            )
          ],
        ));
  }
}
