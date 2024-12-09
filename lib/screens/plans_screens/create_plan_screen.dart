import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/models/breathing.dart';
import 'package:gymapp/models/cardio.dart';
import 'package:gymapp/models/exercises.dart';
import 'package:gymapp/models/strength.dart';
import 'package:gymapp/models/warmup.dart';
import 'package:gymapp/models/yoga.dart';
import 'package:gymapp/providers/exercise_provider.dart';
import 'package:gymapp/providers/user_plan_create_provider.dart';
import 'package:gymapp/screens/plans_screens/your_plans_screen.dart';
import 'package:gymapp/widgets/button_bp.dart';
import 'package:provider/provider.dart';

class CreatePlanScreen extends StatefulWidget {
  const CreatePlanScreen({super.key});

  @override
  State<CreatePlanScreen> createState() => _CreatePlanScreenState();
}

class _CreatePlanScreenState extends State<CreatePlanScreen> {
  String name = '';
  late TextEditingController controllerName;
  late TextEditingController controllerDesc;

  @override
  void initState() {
    super.initState();
    controllerName = TextEditingController();
    controllerDesc = TextEditingController();
  }

  void dispose() {
    controllerName.dispose();
    controllerDesc.dispose();
    super.dispose();
  }

  void submit() {
    // walidacje czy pola są puste
    if (controllerName.text.isEmpty || controllerDesc.text.isEmpty) {
      return;
    }

    Navigator.of(context).pop(true);
  }

  Future<String?> openDialog() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Plan details'),
        content: Column(
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: 'Plan name'),
              controller: controllerName,
            ),
            TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: 'Description'),
              controller: controllerDesc,
            ),
          ],
        ),
        actions: [TextButton(onPressed: submit, child: const Text('Submit'))],
      ),
    );

    if (result == true) {
      final name = controllerName.text;
      final desc = controllerDesc.text;
      // wywolac zapisanie z providera
      context.read<UserPlanCreateProvider>().savePlan(name, desc);
    }
  }

  @override
  Widget build(BuildContext context) {
    final exerciseProvider = context.watch<ExerciseProvider>();
    // final List<Yoga> yoga = exerciseProvider.yogaList;
    // final List<Breathing> breathing = exerciseProvider.breathingList;
    // final List<Cardio> cardio = exerciseProvider.cardioList;
    // final List<WarmUp> warmup = exerciseProvider.warmUpList;
    // final List<Strength> strength = exerciseProvider.strengthList;
    final List<Exercises> yoga = exerciseProvider.exercisesList
        .where(
          (element) => element.type == 'Yoga',
        )
        .toList();
    final List<Exercises> breathing = exerciseProvider.exercisesList
        .where(
          (element) => element.type == 'Breathing',
        )
        .toList();
    final List<Exercises> cardio = exerciseProvider.exercisesList
        .where(
          (element) => element.type == 'Cardio',
        )
        .toList();
    final List<Exercises> warmup = exerciseProvider.exercisesList
        .where(
          (element) => element.type == 'Warmup',
        )
        .toList();
    final List<Exercises> strength = exerciseProvider.exercisesList
        .where(
          (element) => element.type == 'Strength',
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add exercises',
        ),
      ),
      body: exerciseProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(children: [
              Scrollbar(
                interactive: true,
                thickness: 8,
                thumbVisibility: true,
                trackVisibility: true,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 138, 135, 136))),
                          child: Column(
                            children: [
                              Text(
                                'Breathing Exercises',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              ...breathing.map((e) => ListComponent(
                                    onclick: () {},
                                    name: e.title,
                                    videourl: e.videourl,
                                    exerciseId: e.id!,
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: const Color.fromARGB(255, 138, 135, 136),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Cardio Exercises',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              ...cardio.map(
                                (e) => ListComponent(
                                  onclick: () {},
                                  name: e.title,
                                  videourl: e.videourl,
                                  exerciseId: e.id!,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 138, 135, 136))),
                          child: Column(
                            children: [
                              Text(
                                'Strength Exercises',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              ...strength.map((e) => ListComponent(
                                    onclick: () {},
                                    name: e.title,
                                    videourl: e.videourl,
                                    exerciseId: e.id!,
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 138, 135, 136))),
                          child: Column(
                            children: [
                              Text(
                                'Warm-up Exercises',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              ...warmup.map((e) => ListComponent(
                                    onclick: () {},
                                    name: e.title,
                                    videourl: e.videourl,
                                    exerciseId: e.id!,
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 138, 135, 136))),
                          child: Column(
                            children: [
                              Text(
                                'Yoga Exercises',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              ...yoga.map(
                                (e) => ListComponent(
                                  onclick: () {},
                                  name: e.title,
                                  videourl: e.videourl,
                                  exerciseId: e.id!,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: ButtonBP(
                      buttonText: 'Next',
                      onClick: () async {
                        await openDialog();
                      }))
            ]),
    );
  }
}

class ListComponent extends StatefulWidget {
  const ListComponent({
    super.key,
    required this.onclick,
    required this.name,
    required this.videourl,
    required this.exerciseId,
  });

  final Function() onclick;
  final String name;
  final String videourl;
  final String exerciseId;

  @override
  State<ListComponent> createState() => _ListComponentState();
}

class _ListComponentState extends State<ListComponent> {
  late final UserPlanCreateProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = context.read<UserPlanCreateProvider>();
  }

  bool isChecked = false;
  void _toggleCheckbox() {
    setState(() {
      isChecked = !isChecked;
    });

    if (isChecked) {
      provider.addToSelected(widget.exerciseId);
    } else {
      provider.removeFromSelected(widget.exerciseId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCheckbox,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            SizedBox(
              height: 40,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.videourl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                widget.name,
                style: GoogleFonts.poppins(
                  color: isChecked ? Colors.purple : Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Checkbox(
                shape: const CircleBorder(),
                value: isChecked,
                activeColor: Colors.purple,
                onChanged: (value) {
                  _toggleCheckbox();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//       child: GestureDetector(
//         behavior: HitTestBehavior.opaque,
//         onTap: () {
//           widget.onclick.call();
//         },
//         child: GestureDetector(
//           child: Container(
//             child: Row(
//               children: [
//                 Image.asset('assets/images/Exercise_example_image.png'),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Text(
//                   widget.name,
//                   style: GoogleFonts.poppins(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w300,
//                     fontSize: 16,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Checkbox(
//                       shape: const CircleBorder(),
//                       value: isChecked,
//                       activeColor: Colors.purple,
//                       onChanged: (newBool) {
//                         setState(() {
//                           isChecked = newBool;
//                         });
//                       },
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
