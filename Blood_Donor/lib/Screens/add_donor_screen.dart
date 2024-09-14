import 'package:flutter/material.dart';
import 'package:blood_donor/hive_service.dart';
import 'package:blood_donor/donor.dart';

class AddDonorScreen extends StatefulWidget {
  @override
  _AddDonorScreenState createState() => _AddDonorScreenState();
}

class _AddDonorScreenState extends State<AddDonorScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _bloodType = '';
  String _contact = '';

  void _saveDonor() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newDonor =
          Donor(name: _name, bloodType: _bloodType, contact: _contact);
      HiveService.getDonorBox().add(newDonor);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Donor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Blood Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a blood type';
                  }
                  return null;
                },
                onSaved: (value) {
                  _bloodType = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contact'),
                keyboardType: TextInputType.phone,
                maxLength: 10,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a contact number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _contact = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveDonor,
                child: Text('Save Donor'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
