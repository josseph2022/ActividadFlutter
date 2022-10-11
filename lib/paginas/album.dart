import 'package:actividad2562372014/paginas/detalleCanciones.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:actividad2562372014/paginas/home.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../constantes/const.dart';

class Album extends StatefulWidget {
  final dynamic song;
  const Album({Key? key, this.song}) : super(key: key);

  @override
  State<Album> createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /* appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                Feather.more_vertical,
                color: Colors.white,
              ),
              onPressed: null)
        ],
      ),*/
      body: Reproductor(),
    );
  }

  Widget Reproductor() {
    var tamanio = MediaQuery.of(context).size;
    List songAlbums = widget.song['songs'];
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: tamanio.width,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          image: AssetImage(widget.song['img']),
                          fit: BoxFit.fill)),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Text(
                widget.song['title'],
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 180,
                child: Text(
                  widget.song['artist'],
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 200),
              child: Row(
                children: List.generate(songs.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 30, top: 200),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: CancionesDetalle(
                                    title: songs[index]['title'],
                                    description: songs[index]['description'],
                                    img: songs[index]['img'],
                                    songUrl: songs[index]['song_url'],
                                  ),
                                  type: PageTransitionType.scale));
                        },
                        child: Column(children: [
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: tamanio.width - 210,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [],
                            ),
                          )
                        ])),
                  );
                }),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.teal,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                IconButton(
                    icon: Icon(
                      Feather.more_vertical,
                      color: Colors.teal,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400),
            child: Column(
                children: List.generate(songAlbums.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            alignment: Alignment.bottomCenter,
                            child: CancionesDetalle(
                              title: widget.song['title'],
                              description: widget.song['description'],
                              img: widget.song['img'],
                              songUrl: widget.song['song_url'],
                            ),
                            type: PageTransitionType.scale));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: (tamanio.width - 60) * 0.77,
                        child: Text(
                          "${index + 1}  " + songAlbums[index]['title'],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Container(
                        width: (tamanio.width - 60) * 0.23,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              songAlbums[index]['duration'],
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.teal.withOpacity(0.8),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 16,
                              )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })),
          ),
        ],
      ),
//safearea
    );
  }
}
