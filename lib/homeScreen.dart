import 'package:flutter/material.dart';
import 'package:f36_appjam_project/costum_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List imageList = [
    {"id": 1, "image_path": 'assets/banner.jpg'},
    {"id": 2, "image_path": 'assets/banner2.jpg'},
    {"id": 3, "image_path": 'assets/banner3.jpg'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F8F8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        shadowColor: Colors.black.withOpacity(0.25),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4),
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(0, 4),
                ),
              ],
            ),
          ),
        ),

        title: Align(
          alignment: Alignment.centerRight,
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset("assets/rank2.png", height: 26,),
              SizedBox(
                width: 3,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "Murat AVCI",
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                  Text(
                    "555 Puan",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 14.0),
                  )
                ],
              ),
            ],
          ),

        ),
        actions: [
          Padding(padding:
          const EdgeInsets.only(left: 0, right: 18.0),
            child: new CircleAvatar(
              backgroundImage:  AssetImage('lib/images/profilepicture.png'),
            ),
          )
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu, color: Colors.black,),
            );
          },
        ),
      ),
      drawer: CostumDrawer(),
      body: SingleChildScrollView (
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
                Stack(
                children: [
                    InkWell(
                    onTap: () {
                      print(currentIndex);
                      },
                        child: CarouselSlider(
                          items: imageList
                              .map(
                              (item) => Image.asset(
                            item['image_path'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        )
                              .toList(),
                          carouselController: carouselController,
                          options: CarouselOptions(
                            scrollPhysics: const BouncingScrollPhysics(),
                            autoPlay: true,
                            aspectRatio: 2,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                          ),
                        ),
                      ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imageList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => carouselController.animateToPage(entry.key),
                            child: Container(
                              width: currentIndex == entry.key ? 17 : 7,
                              height: 7.0,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 3.0,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: currentIndex == entry.key
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          );
                        }).toList(),
                      ),
              ),
              ],
            ),
                Container(
                      margin: EdgeInsets.only(left: 16, right:16, bottom: 8, top: 8),
                      decoration: BoxDecoration(
                      color: Color(0xFFF8F8F8),
                      boxShadow: const [
                      BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(0, 4),
                      blurRadius: 4.0,
                      ),
                      ],
                      borderRadius: BorderRadius.circular(18),
                      ),
                      padding: EdgeInsets.all(16),
                      constraints: const BoxConstraints(
                      maxWidth: 360,
                      maxHeight: 80,
                      ),
                      child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          const Icon(
                          Icons.access_alarm,
                          color: Colors.blue,
                          size: 45,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                              ('Yazılımcılar için İngilizce Canlı Yayın 5'),
                              style: TextStyle(fontSize: 16),
                              ),
                              Text('12 Nisan - 21.00'),
                            ],
                          ),

                      ],
                    ),
                  ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _anasayfaMenu(onTap: () {}, iconData: Icons.developer_mode_outlined, colorData: Colors.blue, menuTitle: 'Eğitimler'),
                    _anasayfaMenu(onTap: () {}, iconData: Icons.person, colorData: Colors.red, menuTitle: 'Profilim'),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _anasayfaMenu(onTap: () {}, iconData: Icons.comment, colorData: Colors.green, menuTitle: 'Sohbetler'),
                    _anasayfaMenu(onTap: () {}, iconData: Icons.question_mark, colorData: Colors.orange, menuTitle: 'Sınavlar'),
              ],
            ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _anasayfaMenu(onTap: () {}, iconData: Icons.video_collection, colorData: Colors.red, menuTitle: 'Youtube'),
                      _anasayfaMenu(onTap: () {}, iconData: Icons.camera_alt_rounded, colorData: Colors.purple, menuTitle: 'Instagram'),
              ],
            ),
          ],
            ),
        ),
      );
  }
  InkWell _anasayfaMenu ({
          required VoidCallback onTap,
          required IconData iconData,
          required Color colorData,
          required String menuTitle}) =>
            InkWell(
            onTap: onTap,
                  child: Container(
                      margin: EdgeInsets.only(left: 16, right:16, bottom: 8, top: 8),
                      decoration: BoxDecoration(
                      color: Color(0xFFF8F8F8),
                      boxShadow: const [
                      BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(0, 4),
                      blurRadius: 4.0,
                      ),
                      ],
                      borderRadius: BorderRadius.circular(18),
                      ),
                      padding: EdgeInsets.all(12),
                      constraints: const BoxConstraints(
                      maxWidth: 160,
                      maxHeight: 80,
                      ),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            Icon(
                            iconData,
                            color: colorData,
                            size: 45,
                            ),
                            Text(menuTitle),

                        ],
                        ),
                  ),
            );
}
