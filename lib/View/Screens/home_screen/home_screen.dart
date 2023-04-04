import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:reviews_slider/reviews_slider.dart';

import '../../../Constants/project_colors.dart';
import '../../Reusable Widgets/big_card_widget.dart';
import '../../Reusable Widgets/card_widget.dart';
import '../psychological_tests_screen/depression_test.dart';
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
      body: Container(
          color: mainWhite,
          child: SingleChildScrollView(
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
                        optionalNumber: 237,
                        text: "Pedometer",
                        image: 'assets/images/pedometer4.png',
                        onClicked: () {}),

                    CardWidget(
                        text: "Workout",
                        image: 'assets/images/workout2.png',
                        onClicked: () {
                          Navigator.push(
                            context,
                            // MaterialPageRoute(builder: (context) => PsychologicalTestsScreen()),);
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
                        text: "\nPsychometer\n\n"
                            " Depression, Anxiety\n and stress scale\n",
                        image: 'assets/images/test6.png',
                        onClicked: () {
                          Navigator.push(
                            context,
                            // MaterialPageRoute(builder: (context) => PsychologicalTestsScreen()),);
                            MaterialPageRoute(
                                builder: (context) => DepressionTest()),
                          );
                        }),
                    //  QuestionCard(question:sampleQuestion1, selectedAnswer: 1,),
                  ],
                ),
                const SizedBox(
                  height: 30,
                )
              ]),
            ),
          )),
    );
  }
}

