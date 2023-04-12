import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';
import 'package:queaze/view_models/home_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/store.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var stores = [
    Store(
      'Matahaari Club',
      'https://picsum.photos/250?image=9',
      'Open 5pm to 9pm',
      'Rs 2500 for two',
      'https://cred.club/',
    ),
    Store(
      'Wallmart',
      'https://upload.wikimedia.org/wikipedia/commons/3/31/Walmart_Home_Office.jpg',
      'Open 5pm to 9pm',
      'Rs 2500 for two',
      'https://cred.club/',
    ),
    Store(
      '24 Hours',
      'https://picsum.photos/250?image=10',
      'Open 5pm to 9pm',
      'Rs 2500 for two',
      'https://cred.club/',
    ),
    Store(
      'Great Store',
      'https://picsum.photos/250?image=3',
      'Open 5pm to 9pm',
      'Rs 2500 for two',
      'https://cred.club/',
    ),
    Store(
      'PUBG Store',
      'https://picsum.photos/250?image=4',
      'Open 5pm to 9pm',
      'Rs 2500 for two',
      'https://cred.club/',
    ),
    Store(
      'Seven Eleven',
      'https://picsum.photos/250?image=5',
      'Open 5pm to 9pm',
      'Rs 2500 for two',
      'https://cred.club/',
    )
  ];

  _launchURLApp(String storeUrl) async {
    var url = Uri.parse(storeUrl);
    if (true) {
      //canLaunch() function is returning false
      await launchUrl(url, mode: LaunchMode.inAppWebView);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Beliaghata, East Kolkata',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                CircleAvatar()
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<HomeViewModel>(builder: (context, value, child) {
              return Text(
                'Hi ${value.getUsername()}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "What's your today's bill?",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                _launchURLApp('https://cred.club/');
              },
              style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  'Know more about us',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Material(
              elevation: 2.0,
              borderRadius: BorderRadius.circular(30.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search anything....',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.mic),
                    ),
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.search),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
              ),
            ),
            const SizedBox(
              // todo: extract the recurring widget as another class later on ie. this sized box, and the following row,sized box and container with list view
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Stores near you',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    'View all',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.grey[700],
                        decorationThickness: 2,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700]!),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: stores.length,
                  itemBuilder: (context, index) {
                    var store = stores[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          right: 8, top: 8, bottom: 8, left: 2),
                      child: InkWell(
                        onTap: () {
                          _launchURLApp(store.storeUrl);
                        },
                        child: Container(
                          width: 165,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                      ),
                                      child: Image.network(store.imageUrl),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.orange.withOpacity(0.4),
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                        height: 40,
                                        width: 150,
                                        child: GlassmorphicFlexContainer(
                                          borderRadius: 0,
                                          blur: 3,
                                          border: 0,
                                          linearGradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xFFffffff)
                                                    .withOpacity(0.1),
                                                Color(0xFFFFFFFF)
                                                    .withOpacity(0.05),
                                              ],
                                              stops: [
                                                0.1,
                                                1,
                                              ]),
                                          borderGradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color(0xFFffffff)
                                                  .withOpacity(0.5),
                                              Color((0xFFFFFFFF))
                                                  .withOpacity(0.5),
                                            ],
                                          ),
                                          child: Center(
                                              child: Text(store.timings)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    store.storeName,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    store.avgPrice,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              // todo: extract the recurring widget as another class later on ie. this sized box, and the following row,sized box and container with list view
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Cafe near you',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    'View all',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.grey[700],
                        decorationThickness: 2,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700]!),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 270,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: stores.length,
                    itemBuilder: (context, index) {
                      var store = stores[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 8, top: 8, bottom: 8, left: 2),
                        child: InkWell(
                          onTap: () {
                            _launchURLApp(store.storeUrl);
                          },
                          child: Container(
                            width: 165,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.4),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2,
                                          ),
                                        ),
                                        child: Image.network(store.imageUrl),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.orange.withOpacity(0.4),
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          height: 40,
                                          width: 150,
                                          child: GlassmorphicFlexContainer(
                                            borderRadius: 0,
                                            blur: 3,
                                            border: 0,
                                            linearGradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Color(0xFFffffff)
                                                      .withOpacity(0.1),
                                                  Color(0xFFFFFFFF)
                                                      .withOpacity(0.05),
                                                ],
                                                stops: [
                                                  0.1,
                                                  1,
                                                ]),
                                            borderGradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xFFffffff)
                                                    .withOpacity(0.5),
                                                Color((0xFFFFFFFF))
                                                    .withOpacity(0.5),
                                              ],
                                            ),
                                            child: Center(
                                                child: Text(store.timings)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      store.storeName,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text(
                                      store.avgPrice,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),

            ),
            const SizedBox(
              // todo: extract the recurring widget as another class later on ie. this sized box, and the following row,sized box and container with list view
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Restaurant near you',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    'View all',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.grey[700],
                        decorationThickness: 2,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700]!),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: stores.length,
                  itemBuilder: (context, index) {
                    var store = stores[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          right: 8, top: 8, bottom: 8, left: 2),
                      child: InkWell(
                        onTap: () {
                          _launchURLApp(store.storeUrl);
                        },
                        child: Container(
                          width: 165,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                      ),
                                      child: Image.network(store.imageUrl),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.orange.withOpacity(0.4),
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                        height: 40,
                                        width: 150,
                                        child: GlassmorphicFlexContainer(
                                          borderRadius: 0,
                                          blur: 3,
                                          border: 0,
                                          linearGradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xFFffffff)
                                                    .withOpacity(0.1),
                                                Color(0xFFFFFFFF)
                                                    .withOpacity(0.05),
                                              ],
                                              stops: [
                                                0.1,
                                                1,
                                              ]),
                                          borderGradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color(0xFFffffff)
                                                  .withOpacity(0.5),
                                              Color((0xFFFFFFFF))
                                                  .withOpacity(0.5),
                                            ],
                                          ),
                                          child: Center(
                                              child: Text(store.timings)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    store.storeName,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    store.avgPrice,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
