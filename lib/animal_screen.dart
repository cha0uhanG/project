import 'package:flutter/material.dart';
import 'Animal_detail.dart';
//import 'animal_details_page.dart';

class AnimalListPage extends StatelessWidget {
  final List<String> animals = [
    'Dog',
    'Cat',
    'Sparrow',
    'Pigeon',
    'Octopus',
    'Rhino',
    'Leopard',
    'Lion',
    'Jaguar'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Animal List', style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),)),
      ),
      body: ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(animals[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimalDetailsPage(animalName: animals[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
