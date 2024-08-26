import 'package:carousel_slider/carousel_slider.dart';
import 'package:fast_food/features/admin/method/get_items.dart';
import 'package:fast_food/features/admin/screen/admin_screen.dart';
import 'package:fast_food/features/item_detail/item_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'colors.dart';
import 'custombottomnavigationbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  String deliveryLoc = "Location";
  bool isLoading = true;
  late List<dynamic> items;
  late List<dynamic> fastest;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  // Funtion to fetch the data
  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });
    items = await getItems();
    fastest = items.map((e) => e).toList();
    // Sorting to get the fastest items
    fastest.sort(
      (a, b) => a['time'].compareTo(
        b['time'],
      ),
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // If it is sitll fetching the data then showing indicator else showing the content

    return isLoading
        ? const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.deepOrange,
              ),
            ),
          )
        : Scaffold(
            body: SingleChildScrollView(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor:
                              primary_color, // Change primary color here
                          child: SvgPicture.asset(
                            "assets/home.svg",
                            width: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Home, ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          deliveryLoc,
                          style: const TextStyle(color: Colors.black),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/arrow-bottom.svg",
                            width: 20,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AdminPanelScreen(),
                              ),
                            );
                          },
                          child: const Column(
                            children: [
                              Icon(
                                Icons.admin_panel_settings,
                                color: Colors.deepOrange,
                              ),
                              Text('Admin'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      // for the corousel created separate widget in the same file to save time
                      child: CarouselSlider(
                        items: [
                          carouselItem(size, 'Image-10.png'),
                          carouselItem(size, 'landing_page_image.png'),
                          carouselItem(size, 'Image-5.png'),
                        ],
                        options: CarouselOptions(
                          autoPlay: true,
                          initialPage: 0,
                          autoPlayAnimationDuration: const Duration(seconds: 2),
                          viewportFraction:
                              1.0, // Ensures each item covers the full width
                          enlargeCenterPage: false, // Keeps items the same size
                        ),
                      ),
                    ),
                    Gap(20),
                    Row(
                      children: [
                        const Text(
                          "Fastest Delivery🔥",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 24,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: secondary_color,
                              padding: const EdgeInsets.all(0),
                            ),
                            child: Text(
                              "See all",
                              style:
                                  TextStyle(fontSize: 10, color: primary_color),
                            ),
                          ),
                        )
                      ],
                    ),
                    Gap(15),
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: fastest.length,
                        itemBuilder: (context, index) =>
                            listTile(index, fastest),
                      ),
                    ),
                    Gap(15),
                    Row(
                      children: [
                        const Text(
                          "Popular Items🔥",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 24,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: secondary_color,
                              padding: EdgeInsets.all(0),
                            ),
                            child: Text(
                              "See all",
                              style:
                                  TextStyle(fontSize: 10, color: primary_color),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(15),
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => listTile(index, items),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                if (index != 0) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.deepOrange[700],
                      content: const Center(
                          child:
                              Text("Oh uh!! For that you have to hire me 😊")),
                    ),
                  );
                }
              },
              selectedItemColor: primary_color, // Change primary color here
              unselectedItemColor: Colors.black,
            ),
          );
  }

  Widget carouselItem(Size size, String image) {
    return Container(
      width: size.width, // Ensure the width matches the screen width
      height: size.height / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.orange.shade600, primary_color],
        ), // Gradient background
      ),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Pattern.png'),
              opacity: 0.2,
              fit: BoxFit.fill),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end, // Centers  the content
            children: [
              Gap(30),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Get Your 30% \n discount now",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8), // Added spacing
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {},
                    child: const Text(
                      "Order Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                  width: 180,
                  child: Image.asset(
                    "assets/$image",
                    fit: BoxFit.cover,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  // This is a list widget for item using in fastest delivery and popular item section to render the items
  Widget listTile(int index, List<dynamic> items) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ItemDetailScreen(item: items[index]),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        width: 320,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(blurRadius: 2, color: Color.fromRGBO(98, 98, 98, 0.2))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Image.network(
                items[index]['image'],
                height: 80,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    items[index]['name'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    items[index]['description'],
                    maxLines: 1,
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.fire_truck_rounded,
                        color: Colors.deepOrange,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('€${items[index]['price']}'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.timer,
                        color: Colors.deepOrange,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('${items[index]['time']} min'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.discount,
                        color: Colors.deepOrange,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('€2${items[index]['discount']}'),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
