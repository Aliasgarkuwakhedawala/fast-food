import 'package:fast_food/features/admin/method/delete_item.dart';
import 'package:fast_food/features/admin/method/get_items.dart';
import 'package:fast_food/features/admin/screen/add_item_screen.dart';
import 'package:fast_food/features/authentication/methods/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../widget/item_card.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({super.key});
  @override
  State<AdminPanelScreen> createState() {
    // TODO: implement createState
    return _AdminPanelScreenState();
  }
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  var isLoading = true;
  late List<dynamic> items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  // fetching items from sb on screen building
  Future<void> get() async {
    print('going to ');
    setState(() {
      isLoading = true;
    });
    items = await getItems();
    print(items);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // if its fetching the data then showing the progress indicator else showing the content
    return isLoading
        ? const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.deepOrange,
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Welcome ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'Admin!',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          GoogleSignInAL().signOutGoogle(context);
                        },
                        child: const Icon(
                          Icons.logout,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Your Foods: ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  // created separate card to display each item then displaying it
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) => ItemCard(
                        item: items[index],
                        onDelete: () async {
                          print('inside gede');
                          await deleteItem(items[index]['id']);
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => AdminPanelScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  )
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                height: 40,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddItemScreen(),
                      ),
                    );
                  },
                  backgroundColor: Colors.deepOrange,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Add New',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
