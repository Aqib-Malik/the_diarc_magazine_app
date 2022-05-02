import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            WebView(
              initialUrl: 'https://www.thediarc.com/',
          javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (String url) {
                setState(() {
                  isLoading = false;
                });
                //hide you progressbar here
              },
        ),
            isLoading ?  Scaffold(
              backgroundColor: Colors.pink[50],
              body: Center(
                child: SpinKitFadingCube(
      size: 50,
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Colors.pink[500] : Colors.pink,
          ),
        );
      },
    ),
              ),
            ) : Stack()
          ],
        ),
      ),);
  
  }
}
