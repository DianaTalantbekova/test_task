import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:test_task/helpers/api_requester.dart';
import 'package:test_task/helpers/catchException.dart';
import 'package:test_task/models/character_model.dart';

class CharacterProvider {
  Future<CharacterModel> getCharacter() async {
     log("message1");
    try {
      ApiRequester requester = ApiRequester();
      log("message2");
      Response response = await requester.toGet('/character');
       log("message3");
      if (response.statusCode == 200 && response.statusCode! < 300) {
         log("message4");
        CharacterModel characterModelList =
            CharacterModel.fromJson(response.data);
        return characterModelList;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      print('provider error === $e');
      throw CatchException.convertException(e);
    }
  }
}
