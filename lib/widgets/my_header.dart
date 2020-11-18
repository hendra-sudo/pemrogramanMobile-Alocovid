import 'package:covid_19/constant.dart';
import 'package:covid_19/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHeader extends StatefulWidget {   //header Widget yang dapat berubah-ubah
  final String image;   //DEFINISIKAN VARIABLE image YANG BERFUNGSI UNTUK MENAMPUNG LIST DATA,
  final String textTop;
  final String textBottom;
  final double offset;
  const MyHeader(
      {Key key, this.image, this.textTop, this.textBottom, this.offset})    //BUAT CONSTRUCTOR UNTUK MEMINTA DATA
      : super(key: key);

  @override
  _MyHeaderState createState() => _MyHeaderState();   //kode dasar header widget
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {    //kode dasar statefull widget
    return ClipPath(     //CLIPPERNYA UNTUK MENDESAIN LENGKUNGAN YANG DIINGINKAN KITA BUAT CUSTOM CLASS ( Membuat Lengkungan ) 
      clipper: MyClipper(),
      child: Container(   //untuk menampung objek
        padding: EdgeInsets.only(left: 40, top: 50, right: 20), // SET RADIUSNYA SETENGAH DARI UKURAN KOTAK AGAR MENDAPATKAN LINGKARAN
        height: 350,
        width: double.infinity,   // Start gradient
        decoration: BoxDecoration(    // Membuat dekoarasi pada box
          gradient: LinearGradient(   //membuat gradien warna
            begin: Alignment.topRight,  //Warna dimulai dari atas kanan
            end: Alignment.bottomLeft,  //Warna berakhir dari bawah kiri
            colors: [
              Color(0xFF3383CD),
              Color(0x4EB7AD),
            ],
          ),
          image: DecorationImage(   //menambahkan gambar pada warna gradient
            image: AssetImage("assets/images/virus.png"),
          ),
        ),
        child: Column(    //menata widget berjejer kebawah
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(   //Mengarahkan button ke arah InfoScreen
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return InfoScreen();    //mengembalikan nilai InfoScreen
                    },
                  ),
                );
              },
              child: SvgPicture.asset("assets/icons/menu.svg"),   //Menambahkan Icon
            ),
            SizedBox(height: 20), //Membuat Box
            Expanded(   
              child: Stack(
                children: <Widget>[
                  Positioned(   //mengarahkan dimana posisi widget tersebut hendak ditempatkan
                    top: (widget.offset < 0) ? 0 : widget.offset,
                    child: SvgPicture.asset(
                      widget.image,
                      width: 230,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,   
                    ),
                  ),
                  Positioned(   //mengarahkan dimana posisi widget tersebut hendak ditempatkan
                    top: 20 - widget.offset / 2,
                    left: 150,
                    child: Text(
                      "${widget.textTop} \n${widget.textBottom}",
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,    //mengganti warna dengan putih
                      ),
                    ),
                  ),
                  Container(), // I dont know why it can't work without container
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {           //JADI CLASS INI MENG-EXTEND CUSTOMCLIPPER YANG SEBENARNYA BISA LANGSUNG DI EMBED PADA CODE DI ATAS
                                                      //AGAR LEBIH READBALE MAKA KITA PISAHKAN
  @override

  //ATTRIBUTE INI YANG AKAN MENJADI TEMPAT KITA MENDESAIN SETIAP SUDUTNYA
  Path getClip(Size size) {
    var path = Path();    //INISIASI PATHNYA TERLEBIH DAHULU 
    path.lineTo(0, size.height - 80);   //GARIS PERTAMA PADA SUMBU X (WIDTH) KITA SET 0 KARENA AKAN DI TARIK PADA SISI PALING KIRI, DAN SUMBU Y (HEIGHT) KITA GUNAKAN SELURUH TINGGI ADA YANG ADA DARI KOTAK TERSEBUT
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);

    //BAGIAN INI ADA 4 TITIK, X1 DAN X2, Y1 DAN Y2
    //SUMBU X1 KITA MULAI DARI SUDUT PALING KIRI
    //SUMBU Y1 KITA SET / 2 DARI LEBAR YANG ADA SEHINGGA AKAN MEMBENTUK TITIK LENGKUNG SESUAI LEBAR / 2
    //SEDANGKAN X2 DAN Y2 KITA GUNAKAN SIZE MAX NYA AGAR MEMBENTUK TITIK TEMU DI UJUNG KOTAK


    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
