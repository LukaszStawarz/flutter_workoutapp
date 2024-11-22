import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gymapp/models/exercises.dart';
import 'package:gymapp/models/plans.dart';
import 'package:gymapp/models/subplan.dart';

void setup() {
  final collectionReference =
      FirebaseFirestore.instance.collection('exercises');
  final List<Exercises> exercises = [];
  for (final exercise in exerciseData) {
    final Exercises exerciseData = Exercises.fromJson(exercise);
    exercises.add(exerciseData);
    if (exerciseData.title != null && exerciseData.title!.isNotEmpty) {
      collectionReference
          .doc(exerciseData.title!
              .replaceAll(' ', '')
              .replaceAll('-', '')
              .replaceAll('\'', '')
              .replaceAll('’', ''))
          .set(exerciseData.toJson());
    }
  }
  final x = convertToNewPlanFormat(originalData);
  final x1 = convertToNewPlanFormat(breathingData);
  final x2 = convertToNewPlanFormat(cardioData);
  final x3 = convertToNewPlanFormat(strengthData);
  final x4 = convertToNewPlanFormat(warmUpData);

  final xData = [x, x1, x2, x3, x4];

  for (final planModel in xData) {
    for (final subplan in planModel.subplan) {
      for (int i = 0; i < subplan.exercises.length; i++) {
        subplan.exercises[i] = subplan.exercises[i]
            .replaceAll(' ', '')
            .replaceAll('-', '')
            .replaceAll('\'', '')
            .replaceAll('’', '');
      }
    }
  }

  // FirebaseFirestore.instance.collection('plans1').add(x.toJson());
  // FirebaseFirestore.instance.collection('plans1').add(x1.toJson());
  // FirebaseFirestore.instance.collection('plans1').add(x2.toJson());
  // FirebaseFirestore.instance.collection('plans1').add(x3.toJson());
  // FirebaseFirestore.instance.collection('plans1').add(x4.toJson());

  FirebaseFirestore.instance.collection('plans').add(x.toJson());
  FirebaseFirestore.instance.collection('plans').add(x1.toJson());
  FirebaseFirestore.instance.collection('plans').add(x2.toJson());
  FirebaseFirestore.instance.collection('plans').add(x3.toJson());
  FirebaseFirestore.instance.collection('plans').add(x4.toJson());
}

Plan convertToNewPlanFormat(Map<String, dynamic> data) {
  return Plan(
    id: '',
    title: data['title'],
    dashboardImageUrl: data['imageURL'],
    subplan: [
      SubPlan(
        data['image_easy'],
        index: 0,
        planTitle: data['wk_plan1'],
        exercises: List<String>.from(data['wk_ex1']),
        time: data['time1'],
        description: data['wk_desc1'],
      ),
      SubPlan(
        data['image_med'],
        index: 1,
        planTitle: data['wk_plan2'],
        exercises: List<String>.from(data['wk_ex2']),
        time: data['time2'],
        description: data['wk_desc2'],
      ),
      SubPlan(
        data['image_hard'],
        index: 2,
        planTitle: data['wk_plan3'],
        exercises: List<String>.from(data['wk_ex3']),
        time: data['time3'],
        description: data['wk_desc3'],
      ),
      SubPlan(
        data['image_4'],
        index: 3,
        planTitle: data['wk_plan4'],
        exercises: List<String>.from(data['wk_ex4']),
        time: data['time4'],
        description: data['wk_desc4'],
      ),
      SubPlan(
        data['image_5'],
        index: 4,
        planTitle: data['wk_plan5'],
        exercises: List<String>.from(data['wk_ex5']),
        time: data['time5'],
        description: data['wk_desc5'],
      ),
    ],
  );
}

final Map<String, dynamic> originalData = {
  "title": "Yoga",
  "example_img":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fistockphoto-1218120799-2048x2048.jpg?alt=media&token=cccf34a1-cf9d-48f9-8ae9-df44b8166432",
  "imageURL":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fyoga.png?alt=media&token=119b57f1-d928-4e84-aca4-588586515ad6",
  "image_easy":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fyoga3.jpg?alt=media&token=700aaee6-deec-4350-a268-003b42f99893",
  "image_med":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fyoga2.jpg?alt=media&token=b6037ec0-23ed-411c-bd35-dad9e46de596",
  "image_hard":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fyoga1.jpg?alt=media&token=09bb3d4e-6eec-4c51-8e69-6fb7f132893a",
  "image_4":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fyoga4.jpg?alt=media&token=42d468b5-acec-4c23-89e3-8b2e306a8b22",
  "image_5":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fyoga5.jpg?alt=media&token=a5608494-631a-46a8-b932-b66c1a080d8c",
  "wk_plan1": "Yoga for Beginners",
  "wk_plan2": "Intermediate Yoga",
  "wk_plan3": "Advanced Yoga",
  "wk_plan4": "Gentle Flow Yoga",
  "wk_plan5": "Morning Wake-Up Yoga",
  "wk_ex1": ["Boat Pose", "Childs Pose", "Tree Pose"],
  "wk_ex2": ["Seated Forward Bend", "Triangle Pose", "Boat Pose", "Camel Pose"],
  "wk_ex3": [
    "Boat Pose",
    "Seated Forward Bend",
    "Triangle Pose",
    "Warrior II",
    "Downward Dog",
    "Crow Pose"
  ],
  "wk_ex4": [
    "Child’s Pose",
    "Cat-Cow Stretch",
    "Downward Dog",
    "Warrior II",
    "Corpse Pose",
  ],
  "wk_ex5": [
    "Child’s Pose",
    "Cobra Pose",
    "Mountain Pose",
    "Tree Pose",
    "Seated Forward Bend",
    "Crow Pose"
  ],
  "time1": "20",
  "time2": "40",
  "time3": "60",
  "time4": "20",
  "time5": "30",
  "wk_desc1":
      "This gentle yoga flow is perfect for beginners, focusing on basic poses that promote relaxation, flexibility, and a mindful connection between body and breath.",
  "wk_desc2":
      "This intermediate session offers a balanced mix of strength and flexibility, incorporating more challenging poses to deepen your practice and enhance overall well-being.",
  "wk_desc3":
      "A rigorous yoga practice designed for seasoned yogis, this advanced session focuses on complex poses and transitions to challenge your strength, balance, and focus.",
  "wk_desc4":
      "This gentle yoga flow focuses on basic poses that promote relaxation, flexibility, and a mindful connection between body and breath.",
  "wk_desc5":
      "Start your day with invigorating yoga postures to awaken the body and mind.",
};

final Map<String, dynamic> warmUpData = {
  "title": "Warm-up",
  "example_img":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fistockphoto-1218120799-2048x2048.jpg?alt=media&token=cccf34a1-cf9d-48f9-8ae9-df44b8166432",
  "imageURL":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fwarm_up.png?alt=media&token=8fda2125-357e-43b6-8b7f-77c4d8dc5b29",
  "image_easy":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Feasy_warm_up.jpg?alt=media&token=f34ef319-fcdc-4776-ad9f-59a504846db4",
  "image_med":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fmedium_warm_up.jpg?alt=media&token=3dbcd829-ba41-4931-9876-32f46142a006",
  "image_hard":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fdifficult_warm_up.jpg?alt=media&token=4b07f58a-5f7d-4f87-8af8-60488a72bc44",
  "image_4":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fwarm_up4.jpg?alt=media&token=f0f8ce16-cfe6-47a8-a406-08b9a7166124",
  "image_5":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fwarm_up5.jpg?alt=media&token=0c6f4ad9-d4cb-49c3-8382-e7e50bfd0095",
  "wk_plan1": "Easy Warm-up",
  "wk_plan2": "Medium Warm-up",
  "wk_plan3": "Difficult Warm-up",
  "wk_plan4": "Full-Body Warm-Up",
  "wk_plan5": "Dynamic Stretch Warm-Up",
  "wk_ex1": ["Arm Circles", "High Kicks", "Leg Swings"],
  "wk_ex2": [
    "Arm Circles",
    "Leg Swings",
    "Torso Twist",
    "Jumping Jacks",
    "Lunges"
  ],
  "wk_ex3": [
    "Arm Circles",
    "Arm Swings",
    "Torso Twist",
    "Lunges",
    "Jumping Jacks",
    "Leg Swings",
    "Hip Circles",
    "High Kicks"
  ],
  "wk_ex4": [
    "Hip Circles",
    "Arm Circles",
    "Lunges",
    "Leg Swings",
    "Arm Swings"
  ],
  "wk_ex5": [
    "High Knees",
    "Walking Lunges",
    "Butt Kicks",
    "Toy Soldiers",
    "Inchworm"
  ],
  "time1": "15",
  "time2": "30",
  "time3": "45",
  "time4": "10",
  "time5": "15",
  "wk_desc1":
      "This simple warm-up routine prepares your body for activity with dynamic stretches and light movements, ensuring you’re ready to perform at your best.",
  "wk_desc2":
      "This moderate warm-up session combines dynamic stretches and light cardio to increase your heart rate and flexibility, setting the stage for a productive workout.",
  "wk_desc3":
      "An intensive warm-up designed for serious athletes, this routine incorporates advanced movements to activate muscles and prepare your body for high-performance training.",
  "wk_desc4":
      "Get your body ready for any workout with a full-body warm-up routine.",
  "wk_desc5":
      "Activate muscles and improve range of motion with dynamic stretches.",
};

final Map<String, dynamic> strengthData = {
  "title": "Strength",
  "example_img":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fistockphoto-1218120799-2048x2048.jpg?alt=media&token=cccf34a1-cf9d-48f9-8ae9-df44b8166432",
  "imageURL":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fstrength.png?alt=media&token=25ee8faa-b6ac-4e14-84a5-357081a70b06",
  "image_easy":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Feasy_workout.jpg?alt=media&token=0553da7f-abf2-4c3c-9dec-ad4549c254d1",
  "image_med":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fmedium_workout.jpg?alt=media&token=cca8de5b-3efa-4939-9a6b-6e2b42df8b8b",
  "image_hard":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fhard_workout.jpg?alt=media&token=3565e260-f5ca-4154-a59c-ba36cf16685f",
  "image_4":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fstrength4.jpg?alt=media&token=784f04cd-0b35-4bfe-afbc-e9800f92c127",
  "image_5":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fstrength5.jpg?alt=media&token=a622c1f0-5df5-41af-b63e-7e323e87e6d2",
  "wk_plan1": "Easy Workout",
  "wk_plan2": "Medium Workout",
  "wk_plan3": "Difficult Workout",
  "wk_plan4": "Total Body Strength",
  "wk_plan5": "Upper Body Blast",
  "wk_ex1": ["Pull-Ups", "Bench Press", "Squats"],
  "wk_ex2": [
    "Squats",
    "Pull-Ups",
    "Bench Press",
    "Plank",
    "Biceps Curls",
    "Leg Press"
  ],
  "wk_ex3": [
    "Plank",
    "Pull-Ups",
    "Squats",
    "Biceps Curls",
    "Leg Press",
    "Tricep Dips",
    "Dumbbell Shoulder Press",
    "Deadlifts",
    "Lat Pulldown"
  ],
  "wk_ex4": [
    "Squats",
    "Deadlifts",
    "Bench Press",
    "Bent-Over Row",
    "Plank",
    "Lat Pulldown"
  ],
  "wk_ex5": [
    "Push-Ups",
    "Dumbbell Shoulder Press",
    "Tricep Extensions",
    "Biceps Curls",
    "Pull-Ups",
    "Tricep Dips",
  ],
  "time1": "30",
  "time2": "70",
  "time3": "100",
  "time4": "45",
  "time5": "30",
  "wk_desc1":
      "This beginner-friendly program focuses on foundational exercises to build overall strength and flexibility. Ideal for newcomers to strength training, it promotes a gentle yet effective approach to fitness.",
  "wk_desc2":
      "This intermediate program challenges your muscles with a balanced mix of strength-building exercises. Designed to enhance your endurance and promote muscle growth, it's perfect for those ready to take their training to the next level.",
  "wk_desc3":
      "This advanced training program is designed for seasoned fitness enthusiasts looking to push their limits. Featuring intense exercises that target all major muscle groups, it aims to build significant strength and muscle mass while improving overall performance.",
  "wk_desc4":
      "This plan targets major muscle groups to build overall strength and endurance.",
  "wk_desc5":
      "Strengthen your arms, shoulders, and chest with targeted upper-body exercises.",
};

final Map<String, dynamic> cardioData = {
  "title": "Cardio",
  "example_img":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fistockphoto-1218120799-2048x2048.jpg?alt=media&token=cccf34a1-cf9d-48f9-8ae9-df44b8166432",
  "imageURL":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fcardio.png?alt=media&token=f19cc6b8-c531-4e23-8141-ead90a55ff47",
  "image_easy":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fcardio1.jpg?alt=media&token=c6930514-ef90-4119-8e9e-7eea61cda79a",
  "image_med":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fcardio3.jpg?alt=media&token=92e685f3-c5d9-47cd-baa2-b52d450019c9",
  "image_hard":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fcardio2.jpg?alt=media&token=3dcb2ff3-ed9d-4908-8540-50e3683102b4",
  "image_4":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fcardio4.jpg?alt=media&token=1eb62daf-fa98-4d8f-9258-ecf2977de588",
  "image_5":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fcardio5.jpg?alt=media&token=0d986226-82d8-4fb3-9772-a4c8b65863ea",
  "wk_plan1": "Run for Your Life",
  "wk_plan2": "Fat-Burning Frenzy",
  "wk_plan3": "Metabolic Meltdown",
  "wk_plan4": "HIIT Blast",
  "wk_plan5": "Endurance Builder",
  "wk_ex1": [
    "Box Jumps",
    "Cycling",
    "Treadmill Running",
    "Elliptical Training"
  ],
  "wk_ex2": [
    "Shadow Boxing",
    "Stair Climbing",
    "High Knees",
    "Elliptical Training",
    "Burpees",
    "Treadmill Running"
  ],
  "wk_ex3": [
    "Treadmill Running",
    "Burpees",
    "Rowing Machine",
    "Box Jumps",
    "High Knees",
    "Stair Climbing",
    "Jump Rope",
    "Cycling",
    "Shadow Boxing"
  ],
  "wk_ex4": [
    "Jumping Jacks",
    "Burpees",
    "High Knees",
    "Mountain Climbers",
    "Skaters",
  ],
  "wk_ex5": [
    "Jogging",
    "Jump Rope",
    "Box Step-Ups",
    "Cycling",
    "Stair Climbing",
  ],
  "time1": "30",
  "time2": "60",
  "time3": "90",
  "time4": "20",
  "time5": "40",
  "wk_desc1":
      "A gentle introduction to cardiovascular fitness, this workout features low-impact exercises to boost your heart health and stamina without overwhelming your body.",
  "wk_desc2":
      "This moderate-intensity cardio routine combines a variety of exercises to elevate your heart rate, improve endurance, and help you burn calories effectively.",
  "wk_desc3":
      "Designed for experienced athletes, this high-intensity cardio session pushes your limits with challenging drills to maximize endurance, speed, and overall fitness.",
  "wk_desc4":
      "High-intensity interval training to elevate heart rate and burn calories in a short time.",
  "wk_desc5": "Steady-paced cardio exercises to build stamina and endurance.",
};

final Map<String, dynamic> breathingData = {
  "title": "Breathing",
  "example_img":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fistockphoto-1218120799-2048x2048.jpg?alt=media&token=cccf34a1-cf9d-48f9-8ae9-df44b8166432",
  "imageURL":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fbreathing.png?alt=media&token=5f02ec9d-5150-4d5f-bb00-ff54bdf280c2",
  "image_easy":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fbreath1.jpg?alt=media&token=e369ad70-657d-4e31-a3fa-cba54572f88c",
  "image_med":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fbreath2.jpg?alt=media&token=7dfdd42b-61e5-42eb-97df-26ab4d3132a5",
  "image_hard":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fbreath3.jpg?alt=media&token=6fdefdc5-1ded-4405-9794-f6448906c7ac",
  "image_4":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fbreath5.jpg?alt=media&token=f8fab9f2-268c-4d31-9928-392dad09598b",
  "image_5":
      "https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/images%2Fbreath4.jpg?alt=media&token=fde0e303-3f3f-42d7-81ff-d7e7611ddfa8",
  "wk_plan1": "Find Peace",
  "wk_plan2": "Chill Out",
  "wk_plan3": "Daily Meditation",
  "wk_plan4": "Deep Relaxation Breathing",
  "wk_plan5": "Energizing Breathwork",
  "wk_ex1": ["Box Breathing", "Deep Breathing"],
  "wk_ex2": ["4-7-8 Breathing", "Pursed Lip Breathing", "Box Breathing"],
  "wk_ex3": [
    "Box Breathing",
    "4-7-8 Breathing",
    "Diaphragmatic Breathing",
    "Deep Breathing",
    "Alternate Nostril Breathing"
  ],
  "wk_ex4": [
    "Diaphragmatic Breathing",
    "Box Breathing",
    "Alternate Nostril Breathing",
    "Humming Bee Breath",
  ],
  "wk_ex5": [
    "Kapalabhati",
    "Breath of Fire",
    "Lion’s Breath",
    "4-7-8 Breathing",
  ],
  "time1": "15",
  "time2": "20",
  "time3": "35",
  "time4": "15",
  "time5": "10",
  "wk_desc1":
      "This beginner-friendly session focuses on deep, calming breaths to enhance relaxation and mindfulness, making it perfect for stress relief and improved lung capacity.",
  "wk_desc2":
      "This intermediate breathing routine combines various techniques to promote better oxygen flow, enhance relaxation, and support mental clarity and focus.",
  "wk_desc3":
      "Tailored for advanced practitioners, this challenging breathing session incorporates complex techniques to deepen your breath, increase lung capacity, and elevate your overall performance.",
  "wk_desc4":
      "A gentle breathing sequence designed to calm the mind and relax the body.",
  "wk_desc5": "Boost energy and focus with invigorating breath exercises.",
};

final List<Map<String, dynamic>> exerciseData = [
  {
    'description':
        'Stand with your feet wide apart. Turn your right foot out 90 degrees and your left foot slightly in. Bend your right knee over your ankle.',
    'howto':
        'Extend your arms parallel to the floor and hold for 30 seconds to 1 minute. Repeat on the other side.',
    'title': 'Warrior II',
    'type': 'Yoga',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FWarrior2.gif?alt=media&token=a679b215-15f2-4d31-9d1c-ec6687ecaf33'
  },
  // {
  //   'description':
  //       'Stand with your feet shoulder-width apart, knees slightly bent. Hold a barbell with an overhand grip, hands just wider than shoulder-width apart.',
  //   'howto':
  //       'Bend at the hips and lower your torso to be almost parallel to the floor. Pull the barbell to your abdomen, then lower it back down. Perform 3 sets of 8-12 reps.',
  //   'title': 'Bent Over Rows',
  //   'type': 'Strength'
  // },
  {
    'description':
        'Sit with your knees bent and feet flat on the floor. Lean back slightly and lift your feet off the ground, balancing on your sit bones.',
    'howto':
        'Extend your arms forward and straighten your legs to form a V shape with your body. Hold for 30 seconds to 1 minute, engaging your core.',
    'title': 'Boat Pose',
    'type': 'Yoga',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FBoatPose.gif?alt=media&token=36bcb6e9-6c60-4fa5-9fd6-a9276f7c43f9'
  },
  {
    'description':
        'Use a stationary bike. Adjust the seat height so your knees are slightly bent at the bottom of the pedal stroke.',
    'howto':
        'Warm-up for 5 minutes at a low resistance, then cycle for 20-30 minutes at a moderate to high intensity. Cool down for 5 minutes.',
    'title': 'Cycling',
    'type': 'Cardio',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2Fcycling.gif?alt=media&token=ef0272e6-bc11-4cc0-b376-fb8af9d71601'
  },
  {
    'description':
        'Lie on a bench with a dumbbell in each hand, arms extended above your chest with a slight bend in your elbows.',
    'howto':
        'Lower the dumbbells out to your sides in a wide arc until you feel a stretch in your chest, then bring them back to the starting position. Perform 3 sets of 10-15 reps.',
    'title': 'Chest Flyes',
    'type': 'Strength',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FChestFlyes.gif?alt=media&token=b3456358-119f-4f94-ac80-4f63a9a316b6'
  },
  // {
  //   'description':
  //       'Stand with your feet shoulder-width apart, holding a dumbbell in each hand with your arms fully extended and palms facing forward.',
  //   'howto':
  //       'Curl the dumbbells up to your shoulders, then lower them back down. Perform 3 sets of 10-15 reps',
  //   'title': 'Bicep Curls',
  //   'type': 'Strength'
  // },
  {
    'description':
        'Stand with your feet together. Shift your weight onto your left foot and place the sole of your right foot on your inner left thigh or calf (avoid the knee). Bring your hands together at your chest or extend them overhead.',
    'howto':
        'Hold for 30 seconds to 1 minute, focusing on your balance and breathing. Repeat on the other side.',
    'title': 'Tree Pose',
    'type': 'Yoga',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FTreePose.gif?alt=media&token=c7b97101-a2f0-4b43-b763-0283bf81149c'
  },
  {
    'description':
        'Kneel on the floor with your knees hip-width apart. Place your hands on your lower back with fingers pointing down.',
    'howto':
        'Press your hips forward and lean back, reaching for your heels with your hands. Hold for 30 seconds to 1 minute, keeping your chest lifted and breathing deeply.',
    'title': 'Camel Pose',
    'type': 'Yoga',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FCamelPose.gif?alt=media&token=3379c0b6-caa9-487e-87c4-93dc0df6c327'
  },
  {
    'description':
        'Stand with your feet together. Step forward with your right foot into a lunge position.',
    'howto':
        'As you lunge, twist your torso to the right. Return to the starting position and repeat on the other side. Perform for 1-2 minutes.',
    'title': 'Lunges',
    'type': 'Warmup',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FLunges.gif?alt=media&token=d93412fc-eaa9-4598-9cfe-55dc18b5a4f0'
  },
  {
    'description':
        'Sit on a bench with a back support. Hold a dumbbell in each hand at shoulder height with your palms facing forward.',
    'howto':
        'Press the dumbbells overhead until your arms are fully extended, then lower them back to shoulder height. Perform 3 sets of 8-12 reps.',
    'title': 'Dumbbell Shoulder Press',
    'type': 'Strength',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FDumbbellShoulderPress.gif?alt=media&token=1902f005-c3ba-4495-a04e-15a983717d67'
  },
  {
    'description':
        'Sit at a lat pulldown machine and grasp the bar with a wide overhand grip. Sit with your thighs under the support pads.',
    'howto':
        'Pull the bar down to your chest, then slowly return to the starting position. Perform 3 sets of 8-12 reps.',
    'title': 'Lat Pulldown',
    'type': 'Strength',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FLatPulldown.gif?alt=media&token=0e62211c-8231-42e0-b5d1-04d4ab8c4192'
  },
  {
    'description':
        'Sit with your legs extended straight in front of you. Flex your feet and sit up tall.',
    'howto':
        'Inhale and lengthen your spine. Exhale and hinge at your hips to reach for your feet, shins, or ankles. Hold for 1-3 minutes, breathing deeply.',
    'title': 'Seated Forward Bend',
    'type': 'Yoga',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FSeatedForwardBend.gif?alt=media&token=802bb2e1-0900-4354-ae02-4026ca55db41'
  },
  {
    'description':
        'Use an elliptical machine. Place your feet on the pedals and hold the handles.',
    'howto':
        'Move your legs in a gliding motion and push/pull the handles for 20-30 minutes at a moderate to high intensity.',
    'title': 'Elliptical Training',
    'type': 'Cardio',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FEllipticalTraining.gif?alt=media&token=6e67e918-9a8e-4ef0-a9ed-aae39cdb10bf'
  },
  {
    'description':
        'Stand with your feet wide apart. Turn your right foot out 90 degrees and your left foot slightly in. Extend your arms parallel to the floor.',
    'howto':
        'Reach your right hand down to your shin, ankle, or the floor while extending your left arm toward the ceiling. Hold for 30 seconds to 1 minute. Repeat on the other side.',
    'title': 'Triangle Pose',
    'type': 'Yoga',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FTrianglePose.gif?alt=media&token=9027cd14-7f71-47e5-9cb7-8e567669c2c5'
  },
  {
    'description':
        'Start on all fours. Lift your hips up and back, straightening your legs and arms to form an inverted V shape.',
    'howto':
        'Hold for 1-3 minutes, focusing on deep breathing and engaging your core.',
    'title': 'Downward Dog',
    'type': 'Yoga',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FDownwardDog.gif?alt=media&token=6962a896-877c-4687-8bd2-ea60d47e9eaa'
  },
  {
    'description':
        'Lie on a bench with your feet flat on the floor. Grip the barbell slightly wider than shoulder-width apart.',
    'howto':
        'Lower the bar to your chest, then press it back up to the starting position. Perform 3 sets of 8-12 reps',
    'title': 'Bench Press',
    'type': 'Strength',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FBenchPress.gif?alt=media&token=343df0f5-10b1-46ee-b21e-a37c69dbeb99'
  },
  {
    'description':
        'Stand with your feet shoulder-width apart. Throw punches in the air as if you were hitting a target.',
    'howto':
        'Perform for 1-3 minutes, focusing on speed and technique. Rest and repeat for a total of 10-20 minutes.',
    'title': 'Shadow Boxing',
    'type': 'Cardio',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FShadowBoxing.gif?alt=media&token=109362d4-929c-4b75-a01b-cc042b4c7723'
  },
  {
    'description':
        'Stand with your feet shoulder-width apart and extend your arms to the sides at shoulder height.',
    'howto':
        'Make small circles with your arms, gradually increasing the size. Perform for 1 minute in each direction.',
    'title': 'Arm Circles',
    'type': 'Warmup',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FArmCircles.gif?alt=media&token=9871e661-26c4-429d-8838-b9c04f820cfa'
  },
  {
    'description':
        'Start in a tabletop position. Bring your right knee forward and place it behind your right wrist, with your right ankle near your left wrist. Extend your left leg back.',
    'howto':
        'Lower your hips toward the floor and extend your arms forward. Hold for 1-3 minutes, then switch sides.',
    'title': 'Pigeon Pose',
    'type': 'Yoga',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FPigeonPose.gif?alt=media&token=4d96a343-1021-427d-8d25-0ef446c305e4'
  },
  {
    'description':
        'Stand in front of a sturdy box or platform. Jump onto the box with both feet, landing softly.',
    'howto':
        'Step down and repeat for 1-3 minutes, rest, and repeat for a total of 10-20 minutes.',
    'title': 'Box Jumps',
    'type': 'Cardio',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FBoxJumps.gif?alt=media&token=377d9679-0c61-44d4-9773-156b1f6730f9'
  },
  {
    'description':
        'Sit on a leg press machine with your feet shoulder-width apart on the platform. Adjust the seat so your knees are at a 90-degree angle.',
    'howto':
        'Push the platform away from you by extending your legs, then slowly return to the starting position. Perform 3 sets of 10-15 reps.',
    'title': 'Leg Press',
    'type': 'Strength',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FLegPress.gif?alt=media&token=92acefc7-05ba-4422-b088-6411398480ec'
  },
  {
    'description':
        'Lie face down on a leg curl machine with the pad resting just above your heels.',
    'howto':
        'Curl your legs up as far as possible, then slowly lower them back down. Perform 3 sets of 10-15 reps.',
    'title': 'Leg Curl',
    'type': 'Strength',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FLegCurl.gif?alt=media&token=042739a9-e21e-4b2a-bc7b-4ded0d89663b'
  },
  {
    'description':
        'Sit comfortably with your spine straight. Use your right thumb to close your right nostril.',
    'howto':
        'Inhale through your left nostril, then close it with your right ring finger. Exhale through your right nostril. Inhale through your right nostril, close it, and exhale through your left nostril. Continue for 5-10 minutes.',
    'title': 'Alternate Nostril Breathing',
    'type': 'Breathing',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FAlternateNostrilBreathing.gif?alt=media&token=102175cb-643b-48a8-bdb1-ecd298267441'
  },
  {
    'description':
        'Lie on your back with your knees bent and feet hip-width apart. Place your arms at your sides with palms facing down.',
    'howto':
        'Press into your feet and lift your hips toward the ceiling. Hold for 30 seconds to 1 minute, then slowly lower your hips back to the floor.',
    'title': 'Bridge Pose',
    'type': 'Yoga',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FBridgePose.gif?alt=media&token=1ba5e6a0-8059-4854-be67-444cd414882d'
  },
  {
    'description':
        'Stand with your feet together and arms at your sides. Jump up, spreading your legs shoulder-width apart and raising your arms overhead.',
    'howto': 'Return to the starting position and repeat for 1-3 minutes.',
    'title': 'Jumping Jacks',
    'type': 'Warmup',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FJumpingJacks.gif?alt=media&token=7752aad4-89c3-4289-934d-ae71e5e8124c'
  },
  {
    'description':
        'Stand with your feet hip-width apart. Quickly lift one knee to your chest, then switch to the other knee.',
    'howto':
        'Continue alternating knees as quickly as possible for 1-3 minutes. Rest and repeat for a total of 10-20 minutes.',
    'title': 'High Knees',
    'type': 'Cardio',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FHighKnees.gif?alt=media&token=2be96450-0958-4164-8080-646507ed5a45'
  },
  {
    'description':
        'Start in a squat with your hands on the floor, shoulder-width apart. Lift your hips and bring your knees to the backs of your upper arms.',
    'howto':
        'Lean forward, shifting your weight onto your hands, and lift your feet off the ground. Hold for 10-30 seconds, focusing on your balance and breathing.',
    'title': 'Crow Pose',
    'type': 'Yoga',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FCrowPose.gif?alt=media&token=d2583417-afdf-4c37-b656-fafe92bb0e62'
  },
  {
    'description':
        'Start in a push-up position but rest on your forearms instead of your hands.',
    'howto':
        'Keep your body in a straight line from head to heels and hold the position for 30-60 seconds. Perform 3 sets.',
    'title': 'Plank',
    'type': 'Strength',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FPlank.gif?alt=media&token=031a195d-c914-433d-99ad-e431f9305fc2'
  },
  {
    'description':
        'Kneel on the floor, sit back on your heels, and stretch your arms forward on the ground.',
    'howto': 'Hold for 1-3 minutes, breathing deeply and relaxing your body.',
    'title': 'Child’s Pose',
    'type': 'Yoga',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FChildsPose.gif?alt=media&token=764775ae-57c2-4ead-9611-ce1906879612'
  },
  {
    'description':
        'Stand with your feet shoulder-width apart. Extend your right arm straight out in front of you.',
    'howto':
        'Kick your left leg up to try to touch your right hand. Lower your leg and repeat with the other leg. Continue alternating legs for 1-2 minutes.',
    'title': 'High Kicks',
    'type': 'Warmup',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FHighKicks.gif?alt=media&token=4f1e6d45-92fb-4ea0-8a25-9852862b6248'
  },
  {
    'description':
        'Start by walking on the treadmill to warm up. Gradually increase the speed to a comfortable running pace. Maintain an upright posture, keep your head up, and swing your arms naturally.',
    'howto':
        'Warm-up for 5 minutes, then run for 20-30 minutes at a steady pace. Cool down with a 5-minute walk.',
    'title': 'Treadmill Running',
    'type': 'Cardio',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FTreadmillRunning.gif?alt=media&token=5d71723c-35aa-4367-bd78-2c209b51f8c1'
  },
  {
    'description':
        'Stand next to a wall or support for balance. Swing one leg forward and backward.',
    'howto':
        'Perform 10-15 swings on each leg, focusing on increasing the range of motion.',
    'title': 'Leg Swings',
    'type': 'Warmup',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FLegSwing.gif?alt=media&token=c35d10c7-d0b5-4431-be78-4c956f81868c'
  },
  {
    'description':
        'Sit or lie down in a comfortable position. Place one hand on your chest and the other on your abdomen.',
    'howto':
        'Inhale deeply through your nose, allowing your abdomen to rise. Exhale slowly through your mouth. Repeat for 5-10 minutes.',
    'title': 'Diaphragmatic Breathing',
    'type': 'Breathing',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FAlternateNostrilBreathing.gif?alt=media&token=102175cb-643b-48a8-bdb1-ecd298267441'
  },
  {
    'description':
        'Sit or lie down comfortably with your eyes closed. Place one hand on your chest and the other on your abdomen.',
    'howto':
        'Inhale deeply through your nose, filling your lungs and allowing your abdomen to rise. Exhale slowly through your mouth. Continue for 5-10 minutes, focusing on the rise and fall of your abdomen.',
    'title': 'Deep Breathing',
    'type': 'Breathing',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FAlternateNostrilBreathing.gif?alt=media&token=102175cb-643b-48a8-bdb1-ecd298267441'
  },
  {
    'description':
        'Use a jump rope, holding the handles in each hand. Jump over the rope as it swings under your feet.',
    'howto':
        ' Start with small, quick jumps. Perform for 1-3 minutes, rest, and repeat for a total of 10-20 minutes.',
    'title': 'Jump Rope',
    'type': 'Cardio',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FJumpRope.gif?alt=media&token=bcbd94f1-daf1-481d-8231-385ec6aa7fe5'
  },
  {
    'description':
        'Sit or lie down comfortably. Relax your neck and shoulder muscles.',
    'howto':
        'Inhale slowly through your nose for 2 counts. Purse your lips as if you were going to whistle, and exhale slowly and gently through your pursed lips for 4 counts. Repeat for 5-10 minutes.',
    'title': 'Pursed Lip Breathing',
    'type': 'Breathing',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FAlternateNostrilBreathing.gif?alt=media&token=102175cb-643b-48a8-bdb1-ecd298267441'
  },
  {
    'description': 'Sit or lie down comfortably. Close your eyes and relax.',
    'howto':
        'Inhale through your nose for 4 seconds, hold your breath for 7 seconds, and exhale through your mouth for 8 seconds. Repeat for 4-8 cycles.',
    'title': '4-7-8 Breathing',
    'type': 'Breathing',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FAlternateNostrilBreathing.gif?alt=media&token=102175cb-643b-48a8-bdb1-ecd298267441'
  },
  {
    'description': 'Stand with your feet hip-width apart, hands on your hips.',
    'howto':
        'Make large circles with your hips, rotating clockwise for 30 seconds to 1 minute, then counterclockwise for another 30 seconds to 1 minute.',
    'title': 'Hip Circles',
    'type': 'Warmup',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FHipCircles.gif?alt=media&token=973a1b13-1d6e-4702-864b-8349ead2ed10'
  },
  {
    'description':
        'Stand with your feet hip-width apart, grip the barbell with your hands just outside your knees.',
    'howto':
        'Lift the bar by extending your hips and knees, keeping your back straight. Lower the bar back to the floor. Perform 3 sets of 6-10 reps.',
    'title': 'Deadlifts',
    'type': 'Strength',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FDeadlift.gif?alt=media&token=bc4e3ba4-43bc-45f2-9875-a8ea7368d037'
  },
  {
    'description':
        'Stand with your feet shoulder-width apart. Extend your arms out to the sides at shoulder height.',
    'howto':
        'Swing your arms forward and across your chest, then swing them back out to the sides. Continue swinging your arms in a controlled manner for 1-2 minutes.',
    'title': 'Arm Swings',
    'type': 'Warmup',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FArmSwings.gif?alt=media&token=980fc5c6-2fbb-4491-9a26-83704012f7ae'
  },
  {
    'description':
        'Grab a pull-up bar with an overhand grip, hands slightly wider than shoulder-width apart. Hang with your arms fully extended.',
    'howto':
        'Pull your body up until your chin is above the bar, then lower yourself back down. Perform 3 sets of 5-10 reps.',
    'title': 'Pull-Ups',
    'type': 'Strength',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FPullUps.gif?alt=media&token=6daf5da2-aa11-4970-bc02-a5ce9f382399'
  },
  {
    'description':
        'Stand with your feet shoulder-width apart, toes slightly turned out. Lower your body by bending your knees and hips, keeping your chest up.',
    'howto':
        'Squat down until your thighs are parallel to the floor, then return to standing. Perform 3 sets of 10-15 reps.',
    'title': 'Squats',
    'type': 'Strength',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FSquats.gif?alt=media&token=ee33119a-3ab3-4e20-8685-af92daca4fc3'
  },
  {
    'description':
        'Stand with your feet shoulder-width apart, knees slightly bent. Place your hands on your hips or extend them out to the sides.',
    'howto':
        'Twist your torso to the right, then to the left, keeping your hips facing forward. Continue twisting for 1-2 minutes.',
    'title': 'Torso Twist',
    'type': 'Warmup',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FTorsoTwist.gif?alt=media&token=1027021a-6c45-4b3b-b615-61c5963adbd6'
  },
  {
    'description':
        'Start on all fours with your wrists under your shoulders and knees under your hips.',
    'howto':
        'Inhale and arch your back, lifting your head and tailbone (Cow Pose). Exhale and round your spine, tucking your chin and tailbone (Cat Pose). Repeat for 1-3 minutes.',
    'title': 'Cat-Cow Pose',
    'type': 'Yoga',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FCatCowPose.gif?alt=media&token=c340eb19-1f97-47b8-9d6b-cf5e1d04f854'
  },
  {
    'description':
        'Sit on the edge of a bench with your hands next to your hips. Slide off the bench and support yourself with your hands, legs extended in front of you.',
    'howto':
        'Lower your body by bending your elbows, then press back up to the starting position. Perform 3 sets of 8-12 reps.',
    'title': 'Tricep Dips',
    'type': 'Strength',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FTricepDips.gif?alt=media&token=b054aefa-181c-46cc-ae37-3853c51df1e1'
  },
  {
    'description':
        'Sit on the rowing machine with your feet strapped in. Hold the handle with both hands, lean slightly forward, and extend your arms.',
    'howto':
        'Push with your legs, lean back slightly, and pull the handle towards your chest. Return to the starting position in reverse order. Row for 20-30 minutes.',
    'title': 'Rowing Machine',
    'type': 'Cardio',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FRowingMachine.gif?alt=media&token=fe158bb5-2eaa-48fb-b2b1-f495c4279683'
  },
  {
    'description':
        'Use a set of stairs or a stair machine. Step up one stair at a time, alternating legs.',
    'howto':
        'Maintain a steady pace for 10-20 minutes. For added intensity, increase your speed or skip steps.',
    'title': 'Stair Climbing',
    'type': 'Cardio',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FStairsClimbing.gif?alt=media&token=0f0f7069-b3bc-48c2-80e1-db7165cebc43'
  },
  {
    'description':
        'Sit or lie down in a comfortable position. Visualize a box shape.',
    'howto':
        'Inhale through your nose for 4 seconds, hold your breath for 4 seconds, exhale through your mouth for 4 seconds, and hold your breath again for 4 seconds. Repeat for 5-10 minutes.',
    'title': 'Box Breathing',
    'type': 'Breathing',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FAlternateNostrilBreathing.gif?alt=media&token=102175cb-643b-48a8-bdb1-ecd298267441'
  },
  {
    'description':
        'Start in a standing position. Drop into a squat, kick your feet back into a plank position, perform a push-up, return to the squat, and jump up.',
    'howto':
        'Perform continuously for 1-3 minutes, rest, and repeat for a total of 10-20 minutes.',
    'title': 'Burpees',
    'type': 'Cardio',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FBurpees.gif?alt=media&token=845c8840-dbe0-49e2-a963-414972e08cc6'
  },
  {
    'description':
        'A dynamic exercise that targets the core, shoulders, and cardio endurance.',
    'howto':
        'Start in a plank position. Alternate bringing your knees toward your chest as quickly as possible while keeping your back flat and core engaged.',
    'title': 'Mountain Climbers',
    'type': 'Cardio',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FMountainClimbers.gif?alt=media&token=aab80459-41d1-406a-9274-a9b1f14dde5a'
  },
  {
    'description':
        'A lateral movement that strengthens the legs, glutes, and improves balance.',
    'howto':
        'Jump sideways from one foot to the other, landing softly while swinging the opposite arm across your body for balance.',
    'title': 'Skaters',
    'type': 'Cardio',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FSkaters.gif?alt=media&token=8c747797-f16f-447f-b51f-a53df74aebf5'
  },
  {
    'description':
        'A steady-paced cardio activity that boosts endurance and burns calories.',
    'howto':
        'Maintain a relaxed, upright posture and jog at a comfortable pace, focusing on even breathing and consistent strides.',
    'title': 'Jogging',
    'type': 'Cardio',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FJogging.gif?alt=media&token=d1427432-4632-4efe-b747-9c7384d0b7a4'
  },
  {
    'description':
        'A lower-body exercise that strengthens the legs and glutes.',
    'howto':
        'Step onto a sturdy box or bench with one foot, drive through your heel to stand, then lower yourself back down with control. Alternate legs.',
    'title': 'Box Step-Ups',
    'type': 'Cardio',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FBoxStepUps.gif?alt=media&token=9a3e1c52-4c55-4572-852f-615e47346ca9'
  },
  {
    'description': 'A calming breathing exercise to reduce stress and anxiety.',
    'howto':
        'Inhale deeply through the nose. Exhale slowly while making a humming sound, keeping lips closed and focusing on the vibration.',
    'title': 'Humming Bee Breath',
    'type': 'Breathing',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FAlternateNostrilBreathing.gif?alt=media&token=102175cb-643b-48a8-bdb1-ecd298267441'
  },
  {
    'description':
        'A breathing technique that energizes the body and clears the mind.',
    'howto':
        'Sit comfortably, exhale sharply through the nose while contracting your abdomen, and let the inhale happen passively. Repeat rhythmically.',
    'title': 'Kapalabhati',
    'type': 'Breathing',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FAlternateNostrilBreathing.gif?alt=media&token=102175cb-643b-48a8-bdb1-ecd298267441'
  },
  {
    'description': 'A rapid breathing exercise that boosts energy and focus.',
    'howto':
        'Sit tall, take short, forceful exhales through the nose, and let the inhales come naturally. Maintain a steady rhythm.',
    'title': 'Breath of Fire',
    'type': 'Breathing',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FAlternateNostrilBreathing.gif?alt=media&token=102175cb-643b-48a8-bdb1-ecd298267441'
  },
  {
    'description':
        'A breathing exercise that relieves tension and promotes relaxation.',
    'howto':
        'Inhale deeply through your nose, then open your mouth wide and exhale forcefully while sticking your tongue out.',
    'title': 'Lion’s Breath',
    'type': 'Breathing',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FAlternateNostrilBreathing.gif?alt=media&token=102175cb-643b-48a8-bdb1-ecd298267441'
  },
  {
    'description':
        'A dynamic movement that strengthens the legs, glutes, and improves stability.',
    'howto':
        'Step forward with one leg, lowering your hips until both knees are bent at 90 degrees. Push through the front heel to step forward with the other leg.',
    'title': 'Walking Lunges',
    'type': 'Warmup',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FLunges.gif?alt=media&token=d93412fc-eaa9-4598-9cfe-55dc18b5a4f0'
  },
  {
    'description': 'A cardio warm-up that targets the hamstrings and glutes.',
    'howto':
        'Jog in place, kicking your heels up towards your glutes with each step. Swing your arms naturally to maintain rhythm.',
    'title': 'Butt Kicks',
    'type': 'Warmup',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FButtKicks.gif?alt=media&token=8c1162d9-23b3-4771-8732-accc8a6acc4e'
  },
  {
    'description':
        'A dynamic stretch that improves hamstring flexibility and warms up the body.',
    'howto':
        'Stand tall, kick one leg straight in front of you while reaching the opposite hand towards your toes. Alternate legs with each step.',
    'title': 'Toy Soldiers',
    'type': 'Warmup',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FToySoldiers.gif?alt=media&token=3dc4bcf9-aff9-4d65-a53f-16a445d24e44'
  },
  {
    'description':
        'A full-body warm-up that stretches the hamstrings and strengthens the core.',
    'howto':
        'From standing, bend forward to touch the ground, walk your hands out to a plank, then walk them back towards your feet and stand up.',
    'title': 'Inchworm',
    'type': 'Warmup',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FInchworm.gif?alt=media&token=7950f0a0-60af-4479-abdf-7a924900beda'
  },
  // {
  //   'description':
  //       'A yoga flow that warms up the spine and promotes flexibility.',
  //   'howto':
  //       'Start on all fours, arch your back as you look up (Cow), then round your spine while tucking your chin (Cat). Alternate between the two.',
  //   'title': 'Cat-Cow Stretch',
  //   'type': 'Yoga',
  //   'videourl': ''
  // },
  {
    'description':
        'A relaxation pose that encourages deep rest and mindfulness.',
    'howto':
        'Lie on your back with arms and legs relaxed, palms facing up. Focus on slow, deep breathing and let your body completely relax.',
    'title': 'Corpse Pose',
    'type': 'Yoga',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FCorpsePose.gif?alt=media&token=dca5dd21-82e2-494b-abc1-5e7e3739ca0f'
  },
  // {
  //   'description':
  //       'A sequence of yoga poses that warms up the body and improves flexibility.',
  //   'howto':
  //       'Flow through poses such as Mountain Pose, Forward Fold, Plank, Cobra Pose, and Downward Dog in a smooth sequence, synchronizing with your breath.',
  //   'title': 'Sun Salutation',
  //   'type': 'Yoga',
  // },
  {
    'description':
        'A gentle backbend that stretches the spine and opens the chest.',
    'howto':
        'Lie face down, place hands under shoulders, and lift your chest while keeping your elbows slightly bent and shoulders relaxed.',
    'title': 'Cobra Pose',
    'type': 'Yoga',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FCobraPose.gif?alt=media&token=7d94b244-c88d-496e-a032-b5608a954e7a'
  },
  {
    'description':
        'A foundational yoga pose that promotes alignment and grounding.',
    'howto':
        'Stand tall with feet together, arms by your sides, and shoulders relaxed. Distribute your weight evenly across your feet.',
    'title': 'Mountain Pose',
    'type': 'Yoga',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FMountainPose.gif?alt=media&token=fe14f139-edac-48d0-acc5-a291911255cd'
  },
  {
    'description': 'An isolation exercise targeting the biceps.',
    'howto':
        'Hold dumbbells at your sides, palms facing forward. Curl the weights up towards your shoulders, then lower them slowly.',
    'title': 'Biceps Curls',
    'type': 'Strength',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FBicepsCurls.gif?alt=media&token=24b22068-4a63-4fbc-b673-c64098b64fff'
  },
  {
    'description': 'A compound exercise for the back and arms.',
    'howto':
        'Bend forward at the hips, hold weights with arms extended. Pull the weights towards your torso, squeezing your shoulder blades, then lower them back down.',
    'title': 'Bent-Over Row',
    'type': 'Strength',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FBendOverRows.gif?alt=media&token=868e4792-7278-4df2-82c7-e2e032524986'
  },
  {
    'description':
        'A bodyweight exercise that targets the chest, shoulders, and triceps.',
    'howto':
        'Start in a plank position, lower your body until your chest almost touches the floor, then push back up.',
    'title': 'Push-Ups',
    'type': 'Strength',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FPushUps.gif?alt=media&token=de02bc6d-8f6c-492d-a40c-9c5e2170c8f7'
  },
  {
    'description': 'An isolation exercise that strengthens the triceps.',
    'howto':
        'Hold a dumbbell with both hands, extend your arms overhead. Lower the weight behind your head by bending your elbows, then straighten them back up.',
    'title': 'Tricep Extensions',
    'type': 'Strength',
    'videourl':
        'https://firebasestorage.googleapis.com/v0/b/gymappflutter-c95ce.appspot.com/o/gifs%2FTricepExtensions.gif?alt=media&token=0ce8196a-cfb2-4b97-8d76-7b782d6a4eb2'
  },
];
