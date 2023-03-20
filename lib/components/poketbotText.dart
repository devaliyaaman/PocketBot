import 'package:flutter/material.dart';

class PocketText extends StatelessWidget {
  PocketText({required this.size});
  double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Pocket", style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold, fontSize: size),),

        ShaderMask(
          shaderCallback: (bounds)  => LinearGradient(
              colors: [Color(0xFFFE53BB),
                Color(0xFF09FBD3)]
          ).createShader(bounds),
          child: Text("Bot", style: TextStyle(fontSize: size,
              fontWeight: FontWeight.bold),),
        )
      ],
    );
  }
}
