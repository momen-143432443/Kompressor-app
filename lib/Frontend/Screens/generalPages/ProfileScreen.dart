import 'package:animate_do/animate_do.dart';
import 'package:ecar/Backend/BLOCS/ProfilePageBloc/profiePageEvent.dart';
import 'package:ecar/Backend/BLOCS/ProfilePageBloc/profilePageIntegreation.dart';
import 'package:ecar/Backend/BLOCS/ProfilePageBloc/profilePageState.dart';
import 'package:ecar/Backend/BLOCS/homeBloc/HomeBlocItregration.dart';
import 'package:ecar/Backend/BLOCS/homeBloc/HomeblocEvent.dart';
import 'package:ecar/Backend/BLOCS/homeBloc/HomeblocState.dart';
import 'package:ecar/Backend/CarStructure/carController.dart';
import 'package:ecar/Backend/for_User/ProfileController.dart';
import 'package:ecar/Frontend/Screens/generalPages/SettingParts/settings.dart';
import 'package:ecar/Frontend/Screens/generalPages/UpdatePage.dart';
import 'package:ecar/Frontend/widgets.dart';
import 'package:ecar/main.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:ecar/tools/snacks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(children: [
          BackSetting(),
          userController(),
          EditProfile(),
          carListInfo(),
          const Divider(),
          DeleteCarInfo()
        ])),
      ),
    );
  }

  MultiBlocProvider carListInfo() {
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 290),
                    child: Container(
                      width: navigatorKey.currentContext?.width,
                      height: navigatorKey.currentContext!.height / 1.4,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22, top: 20),
                        child: FadeInLeft(
                          child: Text(
                            'Loading..',
                            style: GoogleFonts.jua(fontSize: 23, color: white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]);
            } else if (state is HblocCarImageNameLoaded) {
              final networkImage = state.carsModel.carPic;
              final image = networkImage.isNotEmpty ? networkImage : '';
              return Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                      width: widthOfImages.width,
                      height: widthOfImages.height / 2,
                      fit: BoxFit.cover,
                      image: NetworkImage(image)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 290),
                  child: Container(
                    width: navigatorKey.currentContext?.width,
                    height: navigatorKey.currentContext!.height / 2.5,
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(30)),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 24),
                        child: Column(
                          children: [
                            Text('${state.carsModel.nameYourCar}',
                                style: GoogleFonts.aleo(
                                    fontSize: 33, color: black)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FadeInLeft(
                                  child: Text(
                                    '${state.carsModel.carMake.toUpperCase()} ${state.carsModel.carModel}',
                                    style: GoogleFonts.aleo(
                                        fontSize: 23, color: black),
                                  ),
                                ),
                                FadeInRight(
                                  child: Text(
                                    state.carsModel.carYear,
                                    style: GoogleFonts.jua(
                                        fontSize: 23, color: black),
                                  ),
                                ),
                              ],
                            ),
                            editCarInformations,
                            const Divider(),
                            carNotes,
                            notesAvailable()
                          ],
                        ),
                      ),
                    ),
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
            return Container();
          },
        ));
  }

  MultiBlocProvider userController() {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ProfilePageIntegreation(ProfileController())
                ..add(UsernamePicProfileEventLoading()))
        ],
        child: BlocBuilder<ProfilePageIntegreation, ProfilePageState>(
          builder: (context, state) {
            if (state is UsernamePicProfileEventLoading) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        const CircularImage(
                          image: '',
                          width: 80,
                          height: 80,
                          // isNetworkImage: networkImage.isNotEmpty,
                        ),
                        Positioned(
                          left: 47,
                          bottom: 1,
                          child: SizedBox(
                              height: 20,
                              width: 20,
                              child: GestureDetector(
                                // onTap: () => controller.uploadProfilePic(),
                                child: const CircleAvatar(
                                  radius: 13,
                                  backgroundColor: blueColor,
                                ),
                              )),
                        ),
                      ],
                    ),
                    h,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 100),
                          child: Text(
                            'Loading...',
                            style: GoogleFonts.aleo(
                                fontWeight: FontWeight.w500, fontSize: 25),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            } else if (state is UsernamePicProfileStateLoaded) {
              final networkImage = state.userModel.userPic;
              final image = networkImage.isNotEmpty ? networkImage : '';
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CircularImage(
                          image: image,
                          width: 80,
                          height: 80,
                          isNetworkImage: networkImage.isNotEmpty,
                        ),
                        Positioned(
                          left: 47,
                          bottom: 1,
                          child: SizedBox(
                              height: 20,
                              width: 20,
                              child: GestureDetector(
                                onTap: () => controller.uploadProfilePic(),
                                child: const CircleAvatar(
                                  radius: 13,
                                  backgroundColor: blueColor,
                                ),
                              )),
                        ),
                      ],
                    ),
                    h,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FadeInLeft(
                          child: Text(
                            state.userModel.fullname,
                            style: GoogleFonts.aleo(
                                fontWeight: FontWeight.w500, fontSize: 25),
                          ),
                        ),
                        FadeInLeft(
                          child: Text(
                            state.userModel.email,
                            style: GoogleFonts.aleo(fontSize: 15),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            } else if (state is UsernamePicProfileStateError) {
              exceptions(state.err.toString());
            }
            return Container();
          },
        ));
  }
}

class DeleteCarInfo extends StatelessWidget {
  const DeleteCarInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(redColor)),
          onPressed: () {},
          child: Text("Delete car informations",
              style: GoogleFonts.aleo(fontSize: 13, color: white))),
    );
  }
}

class EditProfile extends StatelessWidget {
  const EditProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(blueColor)),
          onPressed: () {
            Get.to(() => const UpdatePage());
          },
          child: const Text(
            "Edit profile",
            style: TextStyle(color: white),
          )),
    );
  }
}

class BackSetting extends StatelessWidget {
  const BackSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => Get.back(), icon: const Icon(Iconsax.backward)),
        Center(
          child: Text("Profile",
              style: GoogleFonts.balooDa2(
                color: blueColor,
                fontWeight: FontWeight.w800,
              )),
        ),
        IconButton(
            onPressed: () {
              Get.off(() => const SettingsPage());
            },
            icon: const Icon(Iconsax.setting_2))
      ],
    );
  }
}
