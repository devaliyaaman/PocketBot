import 'package:flutter/material.dart';
import 'gradient.dart';

import '../main.dart';


class MyShaderMask extends StatelessWidget {
 MyShaderMask({required this.icon});
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(

        shaderCallback: (bounds) => LinearGradient(
            colors: [Color(0xFFFE53BB),
              Color(0xFF09FBD3)]
        ).createShader(bounds),
        child: icon
    );
  }
}

class MyShaderMaskforNavigation extends StatelessWidget {
  MyShaderMaskforNavigation({required this.icon, required this.onpress });
  Function() onpress;
  Icon icon;
  

  @override
  Widget build(BuildContext context) {
    return ShaderMask(

        shaderCallback: (bounds) => LinearGradient(
            colors: [Color(0xFFFE53BB),
              Color(0xFF09FBD3)]
        ).createShader(bounds),
        child: icon
    );
  }
}

class OneContainer extends StatelessWidget {

  OneContainer({required this.onpress, required this.icon, required this.titleText,
   required this.discription});

 Function() onpress;
 Icon icon;
 String titleText;
 String discription;


  @override
  Widget build(BuildContext context) {
    return  UnicornOutlineButton(
      strokeWidth: 2,
      radius: 24,
      gradient: LinearGradient(colors: [Color(0xFFFE53BB),
        Color(0xFF09FBD3)]),
      child: Row(
        children: [

          MyShaderMask(icon: icon),

          SizedBox(width: 20,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(titleText
                  , style: TextStyle(color:
                  Colors.white, fontSize: 30),),
                SizedBox(height: 5,),
                Text(discription
                  , style: TextStyle(color:
                  Colors.white,
                      fontSize: 15),),
                SizedBox(height: 5,),
              ],
            ),
          )

        ],
      ),
      onPressed: onpress,
    );
  }
}

