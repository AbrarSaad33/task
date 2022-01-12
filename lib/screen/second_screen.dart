import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/providers/prisoners.dart';
import 'package:task1/widget/prisoner_details.dart';

class SecondScreen extends StatefulWidget {
  static const routeName = "/SecondScreen";

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  var _isInit = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      //Provider.of<Prisoners>(context).fetchDetails();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: const Text("Prisoner inner"),
        // ),
        body: PrisonerDetails());
  }
}
