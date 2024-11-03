import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/providers/user_data_provider.dart';
import 'package:gymapp/screens/main_screen_widget.dart';
import 'package:gymapp/widgets/button_bp.dart';
import 'package:gymapp/widgets/textinput.dart';
import 'package:provider/provider.dart';

class SignUpDetailsScreen extends StatefulWidget {
  const SignUpDetailsScreen({super.key});

  @override
  State<SignUpDetailsScreen> createState() => _SignUpDetailsScreenState();
}

class _SignUpDetailsScreenState extends State<SignUpDetailsScreen> {
  late final UserDataProvider userDataProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userDataProvider = context.read<UserDataProvider>();
  }

  final _formKey = GlobalKey<FormState>();
  var _enteredDob = '';
  var _enteredHeight = '';
  var _enteredWeight = '';
  // String? _gender;

  String _selectedGender = '';
  // void _saveGender(String? value) {
  //   _gender = value;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/lady_image.png',
                  width: 350,
                  height: 350,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    "Let's complete your profile"),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'It will help us to know more about you!',
                  style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 136, 133, 134),
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.people_alt_outlined,
                      color: Color.fromARGB(255, 136, 133, 134),
                    ),
                    Flexible(
                      child: GenderPickerWidget(
                        hintT: 'Gender',
                        backgroundColor: const Color(0xff161818),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Gender';
                          }
                          return null;
                        },
                        onSaved: ((p0) {
                          _selectedGender = p0!;
                        }),
                      ),
                    ),
                  ],
                ),
                Row(
                  //date of birth
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Color.fromARGB(255, 136, 133, 134),
                    ),
                    Flexible(
                      child: DatePickerWidget(
                        hintT: 'Date of birth',
                        backgroundColor: const Color(0xff161818),
                        hideText: false,
                        validator: (p0) {
                          if (p0 == null || p0.trim().isEmpty) {
                            return 'Please enter Date of birth';
                          }
                          return null;
                        },
                        onSaved: ((p0) {
                          _enteredDob = p0!;
                        }),
                      ),
                    ),
                  ],
                ),
                Row(
                  //Weight
                  children: [
                    const Icon(
                      Icons.monitor_weight_outlined,
                      color: Color.fromARGB(255, 136, 133, 134),
                      size: 28,
                    ),
                    Flexible(
                      child: TextInputWidget(
                        hintT: 'Your Weight (kg)',
                        backgroundColor: const Color(0xff161818),
                        keyboardType: TextInputType.number,
                        hideText: false,
                        validator: (p0) {
                          if (p0 == null || p0.trim().isEmpty) {
                            return 'Please enter your weight';
                          }
                          return null;
                        },
                        onSaved: ((p0) {
                          _enteredWeight = p0!;
                        }),
                      ),
                    ),
                  ],
                ),
                Row(
                  //Height
                  children: [
                    const Icon(
                      Icons.height,
                      color: Color.fromARGB(255, 136, 133, 134),
                      size: 28,
                    ),
                    Flexible(
                      child: TextInputWidget(
                        hintT: 'Your Height (cm)',
                        backgroundColor: const Color(0xff161818),
                        keyboardType: TextInputType.number,
                        hideText: false,
                        validator: (p0) {
                          if (p0 == null || p0.trim().isEmpty) {
                            return 'Please enter your height';
                          }
                          return null;
                        },
                        onSaved: ((p0) {
                          _enteredHeight = p0!;
                        }),
                      ),
                    ),
                  ],
                ),
                ButtonBP(
                  buttonText: 'Finish',
                  onClick: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      userDataProvider.updateUserData(
                        gender: _selectedGender,
                        dateTime: _enteredDob.toString(),
                        weight: _enteredWeight,
                        height: _enteredHeight,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreenWidget(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    super.key,
    required this.hintT,
    required this.backgroundColor,
    required this.hideText,
    required this.validator,
    required this.onSaved,
  });

  final String hintT;
  final Color backgroundColor;
  static const BorderRadius _radius = BorderRadius.all(Radius.circular(20));

  final bool hideText;
  final String? Function(String?)? validator;
  final Function(String?) onSaved;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());
    if (pickedDate != null) {
      setState(() {
        _dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: TextFormField(
        controller: _dateController,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        style: const TextStyle(color: Color.fromRGBO(159, 111, 222, 1)),
        decoration: InputDecoration(
          fillColor: widget.backgroundColor,
          filled: true,

          //iconColor: Color.fromRGBO(118, 50, 208, 1),

          enabledBorder: const OutlineInputBorder(
            borderRadius: DatePickerWidget._radius,
            borderSide: BorderSide(color: Color.fromRGBO(118, 50, 208, 1)),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: DatePickerWidget._radius,
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: DatePickerWidget._radius,
            borderSide: BorderSide(color: Colors.blue),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: DatePickerWidget._radius,
            borderSide: BorderSide(color: Colors.blue),
          ),
          hintText: widget.hintT,
          hintStyle: const TextStyle(
            color: Color.fromRGBO(118, 50, 208, 1),
          ),
        ),
        autocorrect: false,
        obscureText: widget.hideText,
        validator: widget.validator,
        onSaved: widget.onSaved,
        onTap: () {
          _selectDate(context);
          // FocusScope.of(context).requestFocus(new FocusNode());
        },
        readOnly: true,
      ),
    );
  }
}

class GenderPickerWidget extends StatefulWidget {
  const GenderPickerWidget({
    super.key,
    required this.hintT,
    required this.backgroundColor,
    required this.validator,
    required this.onSaved,
  });

  final String hintT;
  final Color backgroundColor;
  static const BorderRadius _radius = BorderRadius.all(Radius.circular(20));
  final String? Function(String?)? validator;
  final Function(String?) onSaved;

  @override
  _GenderPickerWidgetState createState() => _GenderPickerWidgetState();
}

class _GenderPickerWidgetState extends State<GenderPickerWidget> {
  String? _selectedGender;

  final List<String> genderOptions = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: DropdownButtonFormField<String>(
        value: _selectedGender,
        onChanged: (String? newValue) {
          setState(() {
            _selectedGender = newValue;
          });
        },
        decoration: InputDecoration(
          fillColor: widget.backgroundColor,
          filled: true,
          enabledBorder: const OutlineInputBorder(
            borderRadius: GenderPickerWidget._radius,
            borderSide: BorderSide(color: Color.fromRGBO(118, 50, 208, 1)),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: GenderPickerWidget._radius,
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: GenderPickerWidget._radius,
            borderSide: BorderSide(color: Colors.blue),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: GenderPickerWidget._radius,
            borderSide: BorderSide(color: Colors.blue),
          ),
          hintText: widget.hintT,
          hintStyle: const TextStyle(
            color: Color.fromRGBO(118, 50, 208, 1),
          ),
        ),
        items: genderOptions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,
                style:
                    const TextStyle(color: Color.fromRGBO(159, 111, 222, 1))),
          );
        }).toList(),
        validator: widget.validator,
        onSaved: widget.onSaved,
      ),
    );
  }
}
