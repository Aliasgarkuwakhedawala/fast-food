import 'dart:ffi';

import 'package:fast_food/features/admin/screen/edit_item_screen.dart';
import 'package:fast_food/features/item_detail/item_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item, required this.onDelete});
  final dynamic item;
  final onDelete;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ItemDetailScreen(
              item: item,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.deepOrange, spreadRadius: 1, blurRadius: 2),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: CircleAvatar(
                  foregroundImage: NetworkImage(
                    item['image'],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 150,
                    child: Text(
                      item['description'],
                      maxLines: 4,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.currency_rupee),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(item['price']),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.timer_outlined),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(item['time'] ?? 'time'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.discount_outlined),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(item['discount']),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditItemScreen(item: item),
                              ),
                            );
                          },
                          child: Icon(Icons.edit)),
                      GestureDetector(
                        onTap: onDelete,
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
