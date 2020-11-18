import 'package:covid_19/constant.dart'; // import adalah tempat untuk mendeklarasikan atau mengimpor library yang dibutuhkan oleh aplikasi
import 'package:covid_19/widgets/counter.dart';
import 'package:covid_19/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp()); //fungsi utama dalam aplikasi yang akan menjadii entry point yang akan dieksekusi saat aplikasi pertama kali dibuka

class MyApp extends StatelessWidget { // tempat untuk membuat wigdet yang konfigurasinya diinisiasi sejak awal. MyApp adalah widget induk
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //MaterialApp adlah widget yang membungkus beberapa widget yang menggunakan tema material design
      debugShowCheckedModeBanner: false, //menghapus banner di hot reload
      title: 'Covid 19', //judul
      theme: ThemeData( //tema
          scaffoldBackgroundColor: kBackgroundColor, // Scaffold adalah widget untuk struktur dasar material design
          fontFamily: "Poppins", //font text
          textTheme: TextTheme( // widget untuk membuat text
            body1: TextStyle(color: kBodyTextColor), //warna text
          )),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget { //widget yang dapat diperbarui kapanpun sesuai kebutuhan
  @override
  _HomeScreenState createState() => _HomeScreenState(); //kode dasar statefull widget
}

class _HomeScreenState extends State<HomeScreen> {
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

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) { //kode dasar statefull widget
    return Scaffold(
      body: SingleChildScrollView( //memuat content yang akan ditampilkan
        controller: controller,
        child: Column( //menata widget berjejer kebawah
          children: <Widget>[ //memasukkan widget dalam children
            MyHeader(
              image: "assets/icons/Drcorona.svg", //untuk memanggil gambar di asset
              textTop: "Dirumah Saja !!!", //Tulisan Atas
              textBottom: " ", //tulisan bawah
              offset: offset,
            ),
            Container( //untuk menampung objek
              margin: EdgeInsets.symmetric(horizontal: 20), //memberikan margin sebesar value secara horizontal
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),//memberikan padding sebesar value secara horizontal dan vertikal
              height: 60, //tinggi
              width: double.infinity,
              decoration: BoxDecoration( //mengatur style dari container sesuai keinginan
                color: Colors.white, //warna box
                borderRadius: BorderRadius.circular(25),//untuk mengatur lengkungan sudut kotak
                border: Border.all( //semua di beri border
                  color: Color(0xFFE5E5E5), //warna border
                ),
              ),
              child: Row(//menata widget berjejer ke samping
                children: <Widget>[ //memasukkan widget dalam children
                  SvgPicture.asset("assets/icons/maps-and-flags.svg"), //mengambil image
                  SizedBox(width: 20), //ukuran box
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                      value: "Indonesia",
                      items: [
                        'Indonesia',

                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), //ukuran box
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20), //memberikan padding sebesar value secara horizontal
              child: Column( //menata widget berjejer kebawah
                children: <Widget>[ //memasukkan widget dalam children
                  Row( // untuk mengatur widget agar tersusun secara horizontal
                    children: <Widget>[ //memasukkan widget dalam children
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Update\n",
                              style: kTitleTextstyle,
                            ),
                            TextSpan(
                              text: "Terakhir Update 28 Maret 2020 ",
                              style: TextStyle(
                                color: kTextLightColor, //warnatext
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),

                    ],
                  ),
                  SizedBox(height: 20),
                  Container( //untuk menampung obyek
                    padding: EdgeInsets.all(20), //memberikan padding sebesar value yang ada didalam semua sisi(kanan, kiri,atas,bawah)
                    decoration: BoxDecoration( //mengatur style dari container sesuai keinginan
                      borderRadius: BorderRadius.circular(20), //untuk mengatur lengkungan sudut kotak
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow( //bayangn box
                          offset: Offset(0, 4),
                          blurRadius: 30, //radius blur
                          color: kShadowColor, //warna
                        ),
                      ],
                    ),
                    child: Row( //menata widget berjejer ke samping
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // mengatur aligment dari widget yang ada didalamnya. bersifat sejalan dengan widgetnya
                      children: <Widget>[ //memasukkan widget dalam children
                        Counter(
                          color: kInfectedColor, //warna
                          number: 1046, //angka
                          title: "Positif", //judul
                        ),
                        Counter(
                          color: kDeathColor,//warna
                          number: 87,//angka
                          title: "Meninggal",//judul
                        ),
                        Counter(
                          color: kRecovercolor,//warna
                          number: 46,//angka
                          title: "Sembuh",//judul
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row( // untuk mengatur widget agar tersusun secara horizontal
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // mengatur aligment dari widget yang ada didalamnya. bersifat sejalan dengan widgetnya
                    children: <Widget>[ //memasukkan widget dalam children
                      Text(
                        "Persebaran Virus",
                        style: kTitleTextstyle,
                      ),

                    ],
                  ),
                  Container(//untuk menampung obyek
                    margin: EdgeInsets.only(top: 20), //memberikan margin ssebesar value pada bagian atas
                    padding: EdgeInsets.all(20), //memberikan padding sebesar value yang ada didalam semua sisi(kanan, kiri,atas,bawah)
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration( //mengatur style dari container sesuai keinginan
                      borderRadius: BorderRadius.circular(20), //untuk mengatur lengkungan sudut kotak
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/images/map.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
