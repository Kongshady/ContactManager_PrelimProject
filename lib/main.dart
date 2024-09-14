import 'dart:io';

import 'package:contact_project/services/contact_service.dart';
import 'package:riverpod/riverpod.dart';

final contactServiceProvider = Provider((ref) => ContactService());

void main() {
  final container = ProviderContainer();
  final taskService = container.read(contactServiceProvider);

  print('Contact Management App');
  bool running = true;

  while (running) {
    print('\nCHOOSE AN OPTION..');
    print('1. Add a Contact');
    print('2. View Contacts');
    print('3. Delete a Contact');
    print('4. Exit\n');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('\nEnter Contact Name: ');
        String? name = stdin.readLineSync();
        stdout.write('Enter Phone Number: ');
        String? phoneNumber = stdin.readLineSync();
        stdout.write('Enter Email: ');
        String? email = stdin.readLineSync();
        stdout.write('Enter Contact description: ');
        String? description = stdin.readLineSync();
        if (name != null &&
            phoneNumber != null &&
            email != null &&
            description != null) {
          taskService.addContact(name, phoneNumber, email, description);
          print('\nContact has been Added!');
        } else {
          print('Invalid Input. Contact not added, Please try again.');
        }
        break;

      case '2':
        print('\nContact List: \n');
        taskService.viewContact();
        break;

      case '3':
        stdout.write('\nEnter Contact list number to delete: ');
        String? taskNumber = stdin.readLineSync();
        if (taskNumber != null && int.tryParse(taskNumber) != null) {
          int index = int.parse(taskNumber) - 1;
          taskService.deleteContact(index);
          print('\nA Contact Deleted!');
        } else {
          print('Invalid Input. Please try again.');
        }
        break;

      case '4':
        running = false;
        print('Exiting..');
        break;

      default:
        print('Option Invalid.\n');
    }
  }
}
