
import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';
import 'package:mental_health_app/Screens/sessions_screen_for_therapists/page/widget/detailBody.dart';

class SliverDoctorDetail extends StatelessWidget {
  const SliverDoctorDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: mainWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text('Detail Doctor'),
            backgroundColor: mainPurple,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: NetworkImage('https://img.freepik.com/free-vector/mental-health-concept-illustration_114360-2038.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: DetailBody(),
          )
        ],
      ),
    );
  }
}







