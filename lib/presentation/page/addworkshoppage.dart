import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money/presentation/controller/c_workshop.dart';

class AddWorkshopPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController workshopNameController = TextEditingController();
  final TextEditingController primaryNumberController = TextEditingController();
  final TextEditingController secondaryNumberController =
      TextEditingController();
  final TextEditingController whatsappNumberController =
      TextEditingController();

  final CWorkshop cWorkshop =
      Get.find<CWorkshop>(); // Get the CWorkshop controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Workshop'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                controller: ownerNameController,
                decoration: InputDecoration(labelText: 'Owner Name'),
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: workshopNameController,
                decoration: InputDecoration(labelText: 'Workshop Name'),
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                controller: primaryNumberController,
                decoration: InputDecoration(labelText: 'Primary Number'),
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                controller: secondaryNumberController,
                decoration: InputDecoration(labelText: 'Secondary Number'),
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                controller: whatsappNumberController,
                decoration: InputDecoration(labelText: 'WhatsApp Number'),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _submitForm();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    bool result = await cWorkshop.createWorkshop(
      name: nameController.text,
      ownerName: ownerNameController.text,
      address: addressController.text,
      email: emailController.text,
      workshopName: workshopNameController.text,
      primaryNumber: primaryNumberController.text,
      secondaryNumber: secondaryNumberController.text,
      whatsappNumber: whatsappNumberController.text,
    );

    if (result) {
      // Show success message or navigate back to previous screen
      Get.snackbar('Success', 'Workshop created successfully');
      // Example: Navigate back to previous screen
      Get.back();
    } else {
      // Show error message or handle failure case
      Get.snackbar('Error', 'Failed to create workshop');
    }
  }
}
