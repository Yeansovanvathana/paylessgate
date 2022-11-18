import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'genTransactionId.dart';

class sample extends StatefulWidget {
  const sample({super.key});

  @override
  State<sample> createState() => _sampleState();
}

class _sampleState extends State<sample> {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  _launchURL() async {
    var genTicket = RandomDigits.getInteger(11);
    var genTransaction = RandomDigits.getInteger(4);
    var url =
        'https://paylessgate.netlify.app/?TicketId=${genTicket}&TransactionId=${genTransaction}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // postData() async {
  //   var response = await http.post(Uri.parse("http://10.0.84.44:8000/todos"),
  //       // body: jsonEncode({: "TicketID": "12345678901", "TransactionID": "1234"}));
  //       body: jsonEncode({
  //         "name": RandomDigits.getInteger(11).toString(),
  //         "description": RandomDigits.getInteger(4).toString(),
  //       }));
  //   print(response.body);
  // }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        // postData();
        // getParams();
        _launchURL();
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });

      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 210, 220, 228),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   "HandFree On/Off",
                //   style: TextStyle(fontSize: 20),
                // ),
                // const SizedBox(width: 10),
                Transform.scale(
                  scale: 2.0,
                  child: Switch(
                    value: isSwitched,
                    onChanged: toggleSwitch,
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text('$textValue'),
          ],
        )),
      ),
    );
  }
}
