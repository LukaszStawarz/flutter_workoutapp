import 'package:flutter/material.dart';
import 'package:gymapp/providers/user_data_getter_provider.dart';

import 'package:provider/provider.dart';

class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userDataGetterProvider = Provider.of<UserDataGetterProvider>(context);

    if (userDataGetterProvider.userData == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profil Użytkownika'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      final userData = userDataGetterProvider.userData;
      return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 13, 14, 14),
            title: const Text(
              'Personal Data',
              style: TextStyle(color: Color(0xffACA3A5)),
            ),
          ),
          body: userDataGetterProvider.userData != null
              ? Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg_example2.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                    child: SingleChildScrollView(
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
                          TextContainerWidget(
                              text: 'Name: ',
                              userData: '${userData!['user_name']}'),
                          TextContainerWidget(
                              text: 'Surname: ',
                              userData: '${userData['user_lastname']}'),
                          TextContainerWidget(
                              text: 'Phone number: ',
                              userData: '${userData['user_phone_number']}'),
                          TextContainerWidget(
                              text: 'Email: ',
                              userData: '${userData['user_email']}'),
                          TextContainerWidget(
                              text: 'Gender: ',
                              userData: '${userData['gender']}'),
                          TextContainerWidget(
                              text: 'Weight: ',
                              userData: '${userData['weight']}'),
                          TextContainerWidget(
                              text: 'Height: : ',
                              userData: '${userData['height']}'),
                        ],
                      ),
                    ),
                  ),
                )
              : Container());
    }
  }
}

class TextContainerWidget extends StatelessWidget {
  const TextContainerWidget(
      {super.key, required this.text, required this.userData});
  final String userData;
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
            children: [Text(text), Text(userData)],
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
