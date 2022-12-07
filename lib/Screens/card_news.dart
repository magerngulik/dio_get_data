import 'package:flutter/material.dart';

class CardNews extends StatelessWidget {
  const CardNews({
    Key? key,
    required this.item,
  }) : super(key: key);

  final item;
  //item yang di dapat dari class home.

  //note:untuk data item['example'] bisa di lihat sebagai berikut:
  // {
  // "title": "Abandoned Adalah Silent Hill Terbaru?!",
  // "thumb": "https://thelazy.media/wp-content/uploads/2021/06/abandoned-blue-box-game-studios-218x150.jpg",
  // "author": "Aldy Wayong",
  // "tag": "PC",
  // "time": "June 23, 2021",
  // "desc": "Rumor mengenai game Abandoned kini tengah kembali ramai diperbincangkan dan semakin menguatkan bukti bahwa game tersebut merupakan sebuah game Silent Hill yang tengah digarap oleh Hideo Kojima.\n\n\n\nHal ini kembali dimulai dari...",
  // "key": "2021/06/23/abandoned-adalah-silent-hill-baru"
  // }
  //cara penggunaan sebagai berikut:
  // Text(
  //  "${item['title']}",//contoh penggunaan nya
  //  maxLines: 2,
  //  overflow: TextOverflow.ellipsis,
  //  style: TextStyle(
  //    fontSize: 20.0,
  //    fontWeight: FontWeight.bold,
  //  ),
  //),
  // Text(
  //  "${item['author']}", //contoh penggunaan nya
  //  maxLines: 2,
  //  overflow: TextOverflow.ellipsis,
  //  style: TextStyle(
  //    fontSize: 20.0,
  //    fontWeight: FontWeight.bold,
  //  ),
  //),

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.black,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Column(
        children: [
          Column(
            children: [
              //gambar utama icon
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "${item['thumb']}",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      15.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              //title dari berita
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text(
                        "${item['title']}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              //nama pengarang
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "${item['author']}",
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              //descripsi dari berita
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text(
                        "${item['desc']}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              //tanggal berita
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${item['time']}",
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
