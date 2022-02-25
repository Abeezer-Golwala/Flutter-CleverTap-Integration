import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:clevertap_plugin/clevertap_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late CleverTapPlugin _clevertapPlugin;
  @override
  void initState() {

    CleverTapPlugin.createNotificationChannel("abtest", "abtest", "Flutter Test", 5, true);
    super.initState();
    CleverTapPlugin.initializeInbox();
    CleverTapPlugin.setDebugLevel(3);

  }

  String textHolder = 'Old Sample Text...!!!';

  Future<void> changeText() async {
    var temp= {"":""};
    CleverTapPlugin.recordEvent("abeezernativedisp", temp);
    setState(() async {
      //  List <dynamic> displayUnits = await CleverTapPlugin.getAllDisplayUnits();
    //    textHolder = "Display Units = "+displayUnits.toString();
      print("abezer test");
      List <dynamic> myJSON = await CleverTapPlugin.getAllDisplayUnits();
      print("abezer "+myJSON.toString());

       // String nameString = jsonEncode(nameJson); // jsonEncode != .toString()

      // String jsonTags = jsonEncode(displayUnits);
        // var decodedJson = json.decode(jsonTags);
        // var jsonValue= json.decode(decodedJson['value']);
     //   print("Display Units = " + displayUnits.toString());
            //displayUnits.toString();
    });
    setState(() {
      textHolder = "Display Units";
    });
  }
  @override
  Widget build(BuildContext context) {

    // void onDisplayUnitsLoaded(List<dynamic> displayUnits) {
    //   this.setState(() async {
    //     List displayUnits = await CleverTapPlugin.getAllDisplayUnits();
    //     print("Display Units = " + displayUnits.toString());
    //     textHolder = displayUnits.toString();
    //   });
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              color: Colors.grey.shade300,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  title: Text("Performs onUserLogin"),
                  subtitle: Text("Used to identify multiple profiles"),
                  onTap: onUserLogin,
                ),
              ),
            ),
            Card(
              color: Colors.grey.shade300,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  title: Text("Push Notification"),
                  subtitle: Text("Pushes/Records an event"),
                  onTap: recordEvent,
                ),
              ),
            ),
            Card(
              color: Colors.grey.shade300,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  title: Text("App Inbox"),
                  subtitle: Text("App Inbox event"),
                  onTap: opappinbox,
                ),
              ),
            ),
            Card(
              color: Colors.grey.shade300,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  title: Text("In App"),
                  subtitle: Text("In App event"),
                  onTap: inapp,
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text('$textHolder',
                    style: TextStyle(fontSize: 21)
                )
            ),
            ElevatedButton(
              onPressed: () => changeText(),
              child: Text('Click Here To Change Text Widget Text Dynamically'),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  void onUserLogin() {
    var stuff = ["bags", "shoes"];
    var profile = {
      'Name': 'Abeezer',
      //'Identity': '100',
      'Email': 'abeezer@flutter.com',
      'Phone': '+919799609447',
      'DOB':'01-01-1999',
      'stuff': stuff,
      'MSG-push':true,
      'MSG-whatsapp':true,
      'MSG-sms':true,
      'MSG-email':true
    };
    CleverTapPlugin.onUserLogin(profile);
    //showToast("onUserLogin called, check console for details");
  }
   void recordEvent() {
    var eventData = {
     'number': 1
     };
     CleverTapPlugin.recordEvent("AbeezerPushEvent",eventData);
   }
   void opappinbox(){
     var eventData = {
       'number': 1
     };
     CleverTapPlugin.recordEvent("AbeezerPushEvent",eventData);
     var styleConfig = {
       'noMessageTextColor': '#ff6600',
       'noMessageText': 'No message(s) to show.',
       'navBarTitle': 'App Inbox'
     };
     CleverTapPlugin.showInbox(styleConfig);
   }
   void inapp(){

      var temp= {"":""};
     CleverTapPlugin.recordEvent("abeezerinapnotif",temp);

   }
}
