import 'package:covid_19/constant.dart';
import 'package:covid_19/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatefulWidget { // widget yang dapat diperbarui sesuai kebutuhan
  @override
  _InfoScreenState createState() => _InfoScreenState(); //kode dasar statefull
}

class _InfoScreenState extends State<InfoScreen> { // widget controller
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() { // implementasi onScroll
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) { //widget utama untuk membuat sebuah halaman
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,

        child: Column( //menata widget column
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "assets/icons/coronadr.svg",
              textTop: "Cari Tahu ",
              textBottom: "Tentang Covid-19.",
              offset: offset,
            ),
            Padding( //membuat atau memposisikan widget child yang dimilikinya dengan memberikan jarak atau padding
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Gejala",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(height: 20), //untuk membuat box horizontal
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row( //untuk menyusun layout
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SymptomCard(
                          image: "assets/images/headache.png",
                          title: "Pusing",
                          isActive: true,
                        ),
                        SymptomCard(
                          image: "assets/images/caugh.png",
                          title: "Batuk",
                        ),
                        SymptomCard(
                          image: "assets/images/fever.png",
                          title: "Demam",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), //ukuran box
                  Text("Pencegahan", style: kTitleTextstyle),
                  SizedBox(height: 20),
                  PreventCard(
                    text:
                    "Gunakan masker yang sesuai standart kesehatan saat keluar rumah untuk mencegah masuknya virus secara langsung",
                    image: "assets/images/mask_1.png",
                    title: "Menggunakan Masker",
                  ),
                  PreventCard(
                    text:
                    " Biasakan mencuci tangan setelah keluar rumah menggunakan sabun atau handsanitizer",
                    image: "assets/images/wash_your_hands_1.png",
                    title: "Cuci Tangan",
                  ),
                  PreventCard(
                    text:
                    "Jaga jarak aman dengan orang lain sekitar 1-2 meter dan hindari kontak sosial serta hindari kerumunan",
                    image: "assets/images/social_distancing_1.png",
                    title: "Jaga Jarak",
                  ),
                  SizedBox(height: 50),
                ],
              ),
            )
          ],

        ),

      ),
    );
  }
}

class PreventCard extends StatelessWidget { // widget yang dapat diperbarui sesuai kebutuhan
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {  // mengatur ukuran dan style PreventCard
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 130,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container( //mengatur penempatan dan ukuran
              height: 126,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Image.asset(image), //untuk pengaturan image pada PreventCard
            Positioned( //posisi image
              left: 130,
              child: Container( //mengatur penempatan dan ukuran
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 145,
                width: MediaQuery.of(context).size.width - 170,
                child: Column( //pengaturan columnnya
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    Expanded( //untuk memperluas child
                      child: Text(
                        text,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Align( //meluruskan
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/forward.svg"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget { // widget yang dapat diperbarui sesuai kebutuhan
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { //widget utama untuk membuat sebuah halaman
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: kActiveShadowColor,
          )
              : BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 6,
            color: kShadowColor,
          ),
        ],
      ),
      child: Column( //menata column
        children: <Widget>[
          Image.asset(image, height: 90),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
