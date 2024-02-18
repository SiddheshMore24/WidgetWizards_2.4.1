import 'package:flutter/material.dart';
import 'package:widget_wizards/organization/crises.dart';
import 'package:widget_wizards/utility/Image_capture.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart';

final formatter = DateFormat.yMMMd();

class AddCrises extends StatefulWidget {
  final Crises crises;

  AddCrises({required this.crises});

  @override
  _AddCrisesState createState() => _AddCrisesState();
}

class _AddCrisesState extends State<AddCrises> {
  late TextEditingController titleController;
  late TextEditingController locationController;
  late TextEditingController descriptionController;
  late TextEditingController totalInjuredController;
  late TextEditingController totalDeathsController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.crises.title);
    descriptionController =
        TextEditingController(text: widget.crises.description);
    locationController = TextEditingController(text: widget.crises.location);
    totalInjuredController =
        TextEditingController(text: widget.crises.totalInjured);
    totalDeathsController =
        TextEditingController(text: widget.crises.totalDeaths);
  }

  @override
  void dispose() {
    titleController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    totalInjuredController.dispose();
    totalDeathsController.dispose();
    super.dispose();
  }

  bool isEditing = true;

  void _toggleEditing() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  String selectedDate = '';
  DateTime? _selectedDate;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _saveChanges(BuildContext context) async {
    // Convert Total Injured and Total Deaths to integers

    // Implement saving changes functionality here
    // For demonstration purposes, we'll just print the updated values
    print('Title: ${titleController.text}');
    print('Location: ${locationController.text}');
    print('Description: ${descriptionController.text}');
    print('Total Injured: ${totalInjuredController.text}');
    print('Total Deaths: ${totalDeathsController.text}');
    print('Date : ${formatter.format(_selectedDate!)}');

    final url = Uri.https(
        "widgetwizards-c50c8-default-rtdb.firebaseio.com", 'crises.json');
    final response = await http.post(url,
        headers: {
          'Content-type': 'crises/json',
        },
        body: json.encode({
          'title': titleController.text,
          'location': locationController.text,
          'description': descriptionController.text,
          'totalInjured': totalInjuredController.text,
          'totalDeath': totalDeathsController.text,
          'date': formatter.format(_selectedDate!),
        }));
    print(response);

    // Show a success message
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Icon(Icons.check_circle, color: Colors.green, size: 50),
        content: Text('Crises saved successfully'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
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
        title: Text('Crises'),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.edit),
          //   onPressed: () {
          //     _toggleEditing();
          //   },
          // ),
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
                    child: ImageInput(
                      onPickImage: (image) {
                        widget.crises.image = image;
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  _buildInfoRow('Title:', titleController),
                  _buildInfoRow('Location:', locationController),
                  _buildInfoRow('Description:', descriptionController),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _buildInfoRow(
                            'Total Injured:', totalInjuredController),
                      ),
                      SizedBox(width: 10.0), // Add spacing between fields
                      Expanded(
                        child: _buildInfoRow(
                            'Total Deaths:', totalDeathsController),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'No date selected'
                            : formatter.format(_selectedDate!),
                      ),
                      IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(
                          Icons.calendar_month,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _saveChanges(context);
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
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
