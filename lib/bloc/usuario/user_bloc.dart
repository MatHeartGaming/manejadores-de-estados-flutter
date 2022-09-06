import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) {
      print("Activate User Called!");
      emit(UserSetState(event.user));
    });

    on<ChangeUserAge>((event, emit) {
      if (!state.existUser) return;
      print("Se emitira un nuevo estado!");
      //state.user?.edad = event.age;  // Avoid changing the current state. Always create a new one!
      emit(UserSetState(state.user!.copyWith(edad: event.age)));
    });

    on<AddProfession>((event, emit) {
      if (!state.existUser) return;
      print("Profession Added");
      final listProfessions = [...?state.user?.profesiones, event.professions];
      emit(UserSetState(state.user!.copyWith(profesiones: listProfessions)));
    });

    on<DeleteUser>((event, emit) {
      emit(const UserInitialState());
    });
  }
}
