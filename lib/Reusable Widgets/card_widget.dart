
import 'package:flutter/material.dart';

import '../Constants/project_colors.dart';

class CardWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final String image;
  int? optionalNumber;

   CardWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    required this.image,
    this.optionalNumber,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) => Card(
    color: lightOrange,

    clipBehavior: Clip.hardEdge,

shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
  ),

    child: InkWell(
      onTap: () {
        onClicked();
        debugPrint('$text card tapped.');
      },

      splashColor:  Colors.white38,

      child:  SizedBox(
        width: 150,
        height: 120,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             mainAxisSize: MainAxisSize.max,
             crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              //circular border
              CircleAvatar(
            backgroundColor: mainOrange,
            radius: 25,

//icon/image
            child: CircleAvatar(
             // backgroundColor: mainWhite,
              radius: 22,
              backgroundImage: AssetImage (image),

              ), //CircleAvatar
            ), //CircleAvatar
           //CircleAvatar
       //Center

              const SizedBox(height: 5,),

               optionalNumber == null?
                   Text(
                    text,
                    style: const TextStyle(fontSize: 15, color: navyBlue, fontWeight: FontWeight.normal),
                  )
                   :
                   Column(
                     children:[
                       Text(
                         "$optionalNumber",
                         style: const TextStyle(fontSize: 15, color: mainBlue, fontWeight: FontWeight.bold),
                       ),

                       const SizedBox(height: 3,),

                       Text(
                         text,
                         style: const TextStyle(fontSize: 15, color: navyBlue, fontWeight: FontWeight.normal),
                       )
            ],
                   )


            ],
          ),
        ),
      ),
    ),

  );
}
