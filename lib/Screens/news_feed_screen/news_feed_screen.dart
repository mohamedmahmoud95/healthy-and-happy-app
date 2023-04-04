import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';
import 'package:mental_health_app/Models/post.dart';

import 'Components/category_card.dart';
import 'Components/new_post_widget.dart';
import 'Components/post_card.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  ScrollController _scrollController = ScrollController();
  FloatingActionButtonLocation _floatingActionButtonLocation =
      FloatingActionButtonLocation.endFloat;

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: mainWhite,

        floatingActionButton: const NewPostWidget(),

        floatingActionButtonLocation: _floatingActionButtonLocation,
        body:
        SingleChildScrollView(
                  child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  CategoryCard(text: 'Trending', CategoryCardSelected : true),
                  CategoryCard(text: 'Relationship', CategoryCardSelected: false),
                  CategoryCard(text: 'Self-care', CategoryCardSelected : false),
                ],
              ),
            //  for (Post post in samplePosts) if (post.category == selectedCategory)  PostCard(post: post),
              PostCard(post: samplePost1),
              PostCard(post: samplePost2),
              PostCard(post: samplePost3),
              PostCard(post: samplePost4),

              const SizedBox(
                height: 20,
              ),


              //  Container(child: PostsList()),
            ],
          )),
      ),
    );

  }
}

List<CategoryCard> categoryCards = [
  CategoryCard(text: 'Trending', CategoryCardSelected : true),
  CategoryCard(text: 'Relationship', CategoryCardSelected: false),
  CategoryCard(text: 'Self-care', CategoryCardSelected : false),
];
