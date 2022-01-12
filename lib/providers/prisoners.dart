import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:task1/providers/Prisoner.dart';

class Prisoners with ChangeNotifier {
  List<Prisoner> _prisoner = [];

  List<Prisoner> get prisoner {
    return [..._prisoner];
  }

  Prisoner findById(String id) {
    return _prisoner.firstWhere((p) => p.id == id);
  }

  Future<void> fetchData() async {
    var url = Uri.parse("http://159.89.4.181:2000/api/v1/cases?caseStatus=2");
    try {
      final response = await http.get(url);
      final result = jsonDecode(response.body) as Map<String, dynamic>;
      print(result);
      List loaded = result["model"];
      final List<Prisoner> loadedPrisoners = [];
      loaded.forEach((prisonerData) {
        loadedPrisoners.add(Prisoner(
          id: prisonerData['id'] as String,
          name: prisonerData["status"] as String,
          place: prisonerData["status"] as String,
          image: prisonerData["thumbnail"] as String,
          background: prisonerData["image"] as String,
          neededAmount: prisonerData["neededAmount"],
        ));
      });
      _prisoner = loadedPrisoners;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
