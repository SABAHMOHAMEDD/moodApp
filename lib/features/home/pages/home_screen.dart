import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moodapp/core/constance/constants.dart';

import '../../playList/pages/playlist_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String RouteName = 'HomeScreen';
  List<String> items = ['assets/images/img_3.png', "assets/images/img_4.png"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            //3amel container kber w el fo2o as8r mno seka as8r b ,27
            Container(
              child: CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: 1,
                      height: 463,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(seconds: 1),
                      scrollDirection: Axis.horizontal,
                      autoPlayCurve: Curves.fastOutSlowIn),
                  items: items
                      .map((e) => Image(
                            image: AssetImage(e),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ))
                      .toList()),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
              child: Row(
                children: [
                  Container(
                    child: const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        'For You',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF404642)),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),

            // plantCard(context)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: [
                  recomendPlantCard(context, 'assets/images/img_7.png',
                      'Funky Vibes', '50LE', '35 min'),

                  //   plantCard(context, imagePath, plantName, price, country)
                  recomendPlantCard(context, 'assets/images/img_8.png',
                      'Eotional Eaters', '70LE', '2 hours'),
                  recomendPlantCard(context, 'assets/images/img_5.png',
                      'Poshy Dinner', '55LE', '35 min'),
                  recomendPlantCard(context, 'assets/images/img_10.png',
                      'Insomnia', '45LE', '35 min'),
                  recomendPlantCard(context, 'assets/images/img_11.png',
                      'Disco Fiesco', '55LE', '2 hours'),
                  recomendPlantCard(context, 'assets/images/img_12.png',
                      'Cactus', '55LE', '35 min'),
                  recomendPlantCard(context, 'assets/images/img_13.png',
                      'Cactus', '55LE', '35 min'),
                  recomendPlantCard(context, 'assets/images/img_14.png',
                      'Cactus', '55LE', '2 hours'),
                  recomendPlantCard(context, 'assets/images/img_15.png',
                      'Cactus', '55LE', '35 min'),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    child: const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        'Popular',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF404642)),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),

            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  featuredplantCard('assets/images/img_5.png'),
                  featuredplantCard('assets/images/img_6.png'),
                  featuredplantCard('assets/images/img_5.png'),
                  featuredplantCard('assets/images/img_5.png'),
                  featuredplantCard('assets/images/img_5.png')
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 40, bottom: 10, top: 10, right: 40),
        height: 58,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              offset: Offset(0, -10),
              blurRadius: 35,
              color: KPrimaryColor.withOpacity(0.32))
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/search001 - E000.png'),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/heart001 - E034.png'),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/hamburger.png'),
            )
          ],
        ),
      ),
    );
  }
}

Widget recomendPlantCard(context, imagePath, plantName, price, country) =>
    InkWell(
      onTap: () {
        Navigator.pushNamed(context, PlayListScreen.RouteName);
      },
      child: Container(
        width: 160,
        height: 190,
        margin: const EdgeInsets.only(left: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(11),
                  bottomLeft: Radius.circular(11)),
              child: Image(
                  width: 166,
                  height: 136,
                  fit: BoxFit.cover,
                  image: AssetImage(
                    imagePath,
                  )),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 0, top: 8),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(plantName, style: TextStyle(color: KFontColor)),
                        //  Spacer(),
                        Text(country,
                            style:
                                TextStyle(color: KLightFontColor, fontSize: 12))
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget featuredplantCard(imagePath) => Container(
      margin: EdgeInsets.only(left: 20, top: 2, bottom: 2),
      width: 280,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(imagePath))),
    );
