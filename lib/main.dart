import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_assistant/ui/requests/requestScreen.dart';
import 'utils/colors.dart';
import 'package:personal_assistant/ui/welcome_page/welcome_page.dart';
import 'ui/chat/chat.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark
  ));

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   PageController controller;

  @override
  void initState() {
    super.initState();
     controller = new PageController(initialPage: 1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.mainBackColor,
      body: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index){
           FocusScope.of(context).unfocus();
        },
        children: <Widget>[
          RequestsScreen(controller: controller),
          WelcomePage(),
          ChatScreen(),
        ],
      ),
    );
  }
}

