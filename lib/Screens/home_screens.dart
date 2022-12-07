import 'package:dio/dio.dart';
import 'package:uas/Screens/detail_news.dart';
import 'package:uas/Screens/home_screens.dart';
import 'package:flutter/material.dart';
import 'package:uas/Screens/search_screen.dart';
import 'package:uas/utils/style.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:gap/gap.dart';

import 'card_news.dart'; //untuk menambahkan celah dengan mudah di dalam widget Flex seperti Kolom dan Baris atau tampilan bergulir.

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //cara kedua
  //bikin variable untuk menampung data dari api
  List data = [];
  //bikin variable untuk mengatur loading saat data sedang di load
  bool status = false;
  //bikin function untuk get data dari api
  getData() async {
    //set status untuk mengaktifkan loading
    status = true;
    setState(() {});
    //get response dari api
    var response = await Dio().get(
      "https://the-lazy-media-api.vercel.app/api/games/pc?page=2",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    //memasukan data respont ke dalam list yang sudah di buat sebelumnya
    data = response.data;
    //mematikan loading ketika data sudah di get
    status = false;
    setState(() {});
  }

  //initstate untuk load data di awal
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //panggil function ketika di built untuk pertama kali
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Trending",
                          style: Styles.headLineStyle1,
                        ),
                      ],
                    ),
                  ],
                ),
                const Gap(25),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today Read",
                        style: Styles.headLineStyle2,
                      ),
                      InkWell(
                        onTap: () {
                          debugPrint("You tapped on View all");
                        },
                        child: Text('View all',
                            style: Styles.textStyle
                                .copyWith(color: Styles.primaryColor)),
                      ),
                    ])
              ],
            ),
          ),
          const Gap(20),
          SearchScreen(),
          // //cara pertama
          // //kodingan saya mulai dari bagian ini
          // //menggunakan future builder merupakan cara yang paling mudah untuk get data dari api
          // FutureBuilder(
          //   future: Dio().get(
          //     //url yang di gunakan
          //     "https://the-lazy-media-api.vercel.app/api/games/pc?page=2",
          //     options: Options(
          //       contentType: "application/json",
          //     ),
          //   ),
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     //cek apabila data yang di get kosong
          //     if (snapshot.data == null) return Container();
          //     //get respon dari dio, respon yang merupakan list
          //     //seperti ini:
          //     // [
          //     //   {
          //     // "title": "Abandoned Adalah Silent Hill Terbaru?!",
          //     // "thumb": "https://thelazy.media/wp-content/uploads/2021/06/abandoned-blue-box-game-studios-218x150.jpg",
          //     // "author": "Aldy Wayong",
          //     // "tag": "PC",
          //     // "time": "June 23, 2021",
          //     // "desc": "Rumor mengenai game Abandoned kini tengah kembali ramai diperbincangkan dan semakin menguatkan bukti bahwa game tersebut merupakan sebuah game Silent Hill yang tengah digarap oleh Hideo Kojima.\n\n\n\nHal ini kembali dimulai dari...",
          //     // "key": "2021/06/23/abandoned-adalah-silent-hill-baru"
          //     // }
          //     // ],
          //     // list respone di atas itu di tamkap di dalam snapshot dan di masukan ke variable respone untuk menampung data
          //     Response response = snapshot.data;
          //     //karna data nya merupakan list tanpa heat, maka cukup di masukan lansung ke variable List Item;
          //     List items = response.data;

          //     //karna list nya udh di dapat maka dapat di tampung ke dalam list view builder
          //     return ListView.builder(
          //       //untuk menampung panjang dari list
          //       itemCount: items.length,
          //       shrinkWrap: true,
          //       physics: const ScrollPhysics(),
          //       itemBuilder: (BuildContext context, int index) {
          //         //item dari list di looping berdasaran index
          //         var item = items[index];
          //         //di sini merupakan tampilan dari list yang sudah di buat
          //         return Card(
          //           margin: const EdgeInsets.symmetric(
          //               horizontal: 10.0, vertical: 5),
          //           color: Colors.white,
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(15),
          //           ),
          //           //inkwell untuk menambahkan event ontap supaya bisa di push ke halaman lain
          //           child: InkWell(
          //               onTap: () {
          //                 //push ke halaman detail news
          //                 Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => DetailNews(
          //                             item: item,
          //                           )),
          //                 );
          //               },
          //               //merupakan widget tampilan dari layar, yang menampung map data dari item yang di looping, file ini terdapat pada card_news.dart
          //               child: CardNews(item: item)),
          //         );
          //       },
          //     );
          //   },
          // ),
          //saya akhiri di bagian ini
          //end cara pertama

          //cara kedua

          //function cara kedua ada di atas
          //cek status untuk membuat loading ketika data di load
          (status == true)
              //widget yang akan tampil ketika load data
              ? Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Loading data ...",
                        style: TextStyle(
                            fontSize: 20.0, fontStyle: FontStyle.italic),
                      ),
                    ],
                  )))
              : Container(
                  //panjang dari container bisa di atur
                  height: 600,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      var item = data[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailNews(
                                          item: item,
                                        )),
                              );
                            },
                            child: CardNews(item: item)),
                        //merupakan widget tampilan dari layar, yang menampung map data dari item yang di looping, file ini terdapat pada card_news.darts
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
