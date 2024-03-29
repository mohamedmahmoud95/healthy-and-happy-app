import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';
import 'package:mental_health_app/Reusable%20Widgets/share_post_widget.dart';
import 'package:mental_health_app/Reusable%20Widgets/write_comment_widget.dart';
import '../../../Models/post.dart';

class PostCard extends StatefulWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  Color likeIconColor = Colors.black;
  int numOfTimesLikeButtonTapped = 0;

  String calcPostTime(){
    DateTime? postTime = widget.post.dateTime;
    DateTime now = DateTime.now();
    if(widget.post.dateTime!.year == now.year) {
      if (widget.post.dateTime!.month == now.month) {
        if (widget.post.dateTime!.day == now.day) {
          if (widget.post.dateTime!.hour == now.hour) {
            if (widget.post.dateTime!.minute == now.minute) {
              if (widget.post.dateTime!.second +3 >= (now.second) ) {
                //keep the timing ("just now") for 3 seconds after publishing the post
                return "just now";
              }
              else {
                //  then change to: a few seconds ago,
                return "a few seconds ago";
              }
            }
            else {
              //then minutes
              return "${now.minute - widget.post.dateTime!.minute} min ago";
            }
          }
          else {
            return "${now.hour - widget.post.dateTime!.hour} hr ago";
          }
        }
        else {
          return "${now.minute - widget.post.dateTime!.day} d ago";
        }
      }
      else {
        return "${now.minute - widget.post.dateTime!.month} months ago";
      }
    }
    else
    {
      return "${now.minute - widget.post.dateTime!.year} years ago";
    }
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightLavender,
      margin: const EdgeInsets.all(2),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        "${widget.post.postAuthor?.profilePicUrl != null ? widget.post.postAuthor?.profilePicUrl! : 'assets/images/profile_pic.png'}"),
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.post.postAuthor?.firstName}  ${widget.post.postAuthor?.lastName}',
                        style: const TextStyle(color: navyBlue),
                      ),
                      Text(
                        calcPostTime(),
                        style: const TextStyle(color: navyBlue, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '${widget.post.text}',
                style: const TextStyle(color: navyBlue),
              ),
            ),
            ((widget.post.imageURL!.contains('http'))|| ((widget.post.imageURL!.contains('www')))) && widget.post.imageURL != null && widget.post.imageURL!.isNotEmpty ?
            Center(
              child: Image.network('${widget.post.imageURL}'),
            ) :
            Center(
              child:
              widget.post.imageURL != null && widget.post.imageURL!.isNotEmpty ?
              Image.asset('${widget.post.imageURL}')
                  :
              const SizedBox(height: 10,),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.thumb_up,
                            color: (widget.post.numOfLikes!) > 0
                                ? mainBlue
                                : likeIconColor,

                          ),
                          onPressed: () {
                            setState(() {
                              numOfTimesLikeButtonTapped++;  //so the same user can click an increase the number of like only by 1
                              if (numOfTimesLikeButtonTapped <=1)
                                widget.post.numOfLikes =  (widget.post.numOfLikes!)+1;
                              else if (numOfTimesLikeButtonTapped > 1 && (widget.post.numOfLikes!) > 0) {
                                {
                                  widget.post.numOfLikes =  (widget.post.numOfLikes!)-1;
                                  numOfTimesLikeButtonTapped = 0;
                                }
                              }
                              widget.post.updatePostTrendingState();
                            });

                          }),
                      const SizedBox(width: 4),
                      Text("${widget.post.numOfLikes ?? 0} like",
                          style: const TextStyle(color: navyBlue)),
                    ],
                  ),
                  Row(
                    children: [
                      WriteCommentWidget(numOfComments:widget.post.numOfComments!),
                      const SizedBox(width: 4),
                      Text("${widget.post.numOfComments ?? 0} comment",
                          style: const TextStyle(color: navyBlue)),
                    ],
                  ),
                  Row(
                    children: [
                      SharePostWidget(numOfShares: widget.post.numOfShares!),

                      const SizedBox(width: 4),
                      Text("${widget.post.numOfShares ?? 0} share",
                          style: const TextStyle(color: navyBlue)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}