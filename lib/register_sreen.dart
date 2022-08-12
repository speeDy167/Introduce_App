import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:otp/reuse.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:audioplayers/audioplayers.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setAudio();

    //Listen to state: Playing, Pause
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
         isPlaying = state == PlayerState.PLAYING;
      });
    });
  }

  Future setAudio() async{
    //Repeat song
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);

    //Load audio from assets
    final player = AudioCache(prefix: 'assets/images/');
    final url = await player.load('nhac.mp3');
    audioPlayer.setUrl(url.path, isLocal: true);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFff5f6d),
                Color(0xFFffc371),
              ],
              ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20),
            child: Column(
              children: <Widget> [
                logoWidget('assets/images/phuc.jpg'),
                Button(context, Icons.facebook_outlined, 'Facebook', (){
                 launchUrlString('https://www.facebook.com/trongphuc07');
                }),
                Button(context, Icons.mail_outline_outlined, 'trongphucphan7@gmail.com', (){
                launchUrlString('https://accounts.google.com/AccountChooser/identifier?service=mail&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&flowName=GlifWebSignIn&flowEntry=AccountChooser');
                }),
                Button(context, Icons.phone, 'Call me now', ()
                {
                  FlutterPhoneDirectCaller.callNumber('113');
                },
                ),
                CircleAvatar(
                  radius: 30,
                  child: IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    iconSize: 30,
                    onPressed: () async{
                      if(isPlaying){
                        await audioPlayer.pause();
                      }
                      else{
                        await audioPlayer.resume();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}