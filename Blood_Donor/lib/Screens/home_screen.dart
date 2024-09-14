import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:blood_donor/hive_service.dart';
import 'package:blood_donor/donor.dart';
import 'add_donor_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blood Donors',
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: HiveService.getDonorBox().listenable(),
        builder: (context, Box<Donor> box, _) {
          if (box.values.isEmpty) {
            return Center(child: Text('No donors found. Add some!'));
          } else {
            return ListView.builder(
              itemCount: box.values.length,
              itemBuilder: (context, index) {
                Donor donor = box.getAt(index)!;
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      child: Text(
                        donor.bloodType,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(donor.name),
                    subtitle: Text('Contact: ${donor.contact}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        donor.delete();
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddDonorScreen()),
          );
        },
      ),
    );
  }
}
