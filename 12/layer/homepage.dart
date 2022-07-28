import 'dart:html';
import 'dart:ui';
import 'package:divisi_humas_polri/main.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> choose =[
    "Beranda",
    "Tentang",
    "Info Publik",
    "Pelayanan Masyrakat",
    "Kontak",
  ];

  List<IconData> gambar =[
    Icons.train,
    Icons.accessibility,
  ];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        title: Text('Percobaan Aplikasi',
        style: TextStyle(
          color: Colors.black,
        ),),
        leading: Image.asset('img/taxi.png'),
        leadingWidth: 100,
      ),

      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color.fromARGB(255, 77, 77, 77), Colors.grey]
          ),
        ),

        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 60,
              child : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: choose.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index){
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            current =  index;
                          });
                        },
                        child: AnimatedContainer(
                          duration:const Duration(milliseconds: 500),
                          margin: const EdgeInsets.all(5),
                          width: 150,
                          height: 30,
                          decoration: BoxDecoration(
                            color: current == index
                            ? null: null,
                            borderRadius: current == index
                            ? BorderRadius.circular(10) : null,
                            border: current == index
                            ? Border.all(color: Colors.black, width: 2) : null,
                            ),
                            child: Center(
                              child: Text(
                                choose[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: current == index
                                  ? Colors.black : Colors.black
                                ),
                              ),
                            ),
                           ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Stack(
              children: [
                Container(
                  width: 350,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount:gambar.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index){
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        current = index;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(microseconds: 200),
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height,
                                      child: Center(
                                        child: Icon(
                                          gambar[index],
                                          size: 50,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}