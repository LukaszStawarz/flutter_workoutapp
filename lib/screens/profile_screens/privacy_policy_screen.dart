import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 13, 14, 14),
        title: const Text(
          'Privacy Policy',
          style: TextStyle(color: Color(0xffACA3A5)),
        ),
      ),
      body: const ShowTextWidget(),
    );
  }
}

class ShowTextWidget extends StatelessWidget {
  const ShowTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/contact_bg.png'),
            fit: BoxFit.cover),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Text(
                'Privacy Policy',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TitleTextWidget(
                text: '1. Introduction',
              ),
              const SizedBox(
                height: 8,
              ),
              TextWidget(
                text:
                    'We value your privacy and are committed to protecting your personal data. This Privacy Policy outlines how we collect, use, store, and safeguard your data when you use our application. By using our app, you agree to the practices described here.',
              ),
              const SizedBox(
                height: 8,
              ),
              TitleTextWidget(text: '2. Information We Collect'),
              const SizedBox(
                height: 8,
              ),
              TextWidget(
                text:
                    'To provide personalized and improved services, we may collect the following information: ',
              ),
              const SizedBox(
                height: 8,
              ),
              DotTextWidget(
                text:
                    'Personal Information: Name, email address, and phone number',
              ),
              const SizedBox(
                height: 8,
              ),
              DotTextWidget(
                text:
                    'Health and Fitness Data: Information on workouts, activity tracking, and progress metrics',
              ),
              const SizedBox(
                height: 8,
              ),
              DotTextWidget(
                text:
                    'Device Information: Device type, operating system, and app usage details',
              ),
              const SizedBox(
                height: 8,
              ),
              TitleTextWidget(
                text: '3. Purpose of Data Collection',
              ),
              const SizedBox(
                height: 8,
              ),
              TextWidget(
                text: 'We collect and use your data to:',
              ),
              const SizedBox(
                height: 8,
              ),
              DotTextWidget(
                text: 'Personalize training plans and recommendations',
              ),
              const SizedBox(
                height: 8,
              ),
              DotTextWidget(
                text: 'Monitor your progress and display achievements',
              ),
              const SizedBox(
                height: 8,
              ),
              DotTextWidget(
                text:
                    'Send notifications and updates about your workout schedule and app features',
              ),
              const SizedBox(
                height: 8,
              ),
              DotTextWidget(
                text: 'Communicate with you for support and feedback',
              ),
              const SizedBox(
                height: 8,
              ),
              TitleTextWidget(
                text: '4. Data Security',
              ),
              const SizedBox(
                height: 8,
              ),
              TextWidget(
                text:
                    'We take appropriate technical and organizational measures to protect your personal data from unauthorized access, loss, or misuse. All data stored within our app is encrypted to maintain confidentiality and integrity.',
              ),
              const SizedBox(
                height: 8,
              ),
              TitleTextWidget(
                text: '5. Data Sharing',
              ),
              const SizedBox(
                height: 8,
              ),
              TextWidget(
                text:
                    'Your personal data will not be sold, rented, or shared with third parties except:',
              ),
              const SizedBox(
                height: 8,
              ),
              DotTextWidget(
                text: 'When required by law',
              ),
              const SizedBox(
                height: 8,
              ),
              DotTextWidget(
                text:
                    'With trusted third-party services (only for essential app functionalities)',
              ),
              const SizedBox(
                height: 8,
              ),
              TitleTextWidget(
                text: '6. Access and Control of Your Data',
              ),
              const SizedBox(
                height: 8,
              ),
              TextWidget(
                text:
                    'You have the right to view, update, and delete your data. You may request these changes through the Personal Data section or by contacting us directly.',
              ),
              const SizedBox(
                height: 8,
              ),
              TitleTextWidget(
                text: '7. Data Retention',
              ),
              const SizedBox(
                height: 8,
              ),
              TextWidget(
                text:
                    'Your data will be retained as long as necessary to provide our services or as required by law. If you delete your account, your data will be erased from our systems, except where retention is required for legal purposes.',
              ),
              const SizedBox(
                height: 8,
              ),
              TitleTextWidget(
                text: '8. Changes to This Privacy Policy',
              ),
              const SizedBox(
                height: 8,
              ),
              TextWidget(
                text:
                    'We may update this Privacy Policy periodically. Any changes will be communicated via in-app notifications, and we encourage you to review it to stay informed.',
              ),
              const SizedBox(
                height: 8,
              ),
              TitleTextWidget(
                text: '9. Contact Us',
              ),
              const SizedBox(
                height: 8,
              ),
              TextWidget(
                text:
                    'If you have any questions or concerns regarding our Privacy Policy, please feel free to contact us through the Contact Us section in the app.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DotTextWidget extends StatelessWidget {
  DotTextWidget({super.key, required this.text});
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 7),
            child: Icon(Icons.circle, size: 8, color: Colors.white)), // Kropka
        SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class TextWidget extends StatelessWidget {
  TextWidget({super.key, required this.text});
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 14,
        color: Colors.white,
      ),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  TitleTextWidget({super.key, required this.text});
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 18,
        color: Colors.white,
      ),
    );
  }
}
