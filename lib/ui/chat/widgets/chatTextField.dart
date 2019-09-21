/**
 * Chat textfield for the chat screen 
 * @author Emmanuel
 */
import 'package:flutter/material.dart';
import 'package:personal_assistant/ui/welcome_page/welcome_page.dart';
import 'package:personal_assistant/utils/styles.dart';

class ChatTextfield extends StatefulWidget {
  final List<Map> chatList;
  final Function refreshList;
  final ScrollController scrollController;

  ChatTextfield(
      {Key key, this.chatList, this.refreshList, this.scrollController})
      : super(key: key);

  @override
  _ChatTextfieldState createState() => _ChatTextfieldState();
}

class _ChatTextfieldState extends State<ChatTextfield> {
  final TextEditingController _chatController = new TextEditingController();
  FocusNode inputFieldNode;

  @override
  void initState() {
    super.initState();
    inputFieldNode = FocusNode();
  }

  @override
  void dispose() {
    inputFieldNode.dispose();
    super.dispose();
  }

  void _sendChat(Map data) {
    _chatController.text = "";
    String regex = "[a-zA-Z0-9\+\w\+]";

    if (data['text'].isNotEmpty && data['text'].contains(new RegExp(regex))) {
      widget.chatList.add(data);
    }
    widget.refreshList();
    //send code to chat
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                    child: TextField(
                        style: Styles.chatTexfieldColor,
                        controller: _chatController,
                        focusNode: inputFieldNode,
                        textInputAction: TextInputAction.send,
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hasFloatingPlaceholder: false,
                          labelText: 'Start typing... ',
                          labelStyle: Styles.chatTexfieldPlaceholderColor,
                          border: InputBorder.none,
                        ),
                        onTap: () {
                          Future.delayed(Duration(milliseconds: 100), () {
                            widget.scrollController.animateTo(
                                widget
                                    .scrollController.position.maxScrollExtent,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeOut);
                          });
                        },
                        onSubmitted: (str) {
                          //Keep keyboard up when submitting
                          FocusScope.of(context).requestFocus(inputFieldNode);
                          _sendChat({'isUser': true, 'text': str});
                          _sendChat({
                            'isUser': false,
                            'text': 'Great, I will remind you!'
                          });

                          Future.delayed(Duration(milliseconds: 100), () {
                            widget.scrollController.animateTo(
                                widget
                                    .scrollController.position.maxScrollExtent,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeOut);
                          });
                        })),
              ),
              Container(
                height: 50.0,
                width: 50.0,
                child: AIHead(
                  animationName: "Aura",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
