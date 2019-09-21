/**
 * Shows recent user requests to AI 
 * @author Emmanuel
 */

import 'package:flutter/material.dart';
import 'package:personal_assistant/utils/styles.dart';

class RequestsScreen extends StatelessWidget {
  final PageController controller;
  const RequestsScreen({Key key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
              Positioned(
              top: 20.0,
              right: 25.0,
              child: SafeArea(
                  child: GestureDetector(
                  child: RotatedBox(
                    quarterTurns: -2,
                    child: Icon(Icons.arrow_back, color: Colors.white,),
                  ),
                  onTap: (){
                    controller.animateToPage(1, duration:Duration(milliseconds: 400), curve: Curves.ease);
                  },
                ),
              ),   
            ),
            Positioned(
              top: 60.0,
              left: 20.0,
              child: SafeArea(
                child: Text(
                'Requests',
                style: Styles.requestsHeader
               ),
            )
          )
        ],
      ),
    );
  }
}
class RequestsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,index){
        switch(index){
          case 0:

          case 1:
        }
      },
    );
  }
}