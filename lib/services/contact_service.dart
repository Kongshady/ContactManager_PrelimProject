import 'package:contact_project/models/contact.dart';

class ContactService {
  final List<Contact> _contact = [];

  List<Contact> get contact => _contact;

  void addContact(
      String name, String phoneNumber, String email, String description) {
    _contact.add(Contact(
        name: name,
        phoneNumber: phoneNumber,
        email: email,
        description: description));
  }

  void deleteContact(int index) {
    if (index >= 0 && index < _contact.length) {
      _contact.removeAt(index);
    }
  }

  void viewContact() {
    if (_contact.isEmpty) {
      print('No Contact Available. Please Add some People.');
    } else {
      for (int i = 0; i < _contact.length; i++) {
        var contact = _contact[i];
        print('${i + 1}.'
            '\nName:                ${contact.name}'
            '\nPhone Number:        ${contact.phoneNumber}'
            '\nGmail:               ${contact.email}'
            '\nPerson Description:  ${contact.description}\n');
      }
    }
  }
}
