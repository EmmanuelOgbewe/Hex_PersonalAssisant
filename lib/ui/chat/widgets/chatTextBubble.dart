/**
 * Displays a chat bubble. 
 * @author Emmanuel.O
 */
import 'package:flutter/material.dart';
import 'package:personal_assistant/utils/colors.dart';
import 'package:personal_assistant/utils/styles.dart';

class ChatTextBubble extends StatelessWidget {
  final String text;
  final bool isSender;

  const ChatTextBubble({Key key, this.text, this.isSender});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: ColorConstant.senderChatBubble,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                      topRight: Radius.circular(30.0))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  text,
                  style: Styles.chatBubbleTextColor,
                ),
              ),
            ),
            SizedBox(height: 10),
            text.contains("upload")
                ? new ChatRequestStatusContainer(status: "New Request",)
                : Container()
          ],
        ));
  }
}

class ChatRequestStatusContainer extends StatelessWidget {
  final String status;
  const ChatRequestStatusContainer({
    Key key,
    this.status
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
        future: Future.delayed(Duration(seconds: 1)),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return Container();
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 17.0,
                    width: 17.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                          ColorConstant.textGreenColor),
                    ),
                  )
                ],
              );
            default:
              return Text(status,
                  style: Styles.requestsStyle);
          }
        },
      ));
  }
}

class ChatReceiverTextBubble extends StatefulWidget {
  final String text;
  final bool isSender;

  const ChatReceiverTextBubble({this.text, this.isSender});
  @override
  _ChatReceiverTextBubbleState createState() => _ChatReceiverTextBubbleState();
}

class _ChatReceiverTextBubbleState extends State<ChatReceiverTextBubble> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
      child: Container(
        decoration: BoxDecoration(
            color: ColorConstant.receiverChatBubble,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
                bottomLeft: Radius.circular(30.0))),
              child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            widget.text,
            style: Styles.chatBubbleTextColor,
          ),
        ),
      ),
    );
  }
}
