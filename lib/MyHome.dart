import'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

    myAchiv(num,type) {
      return Row(
        children: [
          Text(
            num, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(type),
          ),
        ],
      );
    }

      mySpecialization(image, text){
        return   Column(

          children: [
            Row(
              children: [
                Container(
                  width: 105,
                  height: 110,
                  child: Card(
                    margin: EdgeInsets.all(0), // For removing default margin(by defalult extra space nai
                    color: Color(0xff252525),
                    shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(image,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10,),
                        Text(text,style: TextStyle(color: Colors.white),)
                      ],

                    ),
                  ),

                )

              ],
            )
          ],
        );

    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:true , // This is for overwrite the app bar
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: PopupMenuButton(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          icon: Icon(Icons.menu,color: Colors.white,),
          itemBuilder: (context) => [
            PopupMenuItem(
                child: TextButton(
                  child: Text('Projects',style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    Navigator.pushNamed(context, 'projects');
                  },
            ),
            value: 1,),
            PopupMenuItem(child: TextButton(
              child: Text('About Me',style: TextStyle(color: Colors.white),),
              onPressed: (){
                Navigator.pushNamed(context, 'about');
              },
            ),value: 2,),
          ],
        ),


      ),


      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 50,
        snapSpec: const SnapSpec(
          // Enable snapping. This is true by default.
          snap: true,
          // Set custom snapping points.
          snappings: [0.38, 0.7, 1.0],
          // Define to what the snappings relate to. In this case,
          // the total available space that the sheet can expand to.
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        // The body widget will be displayed under the SlidingSheet
        // and a parallax effect can be applied to it.


        body: Container(
          child:Stack(  //we used stack bec image ar upor text lagano possibel noi in container
            children: [
              Container(
                margin: EdgeInsets.only(left: 45),
                child:ShaderMask(
                  shaderCallback: (rect){
                      return LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black,Colors.transparent]
                      ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height)
                      );
                  },
                    blendMode: BlendMode.dstIn,
                    child: Image.asset('assets/aa.jpg',
                    height: 400,fit:BoxFit.contain
                      ,)),


              ),
              Container(
                alignment:Alignment.center,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.49),
                child: Column(
                  children: [
                    Text('Ankan Panja',
                      style: TextStyle(
                        fontFamily: "Font",
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.white),),
                    Text('Software Developer',style:
                    TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20,color: Colors.white),),


                  ],
                ),
              )

            ],
          ),
        ),
        builder: (context, state) {
          // This is the content of the sheet that will get
          // scrolled, if the content is bigger than the available
          // height of the sheet.
          return Container(
            height: 500,
            margin: EdgeInsets.only(top: 30,left: 20,right: 20),
            child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  myAchiv('4', "Project"),
                  myAchiv('0', "Client"),
                  myAchiv('2', "Messages"),
                ],
              ),
                SizedBox(height: 12,),
                Text('Specialized In',
                  style: TextStyle (fontSize: 30,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12,),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpecialization(FontAwesomeIcons.android, "Android"),
                        mySpecialization(FontAwesomeIcons.appStoreIos,"IoS"),
                        mySpecialization(FontAwesomeIcons.github, "GitHub"),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpecialization(FontAwesomeIcons.linux, "Linux"),
                        mySpecialization(FontAwesomeIcons.microsoft, "Ms Word"),
                        mySpecialization(FontAwesomeIcons.fire, "firebase"),
                      ],
                    ),SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        mySpecialization(FontAwesomeIcons.filePowerpoint, "Power Point"),
                      ],
                    ),

                    SizedBox(height: 10,),
                  ],
                )



              ]


              ),



          );
        },
      ),
    );
  }
}
