part of 'character_bloc.dart';

abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoadingState extends CharacterState {}

class CharacterLoadedState extends CharacterState {
  final CharacterModel characterModelList;
 
  CharacterLoadedState(
      {required
       this.characterModelList});
}

class CharacterErrorState extends CharacterState {
  final CatchException? error;

  CharacterErrorState({this.error});
}