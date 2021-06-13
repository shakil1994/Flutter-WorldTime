import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async {
    /** Simulate network request for a userName */
    String userName = await Future.delayed(Duration(seconds: 6), (){
      return 'Shakil';
    });

    /** Simulate network request to get bio  of the userName */
    String bio = await Future.delayed(Duration(seconds: 2), (){
      return 'Developer, iOS, Android';
    });

    print('$userName - $bio');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    print('Print First');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Text('Choose Location Screen'),
    );
  }
}
