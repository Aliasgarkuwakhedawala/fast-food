import 'package:fast_food/features/item_detail/widget/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../authentication/widgets/custom_button.dart';

class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({super.key, required this.item});
  final dynamic item;
  @override
  State<ItemDetailScreen> createState() {
    return _ItemDetailScreenState();
  }
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  bool cheese = true;
  bool sauce = false;
  bool package = false;
  var number = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              color: const Color.fromRGBO(255, 228, 204, 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const CustomIcon(
                        icon: Icons.chevron_left,
                      ),
                    ),
                    CircleAvatar(
                      foregroundImage: NetworkImage(
                        widget.item['image'],
                      ),
                      radius: 150,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(130, 120, 110, 1),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/exit.svg',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    widget.item['name'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.favorite_border,
                    color: Colors.deepOrange,
                    size: 36,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.item['description'],
                    style: TextStyle(fontSize: 18),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    '€${int.parse(widget.item['price']) - int.parse(
                          widget.item['discount'],
                        )}',
                    style:
                        const TextStyle(fontSize: 18, color: Colors.deepOrange),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    '€${int.parse(widget.item['price'])}',
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough, fontSize: 18),
                  ),
                ],
              ),
            ),
            const Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
              child: Divider(
                color: Colors.black26,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Add More',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    foregroundImage: AssetImage('assets/cheese.png'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Parmesan Cheese',
                    style: TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  const Icon(Icons.add),
                  const Text(
                    '€2,50',
                    style: TextStyle(fontSize: 18),
                  ),
                  Checkbox(
                      checkColor: Colors.deepOrange,
                      activeColor: Colors.deepOrange,
                      shape: CircleBorder(
                          side: BorderSide(color: Colors.deepOrange)),
                      value: cheese,
                      onChanged: (bool) {
                        setState(() {
                          cheese = bool!;
                        });
                      }),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    foregroundImage: AssetImage('assets/sauce.png'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Sauce',
                    style: TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  const Icon(Icons.add),
                  const Text(
                    '€1,50',
                    style: TextStyle(fontSize: 18),
                  ),
                  Checkbox(
                      checkColor: Colors.deepOrange,
                      activeColor: Colors.deepOrange,
                      shape: CircleBorder(
                          side: BorderSide(color: Colors.deepOrange)),
                      value: sauce,
                      onChanged: (bool) {
                        setState(() {
                          sauce = bool!;
                        });
                      }),
                ],
              ),
            ),
            const Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
              child: Divider(
                color: Colors.black26,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Package',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    foregroundImage: AssetImage('assets/package.png'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Package Box Cost',
                    style: TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  const Icon(Icons.add),
                  const Text(
                    '€0,50',
                    style: TextStyle(fontSize: 18),
                  ),
                  Checkbox(
                      checkColor: Colors.deepOrange,
                      activeColor: Colors.deepOrange,
                      shape: const CircleBorder(
                          side: BorderSide(color: Colors.deepOrange)),
                      value: package,
                      onChanged: (bool) {
                        setState(() {
                          package = bool!;
                        });
                      }),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepOrange[100],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (number != 0) {
                            setState(() {
                              number--;
                            });
                          }
                        },
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange[700],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                              '-',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '${number}',
                        style: TextStyle(
                            color: Colors.deepOrange[700], fontSize: 20),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            number++;
                          });
                        },
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange[700],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                              '+',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      'Add to order',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
      //
    );
  }
}
