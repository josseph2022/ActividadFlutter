import 'package:actividad2562372014/paginas/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Principal extends StatefulWidget {
  Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: botonesFooter(),
        body: getPaginas());
  }

  Widget getPaginas() {
    return IndexedStack(
      index: activeTab,
      children: [
        PaginaPrincipal(),
        /* Center(
          child: Text(
            "Principal",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),*/
        Center(
          child: Text(
            "Busqueda - Proximamente!",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "Favoritos - Proximamente!",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "Usuario - Proximamente!",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget botonesFooter() {
    List items = [
      FeatherIcons.home,
      FeatherIcons.search,
      FeatherIcons.heart,
      FeatherIcons.user
    ];

    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.teal),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return IconButton(
                onPressed: () {
                  setState(() {
                    activeTab = index;
                  });
                },
                icon: Icon(
                  items[index],
                  color: activeTab == index ? Colors.amber[300] : Colors.white,
                ));
          }),
        ),
      ),
    );
  }
}
