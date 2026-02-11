import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

dynamic stringToJson(String string) {
  // "string" is a json file. return it as a json variable
  return jsonDecode(string);
}

Future<Map<String, dynamic>> loadQuestionsMap(String assetPath) async {
  // Load a JSON file from assets and return it as a map.
  final content = await rootBundle.loadString(assetPath);
  final decoded = jsonDecode(content);
  if (decoded is Map<String, dynamic>) {
    return decoded;
  }
  return {};
}

List<dynamic> getQuestionsSection(
  Map<String, dynamic> jsonMap,
  String sectionKey,
) {
  final section = jsonMap[sectionKey];
  if (section is List) {
    return section;
  }
  return [];
}

List<dynamic> shuffleQuestions(List<dynamic> listVar) {
  final shuffled = List<dynamic>.from(listVar);
  shuffled.shuffle(math.Random());
  return shuffled;
}

int decrease(int variable) {
// decrease variable by one
  return variable - 1; // Decrease the variable by one
}

List<QuestionDataTypeStruct> randomListItems(
    List<QuestionDataTypeStruct> listVar) {
  // return 3 different random items from listVar
  final random = math.Random();
  final selectedItems = <QuestionDataTypeStruct>{};

  while (selectedItems.length < 3 && selectedItems.length < listVar.length) {
    selectedItems.add(listVar[random.nextInt(listVar.length)]);
  }

  return selectedItems.toList();
}
