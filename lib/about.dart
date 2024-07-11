import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar:true , // This is for overwrite the app bar
        backgroundColor: Colors.black,
        appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
          onPressed: () {
          Navigator.pushNamed(context, 'home');
          },),
        backgroundColor: Colors.transparent,
        elevation: 0,
    ),
      body: Container(
        child:Stack(  //we used stack bec image ar upor text lagano possibel noi in container
          children: [
            Container(
              margin: EdgeInsets.only(left: 45,top: 35),
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
                  top: MediaQuery.of(context).size.height * 0.55),
              child: Column(
                children: [
                  Text('Hello I am',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white),),
                  SizedBox(height: 2,),
                  Text('Ankan Panja',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.white),),
                  SizedBox(height: 2,),
                  Text('Software Developer',
                    style:TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,color: Colors.white),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: 120,
                    child: TextButton(onPressed: (){
                      const link = "https://drive.google.com/file/d/1T8mh3RlIkneYd-VVXXOELgu8DbXHv0rG/view?usp=sharing";
                      launchUrl(
                       Uri.parse(link),
                       mode:LaunchMode.externalApplication
                      );
                    }, child: Text('Hire Me',style: TextStyle(color: Colors.black),),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),),
                  ),
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){
                        const link = 'https://www.instagram.com/__ankan__panja__?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==';
                        launchUrl(
                          Uri.parse(link),
                          mode: LaunchMode.inAppWebView
                        );
                        },
                        icon: Icon(
                            FontAwesomeIcons.instagram),
                              color: Colors.white,),

                      IconButton(onPressed: (){
                       const link ='https://www.linkedin.com/in/ankan-panja-b2875b250/';
                        launchUrl(
                          Uri.parse(link),
                          mode: LaunchMode.externalApplication
                        );
                      },
                        icon: Icon(
                            FontAwesomeIcons.linkedin),
                        color: Colors.white,),

                      IconButton(onPressed: (){
                        const link ='https://x.com/Ankan000005';
                        launchUrl(
                            Uri.parse(link),
                            mode: LaunchMode.externalApplication
                        );
                      },
                        icon: Icon(
                            FontAwesomeIcons.twitter),
                        color: Colors.white,),

                      IconButton(onPressed: (){
                        const link ='https://github.com/ankan2011';
                        launchUrl(
                            Uri.parse(link),
                            mode: LaunchMode.externalApplication
                        );
                      },
                        icon: Icon(
                            FontAwesomeIcons.github),
                        color: Colors.white,),

                      IconButton(onPressed: (){
                        const link ='https://www.facebook.com/ankan.panja.1212';
                        launchUrl(
                            Uri.parse(link),
                            mode: LaunchMode.externalApplication
                        );

                      },
                        icon: Icon(
                            FontAwesomeIcons.facebook),
                        color: Colors.white,),
                    ],
                  )
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
