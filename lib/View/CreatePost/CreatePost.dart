import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/PicPost_Widget.dart';
import 'CreatePost_CustomButton.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(CupertinoIcons.left_chevron)),
                  Text(
                    'Create Post',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                    width: 40,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    width: 50.0, // Width of the circular image container
                    height: 50.0, // Height of the circular image container
                    child: ClipOval(
                      child: Image.asset(
                        'assets/profilepic.png', // Replace with your image URL
                        width: 150.0, // Width of the circular image
                        height: 150.0, // Height of the circular image
                        fit: BoxFit
                            .cover, // Adjust this to control how the image fits inside the circular shape
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Minha Anjum',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                      CreatePost_CustomButtom('assets/tag.svg', 'Tag People')
                    ],
                  ),
                  Expanded(
                      child: Align(
                    alignment: Alignment.centerRight,
                    child: CreatePost_CustomButtom(
                        'assets/addmore.svg', 'Add more'),
                  ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '"Lost in the beauty of natures embrace. 🌿🌄"',
                        style: TextStyle(fontSize: 13.0),
                      ),
                      Text(
                        '#Wanderlust #NatureLover',
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ],
                  ),
                  Expanded(
                      child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/emoji.svg',
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 360,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CreatePostPicWidget('assets/profilepic.png',150,false),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 3,
                          child: CreatePostPicWidget('assets/profilepic.png',150,false),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: CreatePostPicWidget('assets/profilepic.png',180,false),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child:  Container(
                            // width: 100,
                            height: 180, // Adjust the height as needed
                            // margin: EdgeInsets.all(8), // Adjust the margin and spacing as needed
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    'assets/profilepic.png',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                  Positioned.fill(
                                    child: Container(
                                      color: Colors.white70, // Adjust the opacity as needed
                                    ),
                                  ),
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text('+3 more photos',style: TextStyle(fontSize: 14,color: Colors.black),),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(text: 'Upload', onPressed: () {
                    // Navigator.push(
                    // context,
                    // MaterialPageRoute(
                    //   builder: (context) => CreatePost(),
                    // ),);
                    },),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: CustomButton(text: 'Draft', onPressed: () {
                  // Navigator.push(
                  // context,
                  // MaterialPageRoute(
                  //   builder: (context) => CreatePost(),
                  // ),);
                },),
              ),
              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}
