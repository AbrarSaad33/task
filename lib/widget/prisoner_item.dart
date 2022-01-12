import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/providers/Prisoner.dart';
import 'package:task1/providers/prisoners.dart';
import 'package:task1/screen/second_screen.dart';

class PrisonerItem extends StatelessWidget {
  // final String id;
  // final String name;
  // final String place;
  // final String image;
  // final int neededAmount;

  // const PrisonerItem(
  //     this.id, this.name, this.place, this.image, this.neededAmount);

  @override
  Widget build(BuildContext context) {
    final prisoner = Provider.of<Prisoner>(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(SecondScreen.routeName, arguments: prisoner.id);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              trailing: CircleAvatar(
                backgroundImage: NetworkImage(prisoner.image),
              ),
              title: Text(prisoner.name,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              subtitle: Text(prisoner.place,
                  style: const TextStyle(color: Colors.grey)),
            ),
            SizedBox(
              height: 10.0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[800],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin:
                      const EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                  height: 10,
                  width: 270,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(prisoner.neededAmount.toString() + 'AED',
                        style: const TextStyle(fontWeight: FontWeight.bold))),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text("Goal Completed"))
              ],
            ),
            const Divider(
                color: Colors.grey, height: 1, endIndent: 10, indent: 10),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Center(
                  child: Text(
                      "Debit Money raised for abrar,\n       will be relased shortly ",
                      style: TextStyle(color: Colors.grey))),
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
