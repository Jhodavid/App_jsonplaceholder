
import 'dart:io';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class JsonManageFile {

  Future<String> get _directoryPath async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> getJsonFile( String fileName ) async {
    final path = await _directoryPath;
    return File('$path/$fileName.json');
  }


  Future<void> writeJsonFile( { required String fileName, required List list} ) async {
    File file = await getJsonFile(fileName);
    if (await file.exists()) await file.delete();
    await file.writeAsString(json.encode(list));
  }


  Future<dynamic> readJsonFile( { required String fileName } ) async {
    String? fileContent;

    File file = await getJsonFile(fileName);

    if (await file.exists()) {
      try {
        fileContent = await file.readAsString();
        return json.decode(fileContent);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }

    return fileContent;
  }



}