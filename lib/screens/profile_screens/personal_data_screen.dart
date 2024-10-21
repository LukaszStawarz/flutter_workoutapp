import 'package:flutter/material.dart';
import 'package:gymapp/widgets/flat_text_button.dart';

class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 13, 14, 14),
        title: const Text(
          'Personal Data',
          style: TextStyle(color: Color(0xffACA3A5)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/profile_image.png',
                  scale: 1.5,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const TextContainerWidget(text: 'Name: '),
            const TextContainerWidget(
              text: 'Surname: ',
            ),
            const TextContainerWidget(
              text: 'Phone number: ',
            ),
            const TextContainerWidget(
              text: 'Email: ',
            ),
            const TextContainerWidget(
              text: 'Gender: ',
            ),
            const TextContainerWidget(
              text: 'Weight: ',
            ),
            const TextContainerWidget(
              text: 'Height: : ',
            ),
          ],
        ),
      ),
    );
  }
}

class TextContainerWidget extends StatelessWidget {
  const TextContainerWidget({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          width: 360,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: const [
                BoxShadow(color: Color.fromRGBO(59, 61, 78, 1)),
              ]),
          child: Row(
            children: [
              Text(text),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
