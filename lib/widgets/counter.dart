import 'package:covid_19/constant.dart'; //tempat untuk mendeklarasikan atau mengimpor library yang dibutuhkan oleh aplikasi
import 'package:flutter/material.dart';

class Counter extends StatelessWidget { //Membuat Counter
  final int number; //menyimpan nomor counter
  final Color color;//warnanya untuk UI
  final String title; //menyimpan judul
  const Counter({  //membuat widget khusus yang menampilkan informasi [counter]
    Key key,
    this.number,
    this.color,
    this.title, //informasinya termmasuk number, color, dan title untuk [counter]
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { //kode dasar statefull widget
    return Column(
      children: <Widget>[ //memasukkan widget dalam children
        Container( //untuk menampung objek
          padding: EdgeInsets.all(6), //memberikan padding sebesar value ke semua sisi
          height: 25, //tinggi
          width: 25, //lebar
          decoration: BoxDecoration( //mendekorasi box
            shape: BoxShape.circle, //berbentuk bulat
            color: color.withOpacity(.26), //warna dengan ketransparan 26
          ),
          child: Container(
            decoration: BoxDecoration( //mendekorasi box
              shape: BoxShape.circle, //berbentuk bulat
              color: Colors.transparent, //warna transparan
              border: Border.all( //memakai border di semuua sisi
                color: color,
                width: 2,
              ),
            ),
          ),
        ),
        SizedBox(height: 10), //ukuran box
        Text(
          "$number",
          style: TextStyle(
            fontSize: 40,
            color: color,
          ),
        ),
        Text(title, style: kSubTextStyle),
      ],
    );
  }
}


