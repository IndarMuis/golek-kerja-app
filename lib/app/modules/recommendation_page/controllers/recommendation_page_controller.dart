import 'package:get/get.dart';

class RecommendationPageController extends GetxController {
  var rekomendasi = false.obs;
  var disimpan = false.obs;
  
  selectRekomenasi() {
    this.rekomendasi.value = true;
    this.disimpan.value = false;
  }

  selectDisimpan() {
    this.disimpan.value = true;
    this.rekomendasi.value = false;
  }

  List<Toko> list_of_job = [];

  @override
  // ignore: must_call_super
  void onInit() {
    list_of_job = [
    
      Toko(
          namaToko: "Bambu Desa",
          lowongan: "Kasir",
          alamat: "Selatbaru",
          gambar: "assets/gambar1.png",
          tanggal: "28 Oktober 2021"),
      Toko(
          namaToko: "Bambu Desa",
          lowongan: "Kasir",
          alamat: "Selatbaru",
          gambar: "assets/gambar1.png",
          tanggal: "28 Oktober 2021"),
      Toko(
          namaToko: "Bambu Desa",
          lowongan: "Kasir",
          alamat: "Selatbaru",
          gambar: "assets/gambar1.png",
          tanggal: "28 Oktober 2021"),
    ];
  }
}

class Toko {
  String? namaToko, lowongan, alamat, gambar, tanggal;
  Toko({this.namaToko, this.lowongan, this.alamat, this.gambar, this.tanggal});
}
