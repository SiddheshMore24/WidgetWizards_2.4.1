import 'package:flutter/material.dart';
import '../model/user.dart';

class ProfilePage extends StatefulWidget {
  final User user;
 

  ProfilePage({required this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController locationController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    emailController = TextEditingController(text: widget.user.email);
    phoneNumberController = TextEditingController(text: widget.user.phoneNumber);
    locationController = TextEditingController(text: widget.user.location);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    locationController.dispose();
    super.dispose();
  }

  void _toggleEditing() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void _saveChanges(BuildContext context) {
    // Implement saving changes functionality here
    // For demonstration purposes, we'll just print the updated values
    print('Name: ${nameController.text}');
    
    print('Email: ${emailController.text}');
    print('Phone Number: ${phoneNumberController.text}');
    print('Location: ${locationController.text}');

    // Show a success message
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Icon(Icons.check_circle, color: Colors.teal, size: 50),
        content: Text('Profile saved successfully'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              // Navigate back to previous profile page with editing mode turned off
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ProfilePage(user: User(
              //       name: nameController.text,
              //       email: emailController.text,
              //       phoneNumber: phoneNumberController.text,
              //       address: addressController.text,
              //     )),
              //   ),
              // );
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _toggleEditing();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundColor: Colors.teal,
                      child: Icon(
                        Icons.person,
                        size: 60.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  _buildInfoRow('Name :', nameController, isEditing),
                  _buildInfoRow('Email :', emailController, isEditing),
                  _buildInfoRow('Phone Number :', phoneNumberController, isEditing),
                  _buildInfoRow('Location :', locationController, isEditing),
                  SizedBox(height: 20.0),
                  if (isEditing)
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _saveChanges(context);
                        },
                        child: Text('Save'),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, TextEditingController controller, bool isEditing) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.teal
          ),
        ),
        SizedBox(height: 5.0),
        isEditing
            ? TextField(
          controller: controller,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        )
            : Text(
          controller.text,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}
