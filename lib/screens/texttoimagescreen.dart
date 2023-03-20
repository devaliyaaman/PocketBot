import 'package:flutter/material.dart';
import 'package:dicee/components/poketbotText.dart';
import 'package:dicee/services/api_service.dart';


class ImageGenratorScreen extends StatefulWidget {
  const ImageGenratorScreen({Key? key}) : super(key: key);

  @override
  State<ImageGenratorScreen> createState() => _ImageGenratorScreenState();
}

class _ImageGenratorScreenState extends State<ImageGenratorScreen> {


  TextEditingController message = TextEditingController();
  String image = '';
  var isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
      appBar: AppBar(
        backgroundColor: Color(0xFF19191B) ,
    title: Center(
    child: PocketText(size: 35.0),
    ),
    ),
      body:Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: TextFormField(
                          controller: message,
                          decoration: InputDecoration(
                            hintText: "ex. monkey on moon",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 44,
                  width: 300,
                  child:  ElevatedButton(onPressed: () async {

                    showDialog(context: context, builder: (context) {
                      return Center(
                        child: ShaderMask(

                            shaderCallback: (bounds) => LinearGradient(
                                colors: [Color(0xFFFE53BB),
                                  Color(0xFF09FBD3)]
                            ).createShader(bounds),
                            child: CircularProgressIndicator(),
                        ),
                      );
                    });

                    if(message.text.isNotEmpty){
                      setState(() {
                        isLoaded = false;
                      });
                      image = await ApiService.genrateImage(message.text);
                      setState(() {
                        isLoaded = true;
                      });
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
                      Text("Enter the text and tri again")));
                    }
                    Navigator.of(context).pop();
                   
                  },
                    child: Text("Genrate"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: StadiumBorder()
                  ),),

                )

              ],
            )),
            Expanded( flex: 4,
              child: isLoaded ? Image.network(image):
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset("images/loader.gif") ,
                    // SizedBox(height: 10,),
                    Text("Loading image from api")
                  ],
                ),
              )
              )
          ],
        ),
      )
    );
  }
}
