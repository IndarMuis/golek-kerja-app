import 'package:flutter/material.dart';
import 'package:lokerku/app/theme.dart';

class DetailJobContent extends StatelessWidget {
  const DetailJobContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String persyaratan = """
  1. Bisa Mengoprasikan Komputer
  2. Perempuan
  3. Usia Maksimal 45 Tahun
  4. Bertempat tinggal di sekitar Makassar
             """;
    String deskripsi = """
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. At venenatis porta nulla quisque. Facilisi cras pulvinar nec pharetra tincidunt fames condimentum vel. Purus integer viverra nisl urna. Hac blandit donec lorem id interdum pellentesque in. Non, vestibulum libero natoque vulputate massa suscipit natoque diam. Commodo aliquam in tempor nam accumsan. Odio dolor tincidunt sit gravida nibh. Egestas habitant feugiat integer pharetra, convallis non. Et diam, bibendum nunc,  dapibus nec erat at nunc fusce. Mi augue dui, purus nec convallis porta. Vitae sem at suspendisse magna libero tellus et.
             """;
    return Container(
      padding: EdgeInsets.all(defaultMargin),
      margin: EdgeInsets.all(defaultMargin),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/gambar1.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bumdes Tuah Baru",
                        style: primaryTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: medium,
                        ),
                      ),
                      Text(
                        "Ditayangkan pada 28 September 2021",
                        style: primaryTextStyle.copyWith(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.bookmark_border_sharp,
                size: 30,
                color: Colors.grey,
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Kasir",
                style: primaryTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                "Gaji 1,5 - 2 jt",
                style: primaryTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: light,
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Persyaratan :",
            style: primaryTextStyle.copyWith(
              fontSize: 15,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            persyaratan,
            style: primaryTextStyle.copyWith(
              fontSize: 15,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Lokasi :",
            style: primaryTextStyle.copyWith(
              fontSize: 15,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "  Selatbaru, Makassar, Sulawesi Selatan",
            style: primaryTextStyle.copyWith(
              fontSize: 15,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Deskripsi Pekerjaan :",
            style: primaryTextStyle.copyWith(
              fontSize: 15,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            deskripsi,
            style: primaryTextStyle.copyWith(
              fontSize: 15,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
