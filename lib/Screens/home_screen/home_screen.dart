import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/Reusable%20Widgets/card_widget.dart';
import 'package:mental_health_app/Screens/psychological_tests_screen/depression_test.dart';

import 'package:reviews_slider/reviews_slider.dart';

import '../../Constants/project_colors.dart';
import '../../Reusable Widgets/big_card_widget.dart';
import '../calories_tracker/calories_tracker_screen.dart';
import '../pedometer/pedometer.dart';
import '../workouts_and_yoga_screen/workouts_and_yoga_tabbar_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  static int? currentMood;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: mainWhite,
       // appBar: AppBarWidget(title: 'Good morning, ${thisAppUser.firstName} ^^',),

      body: SingleChildScrollView(
        child: Container(
          color: mainWhite,
          child: Center(
              child: Column(children: [
                const SizedBox(height: 8),
                Image.asset('assets/images/home_image.jpg'),

                const SizedBox(height: 8),

                const Text(
                  'How are you feeling today?',
                  style: TextStyle(color: mainPurple, fontSize: 24),
                ),

                const SizedBox(height: 16),

                ReviewSlider(onChange: (int value) {
                  if (kDebugMode) {
                    currentMood = value;
                    print('Current Mood: $value');
                  }
                }),
                //MoodRatingBar(),
                const SizedBox(height: 12),

                Wrap(
                  spacing: 12.0, // gap between adjacent chips
                  runSpacing: 12.0, // gap between lines
                  children: [
                    CardWidget(
                        text: "Pedometer",
                        image: 'assets/images/pedometer4.png',
                        onClicked: () {
                          Navigator.push(
                            context,
                            // MaterialPageRoute(builder: (context) => PsychologicalTestsScreen()),);
                            MaterialPageRoute(
                                builder: (context) =>  const PedometerScreen()),
                          );

                        }),

                    CardWidget(
                        text: "Workout",
                        image: 'assets/images/workout2.png',
                        onClicked: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  const WorkoutAndYogaScreen()),
                          );

                        }),

                    CardWidget(
                        text: "Sleep tracking",
                        image: 'assets/images/sleep.png',
                        onClicked: () {}),

                    CardWidget(
                        text: "Wearables",
                        image: 'assets/images/watch.png',
                        onClicked: () {}),


                    BigCardWidget(
                        text: "\nAbout to eat?\n\n"
                            "Picture to calc calories\n",
                        image: 'assets/images/food.jpg',
                        onClicked: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CaloriesTrackerScreen()),
                          );
                        }),


                    BigCardWidget(
                        text: "\nPsychometer\n\n"
                            "Depression, Anxiety\nand stress scale\n",
                        image: 'assets/images/test6.png',
                        onClicked: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DepressionTest()),
                          );
                        }),
                  ],
                ),
                const SizedBox(
                  height: 30,
                )
              ]),
            ),
        ),
      ),
    );
  }
}


