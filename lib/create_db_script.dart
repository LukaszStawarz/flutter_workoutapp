import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gymapp/models/plans.dart';
import 'package:gymapp/models/subplan.dart';

void setup() {
  final x = convertToNewPlanFormat(originalData);
  final x1 = convertToNewPlanFormat(breathingData);
  final x2 = convertToNewPlanFormat(cardioData);
  final x3 = convertToNewPlanFormat(strengthData);
  final x4 = convertToNewPlanFormat(warmUpData);

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
    "Sun Salutation",
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
    "Lunge with a Twist"
  ],
  "wk_ex3": [
    "Arm Circles",
    "Arm Swings",
    "Torso Twist",
    "Lunge with a Twist",
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
