import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:task1/providers/prisoners.dart';
import 'package:task1/widget/prisoner_item.dart';

// void main() => runApp(FirstScreen());

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var _isInit = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Prisoners>(context).fetchData();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final prisonerData = Provider.of<Prisoners>(context);
    final prisoners = prisonerData.prisoner;
    return Scaffold(
        body: Column(
      children: [
        Row(children: [
          IconButton(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(right: 50, left: 20, top: 50),
            icon: const Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
            onPressed: () {},
          ),
          Container(
              padding: const EdgeInsets.only(right: 25, left: 50, top: 50),
              child: const Text("Prisoners List",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold))),
        ]),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
            margin: const EdgeInsets.all(20),
            width: 500,
            height: 800,
            child: ListView.builder(
              itemBuilder: (ctx, index) => ChangeNotifierProvider(
                create: (BuildContext context) => prisoners[index],
                child: PrisonerItem(),
              ),
              itemCount: prisoners.length,
            ),
          ),
        )
      ],
    ));
  }
}
