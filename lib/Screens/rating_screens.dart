import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingScreens extends StatefulWidget {
  const RatingScreens({Key? key}) : super(key: key);

  @override
  State<RatingScreens> createState() => _RatingScreensState();
}

class _RatingScreensState extends State<RatingScreens> {
  // List rating = [
  //   {
  //     "name": "Mario Bros",
  //     "rating": 5.0,
  //     "image": "https://www.gamereactor.asia/media/65/_3876503b.jpg",
  //     "height": 150
  //   },
  //   {
  //     "name": "The Last of Us Part 2",
  //     "rating": 4.5,
  //     "image":
  //         "https://upload.wikimedia.org/wikipedia/id/4/46/Video_Game_Cover_-_The_Last_of_Us.jpg",
  //     "height": 180
  //   },
  //   {
  //     "name": "Red Dead Redemption 2",
  //     "rating": 4.0,
  //     "image":
  //         "https://i.pinimg.com/736x/9c/e5/39/9ce53971b62fd0df3b17d2d4d7d95a3a.jpg",
  //     "height": 150
  //   },
  //   {
  //     "name": "Call of Duty: Modern Warfare",
  //     "rating": 3.5,
  //     "image":
  //         "https://upload.wikimedia.org/wikipedia/en/thumb/4/4a/Call_of_Duty_Modern_Warfare_II_Key_Art.jpg/220px-Call_of_Duty_Modern_Warfare_II_Key_Art.jpg",
  //     "height": 180
  //   },
  //   {
  //     "name": "Fortnite",
  //     "rating": 3.0,
  //     "image":
  //         "https://m.media-amazon.com/images/I/51qFa-AUHcL._SX498_BO1,204,203,200_.jpg",
  //     "height": 150
  //   },
  //   {
  //     "name": "Minecraft",
  //     "rating": 4.7,
  //     "image": "https://m.media-amazon.com/images/I/71NB55cUmES.jpg",
  //     "height": 150
  //   },
  //   {
  //     "name": "Ghost of Tsushima",
  //     "rating": 4.0,
  //     "image":
  //         "https://upload.wikimedia.org/wikipedia/en/b/b6/Ghost_of_Tsushima.jpg",
  //     "height": 150
  //   },
  //   {
  //     "name": "Doom Eternal",
  //     "rating": 4.5,
  //     "image":
  //         "https://cdna.artstation.com/p/assets/images/images/028/978/598/large/hyam-cacerez-asset.jpg?1596089849",
  //     "height": 150
  //   },
  //   {
  //     "name": "Hades",
  //     "rating": 4.0,
  //     "image":
  //         "https://lh3.googleusercontent.com/sLgvchryv-3IQ3IEX_4n3WlMnqxb5Rz7EhYmFhkig-x7H6m2RNmtlYB5MSqQp8CQ3hm1qttUATW-GbdBFnQxbYPExQ",
  //     "height": 150
  //   },
  //   {
  //     "name": "Half-Life: Alyx",
  //     "rating": 4.0,
  //     "image":
  //         "https://upload.wikimedia.org/wikipedia/en/4/49/Half-Life_Alyx_Cover_Art.jpg",
  //     "height": 150
  //   },
  //   {
  //     "name": "Cyberpunk 2077",
  //     "rating": 3.5,
  //     "image":
  //         "https://upload.wikimedia.org/wikipedia/en/9/9f/Cyberpunk_2077_box_art.jpg",
  //     "height": 150
  //   },
  //   {
  //     "name": "Animal Crossing: New Horizons",
  //     "rating": 3.5,
  //     "image": "https://m.media-amazon.com/images/I/71l0OyBHlzL._AC_SY500_.jpg",
  //     "height": 150
  //   },
  //   {
  //     "name": "Final Fantasy VII Remake",
  //     "rating": 3.0,
  //     "image": "https://upload.wikimedia.org/wikipedia/en/c/ce/FFVIIRemake.png",
  //     "height": 150
  //   },
  //   {
  //     "name": "The Legend of Zelda: Breath of the Wild",
  //     "rating": 4.0,
  //     "image":
  //         "https://upload.wikimedia.org/wikipedia/en/c/c6/The_Legend_of_Zelda_Breath_of_the_Wild.jpg",
  //     "height": 150
  //   },
  //   {
  //     "name": "Kentucky Route Zero: TV Edition",
  //     "rating": 4.0,
  //     "image":
  //         "https://upload.wikimedia.org/wikipedia/en/6/67/Kentucky_Route_Zero_title.png",
  //     "height": 150
  //   }
  // ];

  List rating = [];
  bool status = false;

  get showLoading {
    status = true;
    setState(() {});
  }

  get hideLoading {
    status = false;
    setState(() {});
  }

  getData() async {
    showLoading;
    var response = await Dio().get(
      "http://192.168.1.6:3000/product",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    List data = response.data;
    rating = data;
    // print("data: $data");
    // print("rating: $rating");
    hideLoading;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                width: MediaQuery.of(context).size.width,
                child: Text("Game Rating",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              (status)
                  ? Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 6,
                                crossAxisSpacing: 6,
                                childAspectRatio: 120 / 180),
                        itemCount: rating.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var item = rating[index];
                          double ratingData = item["rating"];
                          return Container(
                            height: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "${item['image']}",
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  16.0,
                                ),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        16.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "${item['name']}",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 80,
                                      margin: const EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                            16.0,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 30.0,
                                            color: Colors.orange,
                                          ),
                                          Text(
                                            "$ratingData",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
