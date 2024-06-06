import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 13, 14, 14),
        title: const Text(
          'Contact Us',
          style: TextStyle(color: Color(0xffACA3A5)),
        ),
      ),
    );
  }
}
