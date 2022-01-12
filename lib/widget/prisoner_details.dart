// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/providers/prisoners.dart';

class PrisonerDetails extends StatelessWidget {
  const PrisonerDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prisonerId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedPrisoner =
        Provider.of<Prisoners>(context, listen: false).findById(prisonerId);
    return ListView(children: <Widget>[
      Stack(children: <Widget>[
        SizedBox(
            width: double.infinity,
            height: 500,
            child: Image.network(
              loadedPrisoner.background,
              width: double.infinity,
              height: 900,
              fit: BoxFit.cover,
            )),
        IconButton(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(30),
          icon: const Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          alignment: Alignment.topRight,
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 350),
          icon: const Icon(Icons.redo_outlined, color: Colors.white),
          onPressed: () {},
        ),
        Container(
          padding:
              const EdgeInsets.only(top: 400, bottom: 1, right: 30, left: 30),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            margin: const EdgeInsets.all(1),
            width: 500,
            height: 150,
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
                      backgroundImage: NetworkImage(loadedPrisoner.image),
                    ),
                    title: Text(loadedPrisoner.name,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    subtitle: Text(loadedPrisoner.place,
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
                        margin: const EdgeInsetsDirectional.only(
                            start: 1.0, end: 1.0),
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
                          child: Text(
                              loadedPrisoner.neededAmount.toString() + 'AED',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Container(
                          padding: const EdgeInsets.all(10),
                          child: const Text("Goal Completed"))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
      Center(
        child: Container(
            padding:
                const EdgeInsets.only(right: 50, left: 50, top: 1, bottom: 20),
            child: const Text("Case Details",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20))),
      ),
      ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: Text(
              'Aspernatur adipisci assumenda voluptate harum veritatis.  Ipsum voluptas id ratione. Eum consequatur est autem ea voluptatem.\n\nRatione perspiciatis fugit quos nulla. Qui in quia eos vitae voluptas eaque itaque repellendus iusto. Nemo qui sed quasi minus. Ipsa unde qui voluptatem.\n\nPlaceat laborum quos et aut et. Beatae ad error distinctio et qui pariatur. Et vel nihil dignissimos voluptatem magnam sed ab. Nulla amet velit reprehenderit architecto earum fugit et et voluptates. Non deserunt cupiditate veritatis eligendi incidunt ea. Maxime atque exercitationem laboriosam rerum non iure dolorem nemo officiis.\n\nEt natus laborum in. Fugiat neque consequatur sit ducimus aut autem qui ad. Inventore vero ea. Temporibus saepe qui corporis qui unde pariatur non et. Omnis consequatur omnis non tempore rerum delectus voluptatibus. Minima eos quasi.',
            ),
          ),
        ],
      )
    ]);
  }
}
