import 'package:fast_food/features/admin/widget/image_picker.dart';
import 'package:fast_food/features/authentication/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../method/add_item.dart';

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController discountController = TextEditingController();
    final TextEditingController timeController = TextEditingController();
    var _selectedImage;

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Add Item',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Name',
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextField(
                  controller: nameController, hint: 'Enter Name of Item'),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Description',
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: descController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Add Description about item.',
                  constraints: const BoxConstraints(
                    minHeight: 50,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Price',
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: priceController,
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Add Price',
                  constraints: const BoxConstraints(
                    minHeight: 50,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Time to prepare',
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: timeController,
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter time to prepare the item',
                  constraints: const BoxConstraints(
                    minHeight: 50,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Discount ',
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: discountController,
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Want to Give any Discount ?',
                  constraints: const BoxConstraints(
                    minHeight: 50,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Pick Image ',
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ImagePickerWidget(
                onPickImage: (image) {
                  _selectedImage = image;
                },
              ),
              const SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          width: double.infinity,
          height: 40,
          child: FloatingActionButton(
            onPressed: () async {
              if (nameController.text.isEmpty) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Enter name'),
                  ),
                );
              } else if (descController.text.isEmpty) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Enter Description'),
                  ),
                );
              } else if (priceController.text.isEmpty) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Enter Price'),
                  ),
                );
              } else if (timeController.text.isEmpty) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Enter Time'),
                  ),
                );
              } else if (_selectedImage == null) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please select an Image'),
                  ),
                );
              }
              if (discountController.text.isEmpty) {
                discountController.text = '0';
              }
              await addItem(
                  context,
                  nameController.text,
                  descController.text,
                  priceController.text,
                  discountController.text,
                  timeController.text,
                  _selectedImage);
            },
            backgroundColor: Colors.deepOrange,
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
