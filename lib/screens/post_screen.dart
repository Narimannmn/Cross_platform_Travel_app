import 'package:flutter/material.dart';
import 'package:mid/widgets/post_bottom_bar.dart';
import '../models/Tour.dart';
import '../widgets/post_app_bar.dart';
class PostScreen extends StatelessWidget {
   final Tour tour;
  const PostScreen({Key? key, required this.tour}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(tour.img),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.7),
            BlendMode.dstATop,
          ),
        ), 
      ), 
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: PostAppBar(),
          ),
          bottomNavigationBar:PostBottomBar(tour: tour)
      ),
     
    ); 
  }
}
