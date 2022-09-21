import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task/helpers/catchException.dart';
import 'package:test_task/models/character_model.dart';
import 'package:test_task/screens/bloc/character_repository.dart';
part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitial()) {
    on<GetCharactersEvent>(
      (event, emit) async {
        emit(CharacterLoadingState());

        try {
          CharacterModel characterModelList =
              await CharacterRepository().getCharacter();

          emit(CharacterLoadedState(characterModelList: characterModelList));
          print('message 5');
        } catch (e) {
          print('e === $e');

          emit(
            CharacterErrorState(error: CatchException.convertException(e)),
          );
        }
      },
    );
  }
}
