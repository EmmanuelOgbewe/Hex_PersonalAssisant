/**
 * Contains welcome message, chat and voice features.
 * @author Emmanuel O.
 */

import 'package:flutter/material.dart';
import 'package:personal_assistant/utils/colors.dart';
import 'package:personal_assistant/utils/styles.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/services.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.mainBackColor,
        body: SafeArea(child: WelcomeBody()));
  }
}

class WelcomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          left: 20.0,
          right: 20.0,
          top: MediaQuery.of(context).size.height / 4.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              WelcomeText(),
              SizedBox(height: 20),
              RequestsContainer()
            ],
          ),
        ),
        AnimateHead()
      ],
    );
  }
}

class WelcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Hey Emmanuel, what can I help you with?',
      style: TextStyle(
        color: Colors.white.withOpacity(0.9),
        fontSize: 38.0,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class RequestsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(20.0)),
      child: Center(
        child: Text(
          '2 Requests in progress',
          style: Styles.requestsStyle,
        ),
      ),
    );
  }
}

class AnimateHead extends StatefulWidget {
  AnimateHead({Key key}) : super(key: key);

  _AnimateHeadState createState() => _AnimateHeadState();
}

class _AnimateHeadState extends State<AnimateHead> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
         bottom: 30.0 ,
         child: Container(
           height: 80.0,
           width: 80.0,
           child: GestureDetector(
             onTap: (){
               if(isTapped == true){
                 HapticFeedback.mediumImpact();
                  Future.delayed(Duration(milliseconds: 100), (){
                    HapticFeedback.mediumImpact();
                    HapticFeedback.mediumImpact();
                  });
               }
               setState(() {
                 isTapped = !isTapped;
               });
             },
             child: Stack(
               children: <Widget>[
                 !isTapped? new AIHead(animationName:"Aura") : Container(),
                 isTapped? new AIHead(animationName:"Aura2") : Container()
               ],
             ),
           ),
         ) ,
       );
  
  }
}

class AIHead extends StatelessWidget {
  final String animationName;
  const AIHead({Key key, this.animationName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlareActor(
        'assets/AI_Head_bg.flr',
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: animationName,
      ),
    );
  }
}

class DialogContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.chatFieldColor,
    );
  }
}
