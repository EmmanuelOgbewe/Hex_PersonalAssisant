/**
 * Chat screen between the user and the Assistant 
 * @author Emmanuel 
 */
import 'package:flutter/material.dart';
import 'package:personal_assistant/ui/chat/widgets/chatTextBubble.dart';
import 'package:personal_assistant/utils/colors.dart';
import 'package:personal_assistant/ui/chat/widgets/chatTextField.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.mainBackColor,
      body: ChatListView(scrollController: _scrollController),
    );
  }
}

class ChatListView extends StatefulWidget {
  final ScrollController scrollController;
  const ChatListView({Key key, this.scrollController});

  @override
  _ChatListViewState createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  final List<Map> listData = [];

  void refreshData() {
    print(listData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                  child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onPanDown: (details) {
                        print(details.globalPosition.dy);

                        if (details.localPosition.dy > 200) {
                          FocusScope.of(context).unfocus();
                        }
                      },
                      child: ListView.builder(
                        controller: widget.scrollController,
                        itemCount: listData.length,
                        itemBuilder: (context, index) {
                          if (listData[index]['isUser']) {
                            return ChatTextBubble(
                                text: listData[index]['text']);
                          } else {
                            return ChatReceiverTextBubble(
                                text: listData[index]['text']);
                          }
                        },
                      ))),
            ),
            Container(
                color: ColorConstant.chatFieldColor,
                child: ChatTextfield(
                  chatList: listData,
                  refreshList: refreshData,
                  scrollController: widget.scrollController,
                ))
          ],
        ),
      ),
    );
  }
}
