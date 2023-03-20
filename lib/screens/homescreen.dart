import 'package:dicee/screens/texttoimagescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dicee/components/shaderMask.dart';
import 'package:provider/provider.dart';
import 'chatsgptscreen.dart';
import 'package:dicee/components/poketbotText.dart';





class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF19191B) ,
            title: Center(
              child: PocketText(size: 35.0),
            ),
          ),
          backgroundColor: Color(0xFF19191B),
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  OneContainer(onpress: (){
                // go to chatGpt
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  ChatScreen()));
                  },
                    icon: Icon(Icons.message,size: 55,),
                  titleText: "Chat with PocketBot",
                    discription: "Ask anything to get precise answer",
                  ),


                  SizedBox(height: 15,),
                  OneContainer(onpress: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>ImageGenratorScreen()));

                  }, icon: Icon(Icons.image, size: 55,),
                    titleText: "Genrate Images",
                    discription: "generate images by just giving text",),
                  SizedBox(height: 15,),

                  OneContainer(onpress: (){
               // go to study notes screen

                  },
                      icon: Icon(Icons.message, size: 55,),
                    titleText: "Get Study Notes",
                    discription: "get notes by providing any topic name",),
                ],
              ),
            ),

          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(bottom: 10),
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xFF19191B),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyShaderMaskforNavigation(icon: Icon(Icons.home,size: 40,), onpress: (){
                  // go to home screen

                }, ),
                MyShaderMaskforNavigation(icon: Icon(Icons.search,size: 40,), onpress: (){

                }),

                MyShaderMaskforNavigation(icon: Icon(CupertinoIcons.profile_circled,size: 40,), onpress: (){

                })

              ],
            ),
          )
      ),

    );
  }
}


