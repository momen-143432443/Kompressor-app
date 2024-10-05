import 'package:ecar/Backend/BLOCS/homeBloc/HomeblocEvent.dart';
import 'package:ecar/Backend/BLOCS/homeBloc/HomeblocState.dart';
import 'package:ecar/Backend/CarStructure/carController.dart';
import 'package:ecar/Backend/carNotes.dart/notesController.dart';
import 'package:ecar/Backend/for_User/ProfileController.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HBlocIntegration extends Bloc<HomeBlocEvent, Homeblocstate> {
  final Notescontroller notescontroller;
  HBlocIntegration(this.notescontroller) : super(HBlocLoading()) {
    on<HBlocLoad>((event, emit) async {
      emit(HBlocLoading());
      try {
        final notes = await notescontroller.getAllNotes();
        emit(HBlocLoaded(notes));
        if (notes.isEmpty) {
          emit(HBlocNoData());
        }
      } catch (e) {
        print(e.toString());
        emit(HBlocError(e.toString()));
      }
    });
  }
}

class HBlocRefreshIntegration extends Bloc<HomeBlocEvent, Homeblocstate> {
  final Notescontroller notescontroller;
  HBlocRefreshIntegration(this.notescontroller) : super(HBlocLoading()) {
    on<HBlocResfresh>((event, emit) async {
      emit(HBlocLoading());
      try {
        final notes = await notescontroller.getAllNotes();
        emit(HBlocLoaded(notes));
        if (notes.isEmpty) {
          emit(HBlocNoData());
        }
      } catch (e) {
        print(e.toString());
        emit(HBlocError(e.toString()));
      }
    });
  }
}
///////////////////////////////////////////////////////

class PicUsernameBlocIntegration
    extends Bloc<PicUsernameBlocEvent, PicUsernameBlocState> {
  final ProfileController profileController;
  PicUsernameBlocIntegration(this.profileController)
      : super(HblocImageUsernameLoading()) {
    on<HblocImageUsernameLoadedEvent>(
      (event, emit) async {
        emit(HblocImageUsernameLoading());
        print('Loading iamge and username');
        try {
          print('Loaded iamge and username');
          final data = await profileController.fetchUserRecord();
          emit(HblocImageUsernameLoaded(data));
        } catch (e) {
          print('Error iamge and username');
          emit(HblocImageUsernameError(e.toString()));
        }
      },
    );
  }
}

class HblocCarImageNameIntegration
    extends Bloc<HblocCarImageNameEvent, HblocCarImageNameState> {
  final CarController carController;
  HblocCarImageNameIntegration(this.carController)
      : super(HblocCarImageNameLoading()) {
    on<HblocCarImageNameEventLoading>((event, emit) async {
      emit(HblocCarImageNameLoading());
      try {
        final cars = await carController.fetchCarRecord();
        emit(HblocCarImageNameLoaded(cars));
      } catch (e) {
        emit(HblocCarImageNameError(e.toString()));
      }
    });
  }
}
