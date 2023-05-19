import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_clipboard/flutter_clipboard.dart';


void main() {
  runApp(MaterialApp(
    home: NewsFeedPage(),
  ));
}

class NewsFeedPage extends StatefulWidget {
  @override
  _NewsFeedPageState createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  List<Post> posts = [
    Post(
      username: 'Sondos ',
      postText: "Self-care is vital for building resilience toward those stressors in life that you can't  eliminate. When you've taken steps to care for your mind and body, you'll be better equipped to live your best life. Unfortunately, however, many people view self-care as a luxury, rather than a priority. Consequently, they're left feeling overwhelmed, tired, and ill-equipped to handle life's inevitable challenges.\n It is important to assess how you're caring for yourself in several different domains so you can ensure you're caring for your mind, body, and spirit",


      likes: 10,
      comments: 5,
      shares: 3,
      imageUrl: 'https://www.verywellmind.com/thmb/1mjLOmUOSRSzjBulD0RdvhVo43A=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/self-care-strategies-overall-stress-reduction-3144729-db78e360d264421bb0ecc44e48aa1ad2.png',
      category: 'Self-care',
      userProfilePhoto: 'https://media.istockphoto.com/id/1272506329/photo/woman-relaxing-in-nature.jpg?s=612x612&w=0&k=20&c=VogOYkDVMCno4ayQZjdTPVdKgMlCDjFN10yL6yYTIHk=',
      dateTime: DateTime.now().subtract(Duration(hours: 2)),
      feeling: 'Happy',
    ),
    Post(
      username: 'Habiba',
      postText: "Eating meals with other people has many psychological, social and biological benefits. They give us a sense of rhythm and regularity in our lives, a chance to reflect on the day and feel connected to others. Biologically, eating in upright chairs helps with our digestion. Talking and listening also slow us down, so we don’t eat too fast. \n Make the most of mealtimes by setting aside at least one day a week to eat with family and friends. Choose a meal that’s easy to prepare, so it doesn’t become a chore. Share responsibility, so everyone has a different task: doing the shopping, setting the table, cooking or washing up, for example. Keep the television off so you can all talk and share.",
      likes: 15,
      comments: 8,
      shares: 2,
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5YdUR1uVrY9QyeJDjl9oGa0Vy46YHKXTkul1ujsARuO7HuEf1x2lOa0k-tDNkrfYoPIQ&usqp=CAU',
      category: 'Nutrition',
      userProfilePhoto: 'https://cdn.shopify.com/s/files/1/0100/6082/files/glacierbg.jpg?v=1613677492',
      dateTime: DateTime.now().subtract(Duration(minutes: 30)),
      feeling: 'Excited',
    ),




    Post(
  username: 'Esraa',
  postText: "Start paying attention to how eating different foods makes you feel — not just in the moment, but the next day. Try eating a clean diet for two to three weeks — that means cutting out all processed foods and sugar. See how you feel. Then slowly introduce foods back into your diet, one by one, and see how you feel.When some people go clean, they cannot believe how much better they feel both physically and emotionally, and how much worse they then feel when they reintroduce the foods that are known to enhance inflammation.",
  likes: 15,
  comments: 8,
  shares: 2,
  imageUrl: 'https://reba.global/static/3839a93d3005b556c18b383c90bf1865/3839-1557478843NutritionandmentalhealthMAIN.jpg',
  category: 'Nutrition',
  userProfilePhoto: null,
  dateTime: DateTime.now().subtract(Duration(minutes: 30)),
  feeling: 'Excited',
  ),

    Post(
      username: 'Mohammed ',
      postText: 'To boost your mental health, focus on eating plenty of fruits and vegetables along with foods rich in omega-3 fatty acids, such as salmon. Dark green leafy vegetables in particular are brain protective. Nuts, seeds and legumes, such as beans and lentils, are also excellent brain foods.',
      likes: 20,
      comments: 10,
      shares: 5,
      imageUrl: 'https://www.sutterhealth.org/images/health-topics/nutrition/plate-of-white-fish-filet-600x300.jpg',
      category: 'Nutrition',
      userProfilePhoto: null,
      dateTime: DateTime.now().subtract(Duration(minutes: 10)),
      feeling: 'motivated',
    ),
  ];

  String selectedFilter = 'All';

  void createPost(String postText, String category, String feeling) {
    setState(() {
      posts.add(
        Post(
          username: 'New User',
          postText: postText,
          likes: 0,
          comments: 0,
          shares: 0,
          imageUrl: null,
          category: category,
          userProfilePhoto: null,
          dateTime: DateTime.now(),
          feeling: feeling,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
        backgroundColor: Color(0xFF5E5FCA),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedFilter = 'Trending';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedFilter == 'Trending'
                          ? Color(0xFF5e5fca)
                          : Color.fromARGB(255,239,239,250),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      'Trending',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255,49,8, 122),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedFilter = 'Nutrition';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedFilter == 'Nutrition'
                          ? Color(0xFF5e5fca)
                          : Color.fromARGB(255,239,239,250),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      'Nutrition',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255,49,8, 122),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedFilter = 'Self-care';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedFilter == 'Self-care'
                          ? Color(0xFF5e5fca)
                          : Color.fromARGB(255,239,239,250),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      'Self-care',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255,49,8, 122),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //SizedBox(height: 6),
          TextButton(
            onPressed: () {
              setState(() {
                selectedFilter = 'All';
              });
            },
            child: Text(
              'View All',
              style: TextStyle(
                color: Color(0xFF5e5fca),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          //SizedBox(height: 6),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                if (selectedFilter == 'All' ||
                    post.category == selectedFilter ||
                    (selectedFilter == 'Trending' && post.likes > 15)) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ListTile(
                        leading: post.userProfilePhoto != null
                            ? CircleAvatar(
                          backgroundImage: NetworkImage(post.userProfilePhoto!),
                        )
                            : CircleAvatar(
                          backgroundColor: Color(0xFF5e5fca),
                          child: Icon(
                            Icons.person,
                            color: Color(0xFFEFEFFA),
                          ),
                        ),
                        title: Wrap(
                          children: [
                            Text(post.username),
                            SizedBox(width: 100),
                            Text(
                              '${DateFormat.yMMMMd().format(post.dateTime)} at ${DateFormat.jm().format(post.dateTime)}',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(post.postText),
                      ),


                      SizedBox(height: 16),
                      if (post.imageUrl != null)
                        Container(
                          width: double.infinity,
                          child: Image.network(
                            post.imageUrl!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.thumb_up),
                            tooltip: 'Like',
                          ),
                          Text('${post.likes}'),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.share),
                            tooltip: 'Share',
                          ),
                          Text('${post.shares}'),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.comment),
                            tooltip: 'Comment',
                          ),
                          Text('${post.comments}'),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Feeling: ${post.feeling}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5e5fca),
                          ),
                        ),

                      ),
                      SizedBox(height: 25),
                      Divider(
                        color: Colors.grey.withOpacity(0.3),
                        height: 20,
                        thickness: 7,
                      ),
                    ],
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String postText = '';
              String category = 'Self-care';
              String feeling = '';

              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFF5e5fca),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Write Post',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    content: SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              onChanged: (value) {
                                postText = value;
                              },
                              decoration: InputDecoration(
                                hintText: "What's on your mind?",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              maxLines: 4,
                            ),
                            SizedBox(height: 20),
                            DropdownButton<String>(
                              value: category,
                              onChanged: (newValue) {
                                setState(() {
                                  category = newValue!;
                                });
                              },
                              items: <String>[
                                'Self-care',
                                'Nutrition',
                              ].map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 49, 8, 122),
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              onChanged: (value) {
                                feeling = value;
                              },
                              decoration: InputDecoration(
                                hintText: 'How do you feel?',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    // Logic for copying image URL
                                    // Show modal bottom sheet
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: 150,
                                          child: Column(
                                            children: [
                                              ListTile(
                                                leading: Icon(Icons.link),
                                                title: Text('Copy Image URL'),
                                                onTap: () {
                                                 // FlutterClipboard.copy(post.imageUrl!).then((value) {
                                                    // Show a snackbar or any other feedback indicating successful copying
                                                  //  ScaffoldMessenger.of(context).showSnackBar(
                                                   //   SnackBar(content: Text('Image URL copied')),
                                                  //  );
                                                //  });
                                                },
                                              ),

                                              ListTile(
                                                leading: Icon(Icons.file_upload),
                                                title: Text('Upload from Device'),
                                                onTap: () {
                                                  // Perform action for uploading from device
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.photo),
                                  label: Text('Add Photo'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF5e5fca),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    // Logic for copying video URL
                                    // Show modal bottom sheet
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: 150,
                                          child: Column(
                                            children: [
                                              ListTile(
                                                leading: Icon(Icons.link),
                                                title: Text('Copy Video URL'),
                                                onTap: () {
                                                  // Perform action for copying video URL
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.file_upload),
                                                title: Text('Upload from Device'),
                                                onTap: () {
                                                  // Perform action for uploading video from device
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.video_call),
                                  label: Text('Add Video'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF5e5fca),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    createPost(postText, category, feeling);
                                    Navigator.pop(context);
                                  },
                                  child: Text('Publish'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF5e5fca),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        backgroundColor: Color(0xFF5e5fca),
        foregroundColor: Color.fromARGB(255, 239, 239, 250),
        child: Icon(Icons.edit),
      ),



    );
  }
}

class Post {
  final String username;
  final String postText;
  final int likes;
  final int comments;
  final int shares;
  final String? imageUrl;
  final String category;
  final String? userProfilePhoto;
  final DateTime dateTime;
  final String feeling;

  Post({
    required this.username,
    required this.postText,
    required this.likes,
    required this.comments,
    required this.shares,
    this.imageUrl,
    required this.category,
    this.userProfilePhoto,
    required this.dateTime,
    required this.feeling,
  });
}
