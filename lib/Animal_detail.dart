import 'package:flutter/material.dart';

class AnimalDetailsPage extends StatelessWidget {
  final String animalName;

  AnimalDetailsPage({required this.animalName});

  @override
  Widget build(BuildContext context) {
    String animalDetails = getAnimalDetails(animalName);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Animal Details',style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Details for $animalName',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                animalDetails,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getAnimalDetails(String animalName) {
    switch (animalName) {
      case 'Dog':
        return 'Dogs were the first animal to domesticated.';
      case 'Cat':
        return 'Cats have very good flex that help in countering threat.';
      case 'Sparrow':
        return 'Sparrows are mostly found everywhere.';
      case 'Pigeon':
        return 'Pigeons were used for communication in ancient time.';
      case 'Octopus':
        return 'Octopuses have the ability to camouflage according to enviorment.';
      case 'Rhino':
        return 'Rhinos are found in kaziranga park';
      case 'Leopard':
        return 'Leopards like to live and hunt alone.';
      case 'Lion':
        return 'Lions are majestic and powerful predators.';
      case 'Jaguar':
        return 'Jaguars belongs to same category as leopard.';
      default:
        return '';
    }
  }
}
