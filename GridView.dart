import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GridListView extends StatefulWidget {
  const GridListView({Key? key}) : super(key: key);

  @override
  State<GridListView> createState() => _GridListViewState();
}

class _GridListViewState extends State<GridListView> {

  List image = ['img1.jpg', 'img2.jpg', 'img3.jpg', 'img4.jpg', 'img6.jpg', 'img6.jpg', 'img7.jpg',
    'img11.jpg', 'img1.jpg', 'img3.jpg', 'img11.jpg'];

  List imageText = ['Happy New Year', 'Start Celebration', 'Great Time', 'Stay Safe & Cheer', 'We Are One Step Away',
    'Enjoy Have Fun, Lots of Love', 'We Love You All', 'Thank You For Watching', 'Please Subscribe',
    'Enjoy Your Day With Your Family & Friends', 'Eat Sleep Code Workout Repeat'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View'),
      ),
      body: AnimationLimiter(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  (MediaQuery.of(context).orientation == Orientation.portrait)
                      ? 2
                      : 4,
              childAspectRatio: 0.75
              // childAspectRatio: (itemWidth / itemHeight),
              ),
          shrinkWrap: true,
          itemCount: image.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredGrid(
              duration: const Duration(milliseconds: 1000),
              position: index,
              columnCount: 2,
              child: FlipAnimation(
                child: Card(
                    color: Colors.white,
                    // buildColor(
                    //     '',
                    //     formController.formModel!.setting!.bghex),
                    elevation: 0.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(
                        color: Colors.blueGrey,
                        width: 0.5,
                      ),
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12.0),
                              topLeft: Radius.circular(12.0)),
                          // ignore: prefer_interpolation_to_compose_strings
                          child: Image.asset(
                              'assets/'+image[index],
                              height: 170,
                              // width: 120,
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            imageText[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              overflow: TextOverflow.ellipsis
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
