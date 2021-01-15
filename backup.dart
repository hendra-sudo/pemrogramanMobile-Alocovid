

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





maint.dart

child: Image.asset(
                      "assets/images/map.png",
                      fit: BoxFit.contain,
                    ),