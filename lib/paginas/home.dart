import 'package:actividad2562372014/paginas/album.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';

import '../constantes/const.dart';

class PaginaPrincipal extends StatefulWidget {
  PaginaPrincipal({Key? key}) : super(key: key);

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  int activoMenu1 = 0;
  int activoMenu2 = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: mostrarAppBar(),
      ),
      body: bodyApp(),
      //: mostrarAppBar(),
    );
  }

  Widget mostrarAppBar() {
    return AppBar(
      backgroundColor: Colors.teal,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Music",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Icon(Entypo.user),
          ],
        ),
      ),
    );
  }

  Widget bodyApp() {
    var tamanio = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                //crossAxisAlignment: CrossAxisAlignment.start,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                      children: List.generate(song_type_1.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            activoMenu1 = index;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song_type_1[index],
                              style: TextStyle(
                                  //color: Colors.grey,
                                  fontSize: 15,
                                  color: activoMenu1 == index
                                      ? Colors.teal
                                      : Colors.grey,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            activoMenu1 == index
                                ? Container(
                                    width: 10,
                                    height: 3,
                                    decoration: BoxDecoration(
                                        color: Colors.purple[800],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    );
                  })),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: tamanio.width,
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage("assets/images/img_8.jpg"),
                      fit: BoxFit.fill)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Trending this week",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.pink[300],
                      fontWeight: FontWeight.w500),
                ),
                Icon(
                  EvaIcons.trendingUp,
                  color: Colors.green,
                  // color: Colors.amber[700],
                  // size: 18,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                  children: List.generate(songs.length - 5, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: Album(
                                song: songs[index],
                              ),
                              type: PageTransitionType.scale));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(songs[index]['img']),
                                  fit: BoxFit.cover),
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          songs[index]['title'],
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 180,
                          child: Text(
                            songs[index]['artist'],
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Album",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.pink[300],
                      fontWeight: FontWeight.w500),
                ),
                Icon(
                  Entypo.new_icon,
                  color: Colors.amber[700],
                  size: 18,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                  children: List.generate(new_album.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.topCenter,
                              child: Album(
                                song: new_album[index],
                              ),
                              type: PageTransitionType.scale));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(new_album[index]['img']),
                                  fit: BoxFit.cover),
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          new_album[index]['title'],
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 180,
                          child: Text(
                            new_album[index]['description'],
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
            ),
          ),
        ],
      ),
    );
  }
}
