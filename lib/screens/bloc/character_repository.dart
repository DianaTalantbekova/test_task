import 'package:test_task/models/character_model.dart';
import 'package:test_task/screens/bloc/character_provider.dart';

class CharacterRepository {
  Future<CharacterModel> getCharacter() {
    CharacterProvider provider = CharacterProvider();
    return provider.getCharacter();
  }
}