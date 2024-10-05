import 'package:ecar/Backend/BLOCS/ProfilePageBloc/profiePageEvent.dart';
import 'package:ecar/Backend/BLOCS/ProfilePageBloc/profilePageState.dart';
import 'package:ecar/Backend/for_User/ProfileController.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePageIntegreation extends Bloc<ProfiePageEvent, ProfilePageState> {
  final ProfileController profileController;
  ProfilePageIntegreation(this.profileController)
      : super(UsernamePicProfileStateLoading()) {
    on<UsernamePicProfileEventLoading>(
      (event, emit) async {
        emit(UsernamePicProfileStateLoading());
        try {
          final data = await profileController.fetchUserRecord();
          emit(UsernamePicProfileStateLoaded(data));
        } catch (e) {
          emit(UsernamePicProfileStateError(e.toString()));
        }
      },
    );
  }
}
