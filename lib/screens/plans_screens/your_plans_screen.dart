import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/models/user_plan.dart';
import 'package:gymapp/providers/plans_provider.dart';
import 'package:gymapp/providers/user_plan_create_provider.dart';
import 'package:gymapp/screens/plans_screens/create_plan_screen.dart';
import 'package:gymapp/screens/plans_screens/plan_details.dart';
import 'package:provider/provider.dart';

class YourPlansScreen extends StatefulWidget {
  const YourPlansScreen({super.key});

  @override
  State<YourPlansScreen> createState() => _YourPlansScreenState();
}

class _YourPlansScreenState extends State<YourPlansScreen> {
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _fetchPlans();
  }

  Future<void> _fetchPlans() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await Provider.of<PlanProvider>(context, listen: false).getUserPlans();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching plans: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final plans = Provider.of<PlanProvider>(context).userPlan;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Plans'),
      ),
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          child: Icon(
            Icons.add,
            size: 50,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                  create: (context) => UserPlanCreateProvider(),
                  child: CreatePlanScreen(),
                ),
              ),
            );
          },
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : plans.isEmpty
              ? const Center(
                  child: Text('No plans available.'),
                )
              : Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...plans.map(
                          (e) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: YourPlansWidget(userPlan: e),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}

class YourPlansWidget extends StatelessWidget {
  const YourPlansWidget({super.key, required this.userPlan});
  final UserPlan userPlan;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        width: 370,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage(
              'assets/images/plan_background_image.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => PlanDetailsScreen(
            //       subplan: ,
            //       planId: ,
            //     ),
            //   ),
            // );
          },
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Text(
                      userPlan.planTitle,
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6 // Grubość obrysu
                          ..color = Colors.black, // Kolor obrysu
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      userPlan.planTitle,
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff7632D0), // Kolor wypełnienia
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
