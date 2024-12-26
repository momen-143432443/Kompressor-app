import 'package:card_loading/card_loading.dart';
import 'package:ecar/Backend/BLOCS/homeBloc/HomeBlocItregration.dart';
import 'package:ecar/Backend/BLOCS/homeBloc/HomeblocEvent.dart';
import 'package:ecar/Backend/BLOCS/homeBloc/HomeblocState.dart';
import 'package:ecar/Backend/CarStructure/carController.dart';
import 'package:ecar/Backend/carNotes.dart/carNoteScreen.dart';
import 'package:ecar/Backend/carNotes.dart/notesController.dart';
import 'package:ecar/Backend/carNotes.dart/notesModel.dart';
import 'package:ecar/Backend/for_User/ProfileController.dart';
import 'package:ecar/Frontend/Screens/generalPages/ProfileScreen.dart';
import 'package:ecar/Frontend/widgets.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:ecar/tools/snacks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.homeFormKey,
        body: SafeArea(
            child: RefreshIndicator(
          edgeOffset: 10,
          backgroundColor: blueColor,
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          color: white,
          onRefresh: () async => RefreshData(),
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Column(
                      children: [
                        UsernameAnduserpicHomeScreen(),
                        hSpace,
                        CarImageAndcarmakemodelhomeScreen(),
                        hSpace,
                        SearchBarHomeScreen(),
                        hSpace,
                        notesAvailable()
                      ],
                    ),
                  ],
                )),
          ),
        )),
        floatingActionButton: HomeFloatingActionButton());
  }

  MultiBlocProvider notesAvailable() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HBlocIntegration(Notescontroller())..add(HBlocLoad()),
        ),
      ],
      child: BlocBuilder<HBlocIntegration, Homeblocstate>(
        builder: (context, stateN) {
          if (stateN is HBlocLoading) {
            return const Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardLoading(
                    height: 30,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    width: 100,
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  CardLoading(
                    height: 100,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  CardLoading(
                    height: 30,
                    width: 200,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                ],
              ),
            );
          }
          if (stateN is HBlocLoaded) {
            List<NotesModel> noteList = stateN.notesModel;
            return BlocBuilder<HBlocIntegration, Homeblocstate>(
              builder: (context, state) {
                return Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    width: 400,
                    height: container.height / 3.60,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: noteList.length,
                      itemBuilder: (c, index) {
                        return PopupMenuButton<String>(
                          offset: const Offset(22, 34),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem<String>(
                                value: '1',
                                child: Text(
                                    'The note will be delete at ${DateFormat('dd/MM hh:mm a').format(stateN.notesModel[index].timePost.toDate()).toString()}'),
                              ),
                            ];
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Dismissible(
                                movementDuration: const Duration(seconds: 2),
                                key: UniqueKey(),
                                direction: DismissDirection.endToStart,
                                onDismissed: (DismissDirection direction) =>
                                    context.read<HBlocIntegration>().add(
                                        HBlocDeleteE(noteList[index].docId)),
                                background: Card(
                                  elevation: 4,
                                  color: redColor,
                                  child: Padding(
                                    padding: appSym,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.delete,
                                          color: Colors.transparent,
                                        ),
                                        Icon(
                                          Icons.delete,
                                          color: white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                child: Container(
                                  width: 400,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      color: carGrey,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: ListTile(
                                      title: Text(
                                          stateN.notesModel[index].subject,
                                          style: const TextStyle(color: white)),
                                      subtitle: Text(
                                          stateN.notesModel[index].title,
                                          style: const TextStyle(color: white)),
                                      trailing: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 35, left: 120),
                                        child: Text(
                                          DateFormat('dd/MM hh:mm a')
                                              .format(stateN
                                                  .notesModel[index].timePost
                                                  .toDate())
                                              .toString(),
                                          style: const TextStyle(color: white),
                                        ),
                                      )),
                                ),
                              ),
                              h2,
                            ],
                          ),
                        );
                      },
                    ));
              },
            );
          } else if (stateN is HBlocNoData) {
            return IfThereisAnyNotes();
          } else if (stateN is HBlocError) {
            oops;
          }
          return Container();
        },
      ),
    );
  }
}

homeFunctions() => Column(
      children: [
        Column(
          children: [
            CarImageAndcarmakemodelhomeScreen(),
            hSpace,
            CarImageAndcarmakemodelhomeScreen(),
            hSpace,
            SearchBarHomeScreen(),
            hSpace,
            notesAvailable()
          ],
        ),
      ],
    );

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animationCurve: Curves.slowMiddle,
      //
      curve: Curves.slowMiddle,
      //
      overlayOpacity: 0.3,
      //
      elevation: 3,
      //
      backgroundColor: blueColor,
      foregroundColor: white,
      //
      icon: Icons.add,
      //
      activeIcon: Icons.close,
      //
      childPadding: const EdgeInsets.all(5),
      //
      spaceBetweenChildren: 4,
      //
      children: [
        SpeedDialChild(
            onTap: () => Get.to(() => const Carnotescreen()),
            child: Text("K", style: GoogleFonts.jua(fontSize: 30)),
            foregroundColor: blueColor,
            label: 'Add notes',
            labelStyle: const TextStyle(color: blueColor)),
      ],
    );
  }
}

class IfThereisAnyNotes extends StatelessWidget {
  const IfThereisAnyNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: GestureDetector(
        onTap: () => Get.to(() => const Carnotescreen()),
        child: const Column(
          children: [
            Icon(
              Iconsax.note,
              size: 64,
            ),
            Text('You can add your notes from here!')
          ],
        ),
      ),
    );
  }
}

class RefreshData extends StatelessWidget {
  const RefreshData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HBlocIntegration(noteController)..add(HBlocLoad()),
      child: BlocBuilder(
        builder: (context, state) {
          return homeFunctions();
        },
      ),
    );
  }
}

class SearchBarHomeScreen extends StatelessWidget {
  const SearchBarHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorRadius: const Radius.circular(30),
      autocorrect: true,
      enableInteractiveSelection: true,
      cursorColor: Colors.white,
      style: const TextStyle(color: black),
      decoration: InputDecoration(
        suffixIcon: const Icon(Iconsax.search_normal, color: carGrey),
        labelText: 'What are you looking for?',
        labelStyle: const TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: const Color.fromARGB(255, 222, 222, 222),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
  }
}

class CarImageAndcarmakemodelhomeScreen extends StatelessWidget {
  const CarImageAndcarmakemodelhomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => HblocCarImageNameIntegration(CarController())
                ..add(HblocCarImageNameEventLoading()))
        ],
        child:
            BlocBuilder<HblocCarImageNameIntegration, HblocCarImageNameState>(
          builder: (context, state) {
            if (state is HblocCarImageNameLoading) {
              return Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: grey,
                  ),
                  width: widthOfButton.width,
                  height: widthOfButton.width / 1,
                  child: const Icon(
                    Icons.refresh,
                    color: Colors.transparent,
                  ),
                ),
                Positioned(
                  top: hAwText.height / 2.5,
                  left: 20,
                  child: Text(
                    'Loading....',
                    style: GoogleFonts.jua(fontSize: 23, color: white),
                  ),
                ),
              ]);
            } else if (state is HblocCarImageNameLoaded) {
              final networkImage = state.carsModel.carPic;
              final image = networkImage.isNotEmpty ? networkImage : '';
              return Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                      width: widthOfImages.width,
                      height: widthOfImages.height / 2,
                      fit: BoxFit.cover,
                      image: NetworkImage(image)),
                ),
                Positioned(
                  top: hAwText.height / 2.5,
                  left: 20,
                  child: Text(
                    '${state.carsModel.carMake.toUpperCase()} ${state.carsModel.carModel}',
                    style: GoogleFonts.aleo(fontSize: 23, color: white),
                  ),
                ),
              ]);
            } else if (state is HblocCarImageNameError) {
              Get.showSnackbar(GetSnackBar(
                  animationDuration: const Duration(seconds: 2),
                  duration: const Duration(seconds: 2),
                  maxWidth: widthOfButton.width / 1.3,
                  title: 'Error',
                  message: 'Something went wrong.',
                  margin: const EdgeInsets.only(bottom: 13),
                  shouldIconPulse: true,
                  borderRadius: 100,
                  barBlur: 50,
                  borderColor: black,
                  backgroundColor: redColor,
                  icon: const Icon(Icons.error)));
            }
            return Text('sgvsgagagafgsfgaEF');
          },
        ));
  }
}

class UsernameAnduserpicHomeScreen extends StatelessWidget {
  const UsernameAnduserpicHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PicUsernameBlocIntegration(ProfileController())
              ..add(HblocImageUsernameLoadedEvent()),
          )
        ],
        child: BlocBuilder<PicUsernameBlocIntegration, PicUsernameBlocState>(
            builder: (context, state) {
          if (state is HblocImageUsernameLoading) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Loading...",
                  style: GoogleFonts.aleo(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const CircularImage(
                  image: '',
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                  // isNetworkImage: networkImage.isNotEmpty,
                )
              ],
            );
          } else if (state is HblocImageUsernameLoaded) {
            final networkImage = state.userModel.userPic;
            final image = networkImage.isNotEmpty ? networkImage : '';
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hi ${state.userModel.fullname}, how's your car today?",
                  style: GoogleFonts.aleo(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                GestureDetector(
                    onTap: () => Get.to(() => const ProfileScreen()),
                    child: CircularImage(
                      image: image,
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                      isNetworkImage: networkImage.isNotEmpty,
                    )),
              ],
            );
          } else if (state is HblocImageUsernameError) {
            Get.snackbar('Oops!', 'Unable to find the data',
                colorText: white,
                backgroundColor: redColor,
                icon: const Icon(Icons.error));
          }
          return Text('fffffl-----------------------');
        }));
  }
}
