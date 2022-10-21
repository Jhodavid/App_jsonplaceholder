import 'package:flutter/material.dart';

class TechnicalAppBar extends StatelessWidget {

  final String title;
  final String subTitle;

  const TechnicalAppBar({
    Key? key, required this.title, required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            margin: EdgeInsets.only( left: width/18, top: height/50 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: width*0.07,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: height/50,
                    color: const Color.fromARGB(255, 0, 68, 255),
                  ),
                )
              ],
            ),
          ),
          const Image(
            height: 70,
            image: AssetImage('assets/hello.gif'),
          ),
        ]),
      ),
    );
  }
}
