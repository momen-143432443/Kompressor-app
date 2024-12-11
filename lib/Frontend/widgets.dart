import 'dart:io';
import 'dart:math' as math;
import 'package:ecar/Backend/BLOCS/ProfilePageBloc/profiePageEvent.dart';
import 'package:ecar/Backend/BLOCS/ProfilePageBloc/profilePageIntegreation.dart';
import 'package:ecar/Backend/BLOCS/ProfilePageBloc/profilePageState.dart';
import 'package:ecar/Backend/BLOCS/homeBloc/HomeBlocItregration.dart';
import 'package:ecar/Backend/BLOCS/homeBloc/HomeblocEvent.dart';
import 'package:ecar/Backend/BLOCS/homeBloc/HomeblocState.dart';
import 'package:ecar/Backend/CarStructure/carController.dart';
import 'package:ecar/Backend/EshopBackend/EShopController.dart';
import 'package:ecar/Backend/authenticationRespository/authenticationRespository.dart';
import 'package:ecar/Backend/carNotes.dart/carNoteScreen.dart';
import 'package:ecar/Backend/carNotes.dart/notesController.dart';
import 'package:ecar/Backend/carNotes.dart/notesModel.dart';
import 'package:ecar/Backend/carNotes.dart/notesRepository.dart';
import 'package:ecar/tools/snacks.dart';
import 'package:ecar/Backend/for_User/LoginController.dart';
import 'package:ecar/Backend/for_User/ProfileController.dart';
import 'package:ecar/Backend/for_User/SignUpController.dart';
import 'package:ecar/Backend/for_User/update_name_controller.dart';
import 'package:ecar/Backend/validator.dart';
import 'package:ecar/Frontend/Login&Signup&Logout/signIn.dart';
import 'package:ecar/Frontend/Login&Signup&Logout/signup.dart';
import 'package:ecar/Frontend/Screens/CarInfoPages/NewCarInfo.dart';
import 'package:ecar/Frontend/Screens/CarInfoPages/carInfo.dart';
import 'package:ecar/Frontend/Screens/generalPages/ExplorerTriggers/CarServices.dart';
import 'package:ecar/Frontend/Screens/generalPages/ExplorerTriggers/Eshop/Eshop.dart';
import 'package:ecar/Frontend/Screens/generalPages/ExplorerTriggers/KWallet.dart';
import 'package:ecar/Frontend/Screens/generalPages/ExplorerTriggers/TelephonePage.dart';
import 'package:ecar/Frontend/Screens/generalPages/ProfileScreen.dart';
import 'package:ecar/Frontend/Screens/generalPages/RsesndPasswordScreen.dart';
import 'package:ecar/Frontend/Screens/generalPages/SettingParts/Language.dart';
import 'package:ecar/Frontend/Screens/generalPages/SettingParts/MyActivties.dart';
import 'package:ecar/Frontend/Screens/generalPages/UpdatePage.dart';
import 'package:ecar/Frontend/Screens/generalPages/SettingParts/settings.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecar/main.dart';
import 'package:animate_do/animate_do.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:intl/intl.dart';
import 'package:uicons/uicons.dart';
import 'package:card_loading/card_loading.dart';

/////////////////////////////////////////////////////////////
/////[GeneralFunctionCanuUseInwWholeFlutterFiles]///////////
///////////////////////////////////////////////////////////
SizedBox h = const SizedBox(width: 4);
SizedBox sizedBox = const SizedBox(width: 25);
SizedBox hSpace = const SizedBox(height: 5);
SizedBox hSpacE = const SizedBox(height: 15);
SizedBox hSPACE = const SizedBox(height: 25);
SizedBox height = const SizedBox(height: 220);
SizedBox height1 = const SizedBox(height: 70);
SizedBox width = const SizedBox(width: 4);
SizedBox width2 = const SizedBox(width: 6);
SizedBox w = const SizedBox(width: 6);
SizedBox h2 = const SizedBox(height: 6);
SizedBox size = const SizedBox(height: 10);
final email = AuthenticationRespository.instance.authUser;
EdgeInsets veAho = const EdgeInsets.symmetric(horizontal: 10, vertical: 20);
EdgeInsets appSym = const EdgeInsets.symmetric(horizontal: 10);
final widthOfButton = MediaQuery.of(navigator!.context).size;
final widthOfImages = MediaQuery.of(navigator!.context).size;
final hAwText = MediaQuery.of(navigator!.context).size;
final container = MediaQuery.of(navigator!.context).size;
final T = MediaQuery.of(navigator!.context).size;
Divider div = const Divider();

TextEditingController homeInfos = TextEditingController();
final carController = Get.put(CarController());
final Notesrepository notesrepository = Get.put(Notesrepository());
final noteController = Get.put(Notescontroller());
final signUpController = Get.put(SignUpController());
final controller = Get.put(ProfileController());
final updateController = Get.put(UpdateNameController());
final loginController = Get.put(LoginController());
final eShopController = Get.put(Eshopcontroller());

class EmailVerificationcode extends StatefulWidget {
  const EmailVerificationcode({super.key});

  @override
  State<EmailVerificationcode> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EmailVerificationcode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(90), color: grey),
      child: const Row(
        children: [
          Icon(
            Icons.mail_outline_rounded,
            size: 60,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Email",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text("Reset via Email verification")
            ],
          )
        ],
      ),
    );
  }
}

class QuickSignIn {
  final facebook = Container(
    height: 30,
    width: 30,
    decoration: BoxDecoration(
        color: blueColor, borderRadius: BorderRadius.circular(100)),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.facebook,
          color: white,
        ),
      ],
    ),
  );

  final google = Container(
    height: 30,
    width: 30,
    decoration: BoxDecoration(
        color: redColor, borderRadius: BorderRadius.circular(100)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.google,
          color: white,
        ),
        width,
      ],
    ),
  );

  final apple = Container(
    height: 30,
    width: 30,
    decoration:
        BoxDecoration(color: black, borderRadius: BorderRadius.circular(100)),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.apple,
          color: white,
        ),
      ],
    ),
  );
}

///////////////////////////////////////////////////////
/////////////////////[Signup]/////////////////////////
//////////////////////////////////////////////////////

final welcomeApp = Text(
  'Welcome to kompressor',
  style: GoogleFonts.jua(fontSize: 30, color: blueColor),
);
final desc = Text(
  'Which you build your car and manage it',
  style: GoogleFonts.jua(),
);

final insertName = Center(
  child: Text(
    'Insert your name here to fetch it later',
    style: GoogleFonts.jua(),
  ),
);

final nameField = TextFormField(
  controller: signUpController.fullName,
  cursorRadius: const Radius.circular(3),
  autocorrect: true,
  enableInteractiveSelection: true,
  cursorColor: Colors.white,
  style: const TextStyle(color: black),
  decoration: InputDecoration(
    suffixIcon: const Icon(Icons.person, color: blueColor),
    labelText: 'Full name',
    labelStyle: const TextStyle(color: black),
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    // fillColor: const Color.fromARGB(255, 222, 222, 222),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
  ),
);

final nameButton = ElevatedButton(
    onPressed: () => signUpController.signUp(), child: const Text('Continue'));

///////////////////////////////////////////////////////
/////////////////////[Signin]/////////////////////////
//////////////////////////////////////////////////////
final k = Text("K", style: GoogleFonts.jua(fontSize: 100, color: blueColor));

final emailSignInTextField = TextFormField(
  controller: loginController.email,
  cursorRadius: const Radius.circular(3),
  autocorrect: true,
  enableInteractiveSelection: true,
  validator: (value) => ValidatorExe.validateEmail(value),
  cursorColor: Colors.white,
  style: const TextStyle(color: black),
  decoration: InputDecoration(
    suffixIcon: const Icon(Icons.email, color: blueColor),
    labelText: 'Email',
    labelStyle: const TextStyle(color: black),
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
  ),
);

final passwordSignInTextField = TextFormField(
  controller: loginController.password,
  cursorRadius: const Radius.circular(3),
  autocorrect: true,
  obscureText: controller.hidePassword.value,
  enableInteractiveSelection: true,
  cursorColor: Colors.white,
  style: const TextStyle(color: black),
  decoration: InputDecoration(
    suffixIcon: IconButton(
        onPressed: () =>
            controller.hidePassword.value = !controller.hidePassword.value,
        icon: controller.hidePassword.value
            ? const Icon(
                Iconsax.eye_slash,
                color: blueColor,
              )
            : const Icon(
                Iconsax.eye,
                color: blueColor,
              )),
    labelText: 'Password',
    labelStyle: const TextStyle(color: black),
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
  ),
);

final remeberMeAndForgetPassword = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(
              () => Checkbox(
                  activeColor: green,
                  value: loginController.remeberMe.value,
                  onChanged: (value) {
                    loginController.remeberMe.value =
                        !loginController.remeberMe.value;
                  }),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                "Remember me.",
                style: TextStyle(color: black),
              ),
            )
          ],
        ),
      ],
    ),
    GestureDetector(
      onTap: () => Get.to(() => const ForgetPasswordscreen(
            email: '',
          )),
      child: Text("Forget password ?",
          style: GoogleFonts.balooDa2(
            color: blueColor,
            fontWeight: FontWeight.w800,
          )),
    ),
  ],
);

final loginButton = Center(
  child: ElevatedButton(
      style: const ButtonStyle(
          backgroundColor:
              WidgetStatePropertyAll(Color.fromARGB(255, 9, 78, 168))),
      onPressed: () async => await loginController.signIn(),
      child: Text("Save and continue",
          style: GoogleFonts.balooDa2(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ))),
);

final quickSign = Column(
  children: [
    const Text(
      "For quick sign",
      style: TextStyle(color: blueColor, fontSize: 12),
    ),
    h2,
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        QuickSignIn().facebook,
        width2,
        GestureDetector(
            onTap: () async => await loginController.googleSignIn(),
            child: QuickSignIn().google),
        width2,
        QuickSignIn().apple
      ],
    )
  ],
);

const helpCneter = Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Icon(
      Icons.help_center_rounded,
      color: black,
    ),
    Text(
      "For the help center",
      style: TextStyle(color: black),
    ),
  ],
);

final youDontHaveAnAccountPressToSignUp = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    const Text(
      "You don't have an account, press to",
      style: TextStyle(color: black),
    ),
    TextButton(
        child: const Text(
          "sign up",
          style: TextStyle(color: black),
        ),
        onPressed: () => Get.to(() => const SignUp())),
  ],
);

///////////////////////////////////////////////////////
/////////////////////[Signup]/////////////////////////
/////////////////////////////////////////////////////

final kom = Text("K", style: GoogleFonts.jua(fontSize: 100, color: blueColor));

final fullnameTextField = TextFormField(
  controller: signUpController.fullName,
  // validator: (value) {
  //   setState(() => ValidatorExe.validateEmail(value));
  //   return null;
  // },
  cursorRadius: const Radius.circular(3),
  autocorrect: true,
  enableInteractiveSelection: true,
  cursorColor: Colors.white,
  style: const TextStyle(color: black),
  decoration: InputDecoration(
    suffixIcon: const Icon(Icons.person, color: blueColor),
    labelText: 'Full name',
    labelStyle: const TextStyle(color: black),
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    // fillColor: const Color.fromARGB(255, 222, 222, 222),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
  ),
);

final emailSignUpTextField = TextFormField(
  controller: signUpController.email,
  cursorRadius: const Radius.circular(3),
  autocorrect: true,
  enableInteractiveSelection: true,
  cursorColor: Colors.white,
  style: const TextStyle(color: black),
  decoration: InputDecoration(
    suffixIcon: const Icon(Icons.email, color: blueColor),
    labelText: 'Email',
    labelStyle: const TextStyle(color: black),
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    // fillColor: const Color.fromARGB(255, 222, 222, 222),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
  ),
);

final passwordSignUpTextField = TextFormField(
  controller: signUpController.password,
  cursorRadius: const Radius.circular(3),
  autocorrect: true,
  obscureText: controller.hidePassword.value,
  enableInteractiveSelection: true,
  cursorColor: Colors.white,
  style: const TextStyle(color: black),
  decoration: InputDecoration(
    suffixIcon: IconButton(
        onPressed: () =>
            controller.hidePassword.value = !controller.hidePassword.value,
        icon: controller.hidePassword.value
            ? const Icon(
                Iconsax.eye_slash,
                color: blueColor,
              )
            : const Icon(
                Iconsax.eye,
                color: blueColor,
              )),
    labelText: 'Password',
    labelStyle: const TextStyle(color: black),
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    // fillColor: const Color.fromARGB(255, 222, 222, 222),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
  ),
);

final phoneNum = TextFormField(
  controller: signUpController.phoneNum,
  keyboardType: TextInputType.phone,
  cursorRadius: const Radius.circular(3),
  autocorrect: true,
  enableInteractiveSelection: true,
  cursorColor: Colors.white,
  style: const TextStyle(color: black),
  decoration: InputDecoration(
    suffixIcon: const Icon(Iconsax.call, color: blueColor),
    labelText: 'Phone number',
    labelStyle: const TextStyle(color: black),
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    // fillColor: const Color.fromARGB(255, 222, 222, 222),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
  ),
);

final signUpButton = Center(
  child: ElevatedButton(
      style: const ButtonStyle(
          backgroundColor:
              WidgetStatePropertyAll(Color.fromARGB(255, 9, 78, 168))),
      onPressed: () async => await signUpController.signUp(),
      child: Text("Save and continue",
          style: GoogleFonts.balooDa2(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ))),
);

final quickRegister = Column(
  children: [
    const Text(
      "For quick registration",
      style: TextStyle(color: blueColor, fontSize: 12),
    ),
    h2,
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        QuickSignIn().facebook,
        width2,
        GestureDetector(
            onTap: () async => await signUpController.googleSignUp(),
            child: QuickSignIn().google),
        width2,
        QuickSignIn().apple
      ],
    )
  ],
);

final backToSignIn = TextButton(
    onPressed: () => Get.back(),
    child: const Text(
      "Do you have an account, press to sign in",
      style: TextStyle(color: black),
    ));

///////////////////////////////////////////////////////
//////////////////[profileScreen]////////////////////
//////////////////////////////////////////////////////

final backSetting = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.backward)),
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

userController() => MultiBlocProvider(
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

final editProfile = Center(
  child: ElevatedButton(
      style:
          const ButtonStyle(backgroundColor: WidgetStatePropertyAll(blueColor)),
      onPressed: () {
        Get.to(() => const UpdatePage());
      },
      child: const Text(
        "Edit profile",
        style: TextStyle(color: white),
      )),
);

final editCarInformations = ElevatedButton(
  onPressed: () => Get.off(() => const NewCarInfo()),
  style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(blueColor)),
  child: const Text('Edit car informations', style: TextStyle(color: white)),
);

carListInfo() => MultiBlocProvider(
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

final carNotes = SingleChildScrollView(
  child: Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 250),
        child: Text(
          'Car notes',
          style: GoogleFonts.aleo(fontSize: 20, color: black),
        ),
      ),
      // notesAvailable
    ],
  ),
);

final deleteCarInfo = Center(
  child: ElevatedButton(
      style:
          const ButtonStyle(backgroundColor: WidgetStatePropertyAll(redColor)),
      onPressed: () {},
      child: Text("Delete car informations",
          style: GoogleFonts.aleo(fontSize: 13, color: white))),
);

//////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////
///////////////[PicTrigger]//////////////////
////////////////////////////////////////////

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.width = 50,
    this.height = 50,
    this.overLayout,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overLayout;
  final Color? backgroundColor;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: BoxFit.cover, color: overLayout, imageUrl: image)
              : Image(
                  height: 100,
                  width: 100,
                  fit: fit,
                  image: isNetworkImage
                      ? NetworkImage(image)
                      : const AssetImage('assets/profileIcon.webp')
                          as ImageProvider,
                  color: overLayout,
                ),
        ),
      ),
    );
  }
}

class UploadImageSign extends StatelessWidget {
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overLayout;
  final Color? backgroundColor;
  final double height, width;
  const UploadImageSign({
    super.key,
    this.width = 200,
    this.height = 100,
    this.overLayout,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
  });

  @override
  Widget build(BuildContext context) {
    File? carImg;
    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: isNetworkImage
            ? Image.file(carImg!.path as File)
            : const Icon(
                Icons.add,
                color: grey,
              ),
      ),
    );
  }
}

class CarUploadPic extends StatelessWidget {
  const CarUploadPic({
    super.key,
    this.width = 200,
    this.height = 100,
    this.overLayout,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
  });
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overLayout;
  final Color? backgroundColor;
  final double height, width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: BoxFit.cover, color: overLayout, imageUrl: image)
              : SizedBox(
                  height: widthOfImages.height / 2,
                  child: const Icon(
                    Icons.add,
                    color: white,
                  ),
                )),
    );
  }
}
//////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

const textPic = Text(
  "You can upload your image now!",
  style: TextStyle(fontSize: 24),
);

uploadPicSignUp() => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PicUsernameBlocIntegration(ProfileController())
              ..add(HblocImageUsernameLoadedEvent()),
          )
        ],
        child: BlocBuilder<PicUsernameBlocIntegration, PicUsernameBlocState>(
            builder: (context, state) {
          if (state is HblocImageUsernameLoading) {
            return SizedBox(
                width: 120,
                height: 120,
                child: Center(
                    child: LoadingAnimationWidget.waveDots(
                        color: blueColor, size: 55)));
          } else if (state is HblocImageUsernameLoaded) {
            final networkImage = controller.user.value.userPic;
            final image = networkImage.isNotEmpty ? networkImage : '';
            return GestureDetector(
              onTap: () async => await controller.uploadProfilePic(),
              child: SizedBox(
                  width: widthOfImages.width,
                  height: widthOfImages.height / 1.2,
                  child: UploadImageSign(
                    image: image,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 50,
                  )),
            );
          }
          return Container();
        }));

final naviTextBotton = Padding(
  padding: const EdgeInsets.only(left: 180),
  child: TextButton(
      style:
          const ButtonStyle(backgroundColor: WidgetStatePropertyAll(blueColor)),
      onPressed: () {
        navigatorKey.currentState?.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const CarInfo(),
            ),
            (route) => false);
      },
      child: const Text(
        "Save and Countinue",
        style: TextStyle(color: white),
      )),
);

//================================================//
///=============[HomeScreen]=====================//
//==============================================//
homeFunctions() => Column(
      children: [
        Column(
          children: [
            usernameAnduserpicHomeScreen,
            hSpace,
            carImageAndcarmakemodelhomeScreen(),
            hSpace,
            searchBarHomeScreen,
            hSpace,
            notesAvailable()
          ],
        ),
      ],
    );

final refreshBloc = BlocProvider(
  create: (context) => HBlocIntegration(noteController)..add(HBlocLoad()),
  child: BlocBuilder(
    builder: (context, state) {
      return homeFunctions();
    },
  ),
);

final homeInfo = Column(
  children: [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        autocorrect: true,
        enableInteractiveSelection: true,
        controller: homeInfos,
        cursorColor: Colors.white,
        style: const TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
        decoration: InputDecoration(
          suffixIcon: const Icon(Iconsax.search_favorite,
              color: Color.fromARGB(255, 126, 126, 126)),
          labelText: "You looking for something ?",
          labelStyle:
              const TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: const Color.fromARGB(255, 222, 222, 222),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22.0),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
        ),
      ),
    ),
  ],
);

final usernameAnduserpicHomeScreen = MultiBlocProvider(
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
              style:
                  GoogleFonts.aleo(fontWeight: FontWeight.w500, fontSize: 15),
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
              style:
                  GoogleFonts.aleo(fontWeight: FontWeight.w500, fontSize: 15),
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

carImageAndcarmakemodelhomeScreen() => MultiBlocProvider(
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

final searchBarHomeScreen = TextFormField(
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

final ifThereisAnyNotes = Padding(
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

notesAvailable() => MultiBlocProvider(
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
            return ifThereisAnyNotes;
          } else if (stateN is HBlocError) {
            oops;
          }
          return Container();
        },
      ),
    );

final homeFloatingActionButton = SpeedDial(
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

//////////////////////////////////////////////////////////////////////
///=====================[SettingsScreen]==========================///
////////////////////////////////////////////////////////////////////

final settingText = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.backward)),
    Text('Settings', style: GoogleFonts.aleo(fontSize: 23, color: black)),
    Icon(
      Iconsax.backward,
      color: Colors.transparent,
    )
  ],
);

final forUserText =
    Text('For user', style: GoogleFonts.aleo(fontSize: 15, color: black));

final myActivities = GestureDetector(
  onTap: () => Get.to(() => const MyActivities()),
  child: Row(
    children: [
      const Icon(
        Iconsax.activity,
        color: black,
      ),
      width2,
      const Text(
        'My activities',
        style: TextStyle(color: black),
      )
    ],
  ),
);

final emailNotifications = GestureDetector(
  onTap: () {},
  child: Row(
    children: [
      Stack(children: [
        const Icon(
          Iconsax.notification_1,
          color: black,
        ),
        Positioned(
          top: 6,
          right: 5,
          child: Icon(
            UIcons.regularRounded.e,
            color: black,
            size: 10,
          ),
        ),
      ]),
      width2,
      const Text(
        'Email notification',
        style: TextStyle(color: black),
      )
    ],
  ),
);

final deviceText =
    Text('Device', style: GoogleFonts.aleo(fontSize: 15, color: black));

final language = GestureDetector(
  onTap: () => Get.to(() => const Language()),
  child: Row(
    children: [
      const Icon(
        Iconsax.language_square,
        color: black,
      ),
      width2,
      const Text(
        'Language',
        style: TextStyle(color: black),
      )
    ],
  ),
);

final devicePermission = GestureDetector(
  onTap: () {},
  child: Row(
    children: [
      const Icon(
        Icons.phone_iphone_outlined,
        color: black,
      ),
      width2,
      const Text(
        'Device permission',
        style: TextStyle(color: black),
      )
    ],
  ),
);

final protectionAndSupportText = Text('Protection and support',
    style: GoogleFonts.aleo(fontSize: 15, color: black));

final privacyAndSecurity = GestureDetector(
  onTap: () {},
  child: Row(
    children: [
      const Icon(
        Iconsax.security,
        color: black,
      ),
      width2,
      const Text(
        'Praivcy and Security',
        style: TextStyle(color: black),
      )
    ],
  ),
);

final reportCenter = GestureDetector(
  onTap: () {},
  child: Row(
    children: [
      const Icon(
        Icons.help_outline_outlined,
        color: black,
      ),
      width2,
      const Text(
        'Report center',
        style: TextStyle(color: black),
      )
    ],
  ),
);

final about = GestureDetector(
  onTap: () {},
  child: Row(
    children: [
      const Icon(
        Icons.error_outline,
        color: black,
      ),
      width2,
      const Text(
        'About',
        style: TextStyle(color: black),
      )
    ],
  ),
);

final accountText =
    Text('Account', style: GoogleFonts.aleo(fontSize: 15, color: black));

final logout = GestureDetector(
  onTap: () {
    AuthenticationRespository.instance.logout();
    Get.offAll(() => const SignIn());
  },
  child: Row(
    children: [
      const Icon(
        Iconsax.logout,
        color: redColor,
      ),
      width2,
      const Text(
        'Sign out',
        style: TextStyle(color: redColor),
      )
    ],
  ),
);

final deleteAccount = GestureDetector(
  onTap: () => controller.deleteAccountWearing(),
  child: Row(
    children: [
      const Icon(Iconsax.profile_delete, color: redColor),
      width2,
      const Text('Delete account', style: TextStyle(color: redColor))
    ],
  ),
);

//////////////////////////////////////////////////////////////////////
//////////////////////////[MyActivities]/////////////////////////////
////////////////////////////////////////////////////////////////////

final myActivitiesText = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.backward)),
    Text('My Activities', style: GoogleFonts.aleo(fontSize: 23, color: black)),
    Icon(
      Iconsax.backward,
      color: Colors.transparent,
    )
  ],
);

final yourNoteAndArchive = Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    SizedBox(
      width: widthOfButton.width / 3,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              backgroundColor: WidgetStatePropertyAll(blueColor)),
          onPressed: () {},
          child: const Text(
            "Your notes",
            style: TextStyle(color: white),
          )),
    ),
    h,
    SizedBox(
      width: widthOfButton.width / 3,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              backgroundColor: WidgetStatePropertyAll(blueColor)),
          onPressed: () {},
          child: const Text(
            "Archive",
            style: TextStyle(color: white),
          )),
    ),
  ],
);

/////////////////////////////////////////////////////////////////////
/////////////////////////[Language]//////////////////////////////////
////////////////////////////////////////////////////////////////////

final languageText = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.backward)),
    Text('Languages', style: GoogleFonts.aleo(fontSize: 23, color: black)),
    Icon(
      Iconsax.backward,
      color: Colors.transparent,
    )
  ],
);

final englishAndArabic = SizedBox(
  width: widthOfButton.width / 1.1,
  child: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('English', style: TextStyle(color: black, fontSize: 23)),
          Radio(
            value: false,
            groupValue: {},
            onChanged: (value) {},
          )
        ],
      ),
      size,
      size,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Arabic', style: TextStyle(color: black, fontSize: 23)),
          Radio(
            value: false,
            groupValue: {},
            onChanged: (value) {},
          )
        ],
      )
    ],
  ),
);

/////////////////////////////////////////////////////////////////////
/////////////////////////[carNoteScareen]///////////////////////////
///////////////////////////////////////////////////////////////////

final backIconAndNoteText = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.backward)),
    Text('Car notes', style: GoogleFonts.jua(color: black)),
    const Icon(Icons.cabin, color: Colors.transparent)
  ],
);

const noteLabel = Text(
  "You can now add note that you need to remember if you need something for your car.",
  style: TextStyle(color: carGrey, fontSize: 10),
);

final subjectFieldText = TextFormField(
  textCapitalization: TextCapitalization.sentences,
  controller: noteController.subjectText,
  cursorRadius: const Radius.circular(3),
  enableInteractiveSelection: true,
  cursorColor: Colors.white,
  style: const TextStyle(color: black),
  maxLength: 40,
  decoration: InputDecoration(
    suffixIcon: const Icon(Iconsax.note, color: carGrey),
    labelText: 'Subject',
    labelStyle: const TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    fillColor: const Color.fromARGB(255, 222, 222, 222),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
  ),
);

final titleFieldText = TextFormField(
  maxLength: 100,
  textCapitalization: TextCapitalization.sentences,
  controller: noteController.titleText,
  cursorRadius: const Radius.circular(3),
  enableInteractiveSelection: true,
  cursorColor: Colors.white,
  style: const TextStyle(color: black),
  decoration: InputDecoration(
    suffixIcon: const Icon(Iconsax.note, color: carGrey),
    labelText: 'Title',
    labelStyle: const TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    fillColor: const Color.fromARGB(255, 222, 222, 222),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
  ),
);

final noteButton = Container(
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
  width: widthOfButton.width / 1.2,
  child: TextButton(
      style:
          const ButtonStyle(backgroundColor: WidgetStatePropertyAll(blueColor)),
      onPressed: () => noteController.storeNotesData(),
      child: const Text(
        "post",
        style: TextStyle(color: white),
      )),
);

/////////////////////////////////////////////////////////////////////
/////////////////////////[ReAuthpage]///////////////////////////////
///////////////////////////////////////////////////////////////////

final backButton = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    IconButton(
        onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left)),
    Center(
        child: Text(
      "Delete your account",
      style: GoogleFonts.balooDa2(
        fontWeight: FontWeight.w800,
      ),
    )),
    Icon(UIcons.boldRounded.document, color: Colors.transparent)
  ],
);

const wearingText = Text(
  "Use real name for easy verfication, this name will appear on several pages.",
  style: TextStyle(color: carGrey),
);

final verfiyEmailField = TextFormField(
  controller: controller.verfiyEmail,
  cursorRadius: const Radius.circular(3),
  autocorrect: true,
  enableInteractiveSelection: true,
  cursorColor: Colors.white,
  style: const TextStyle(color: black),
  decoration: InputDecoration(
    labelText: 'Email',
    labelStyle: const TextStyle(color: black),
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
  ),
);

final verfiyPasswordField = Obx(
  () => TextFormField(
    controller: controller.verfiyPassword,
    cursorRadius: const Radius.circular(3),
    autocorrect: true,
    obscureText: controller.hidePassword.value,
    enableInteractiveSelection: true,
    cursorColor: Colors.white,
    style: const TextStyle(color: black),
    decoration: InputDecoration(
      suffixIcon: IconButton(
          onPressed: () =>
              controller.hidePassword.value = !controller.hidePassword.value,
          icon: controller.hidePassword.value
              ? const Icon(
                  Iconsax.eye_slash,
                  color: blueColor,
                )
              : const Icon(
                  Iconsax.eye,
                  color: blueColor,
                )),
      labelText: 'Password',
      labelStyle: const TextStyle(color: black),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
  ),
);

final reauthButton = Container(
  width: widthOfButton.width / 1.2,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
  child: ElevatedButton(
    style:
        const ButtonStyle(backgroundColor: WidgetStatePropertyAll(blueColor)),
    onPressed: () => controller.reAuthenticationEmailAndPassword(),
    child: const Text(
      'Delete',
      style: TextStyle(color: white),
    ),
  ),
);

/////////////////////////////////////////////////////////////////////
/////////////////////////[UpdatePage]///////////////////////////////
///////////////////////////////////////////////////////////////////

final updateBackButton = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.backward)),
    Center(
        child: Text(
      "Update the name",
      style: GoogleFonts.balooDa2(
        fontWeight: FontWeight.w800,
      ),
    )),
    Icon(UIcons.boldRounded.document, color: Colors.transparent)
  ],
);
const updateLabel = Text(
  "Use real name for easy verfication, this name will appear on several pages.",
  style: TextStyle(color: carGrey),
);

final upddateTextField = TextFormField(
  controller: updateController.name,
  expands: false,
  decoration: InputDecoration(
      labelText: 'Full name', prefixIcon: Icon(UIcons.regularRounded.user)),
);

final updateButton = Container(
  width: widthOfButton.width / 1.2,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
  child: ElevatedButton(
      style:
          const ButtonStyle(backgroundColor: WidgetStatePropertyAll(blueColor)),
      onPressed: () async => await updateController.updateName(),
      child: const Text(
        'Save',
        style: TextStyle(color: white),
      )),
);

/////////////////////////////////////////////////////////////////////
/////////////////////////[CarInfos]/////////////////////////////////
///////////////////////////////////////////////////////////////////

////////////////////
///[CarInfo]///
//////////////////
const addCarText = Padding(
  padding: EdgeInsets.symmetric(horizontal: 15),
  child: Text(
    "Add a car",
    style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
  ),
);

const carMakeText = Padding(
  padding: EdgeInsets.symmetric(horizontal: 20),
  child: Text(
    "Make",
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  ),
);

final carMakeTextField = Center(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextFormField(
      controller: carController.carMake,
      cursorRadius: const Radius.circular(3),
      autocorrect: true,
      enableInteractiveSelection: true,
      cursorColor: Colors.white,
      style: const TextStyle(color: black),
      decoration: InputDecoration(
        suffixIcon: const Icon(Iconsax.car, color: carGrey),
        labelText: 'Car make',
        labelStyle: const TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: const Color.fromARGB(255, 222, 222, 222),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    ),
  ),
);

const carModelText = Padding(
  padding: EdgeInsets.symmetric(horizontal: 20),
  child: Text(
    "Model",
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  ),
);

final carModelTextField = Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: TextFormField(
    controller: carController.carModel,
    cursorRadius: const Radius.circular(3),
    autocorrect: true,
    enableInteractiveSelection: true,
    cursorColor: Colors.white,
    style: const TextStyle(color: black),
    decoration: InputDecoration(
      suffixIcon: const Icon(Iconsax.car, color: carGrey),
      labelText: 'Car model',
      labelStyle: const TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: const Color.fromARGB(255, 222, 222, 222),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
  ),
);

const carYearText = Padding(
  padding: EdgeInsets.symmetric(horizontal: 20),
  child: Text(
    "Year",
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  ),
);

final carYearTextField = Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: TextFormField(
    controller: carController.carYear,
    cursorRadius: const Radius.circular(3),
    autocorrect: true,
    enableInteractiveSelection: true,
    cursorColor: Colors.white,
    style: const TextStyle(color: black),
    decoration: InputDecoration(
      suffixIcon: const Icon(Iconsax.car, color: carGrey),
      labelText: 'Car Year',
      labelStyle: const TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: const Color.fromARGB(255, 222, 222, 222),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
  ),
);

const carNameText = Padding(
  padding: EdgeInsets.symmetric(horizontal: 20),
  child: Text(
    "Car name",
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  ),
);

final carNameTextField = Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Center(
    child: TextFormField(
      controller: carController.nameUrCar,
      autocorrect: true,
      enableInteractiveSelection: true,
      cursorColor: Colors.white,
      style: const TextStyle(color: black),
      decoration: InputDecoration(
        suffixIcon:
            const Icon(Iconsax.car, color: Color.fromARGB(255, 126, 126, 126)),
        labelText: 'Name your car',
        labelStyle: const TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: const Color.fromARGB(255, 222, 222, 222),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    ),
  ),
);

final carNextPageButton = Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      width: T.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(33)),
      child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 9, 78, 168))),
          onPressed: () => carController.storeCarData(),
          child: Text("Save and continue",
              style: GoogleFonts.balooDa2(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ))),
    ));

///////////////////
///[NewCarInfo]///
/////////////////

const updateCarInfo = Padding(
  padding: EdgeInsets.symmetric(horizontal: 15),
  child: Text(
    "Update your car",
    style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
  ),
);

const alertUpdate = Text(
    style: TextStyle(fontSize: 10),
    'Please insert all car information and the new specefic information to ensure update it');

final updateCarButton = Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      width: T.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(33)),
      child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 9, 78, 168))),
          onPressed: () async => await carController.updateCarControl(),
          child: Text("Save and continue",
              style: GoogleFonts.balooDa2(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ))),
    ));

////////////////////////////////////////////////
//////////////[ExplorePage]////////////////////
//////////////////////////////////////////////

///==================================///
///============[Explore]=============///
///==================================///

final ads = FadeInDown(
  delay: const Duration(seconds: 5),
  child: Center(
    child: SizedBox(
      height: widthOfButton.height / 5,
      width: widthOfButton.width / 1.3,
      child: Card(
        color: milkyblue,
        child: Stack(children: [
          Positioned(
              right: 24,
              child: Icon(
                Iconsax.folder,
                size: 200,
                color: white.withOpacity(0.1),
              )),
          Center(
            child: Text('Advertisements',
                style: GoogleFonts.aleo(
                    fontWeight: FontWeight.w500, fontSize: 25, color: white)),
          ),
        ]),
      ),
    ),
  ),
);

final services = GridView.builder(
  shrinkWrap: true,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 4.0,
    mainAxisSpacing: 4.0,
  ),
  itemCount: 4,
  itemBuilder: (context, index) {
    if (index == 0) {
      return FadeInLeft(
        child: GestureDetector(
          onTap: () => Get.to(() => const TelephonePage()),
          child: Card(
              color: grey,
              child: Stack(
                children: [
                  Positioned(
                      right: 24,
                      child: Icon(
                        Icons.phone,
                        size: 200,
                        color: black.withOpacity(0.1),
                      )),
                  Center(
                    child: Text('TelePhones',
                        style: GoogleFonts.aleo(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: black)),
                  ),
                ],
              )),
        ),
      );
    } else if (index == 1) {
      return FadeInRight(
        delay: const Duration(seconds: 2),
        child: GestureDetector(
          onTap: () => Get.to(() => const EShop()),
          child: Card(
            color: blueColor,
            child: Stack(children: [
              Positioned(
                  right: 24,
                  child: Icon(
                    Iconsax.shop,
                    size: 200,
                    color: white.withOpacity(0.1),
                  )),
              Center(
                child: Text('E-shop',
                    style: GoogleFonts.aleo(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: white)),
              ),
            ]),
          ),
        ),
      );
    } else if (index == 2) {
      return FadeInLeft(
        delay: const Duration(seconds: 1),
        child: GestureDetector(
          onTap: () => Get.to(() => const CarServices()),
          child: Card(
            color: green,
            child: Stack(children: [
              Positioned(
                  right: 24,
                  child: Icon(
                    Iconsax.discount_circle,
                    size: 200,
                    color: white.withOpacity(0.1),
                  )),
              Center(
                child: Text('Car services',
                    style: GoogleFonts.aleo(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: white)),
              ),
            ]),
          ),
        ),
      );
    } else if (index == 3) {
      return FadeInRight(
        delay: const Duration(seconds: 3),
        child: GestureDetector(
          onTap: () {
            print('Go to news');
          },
          child: Card(
            color: black,
            child: Stack(children: [
              Positioned(
                  right: 24,
                  child: Icon(
                    UIcons.regularRounded.paper_plane,
                    size: 200,
                    color: white.withOpacity(0.1),
                  )),
              Center(
                child: Text('News',
                    style: GoogleFonts.aleo(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: white)),
              ),
            ]),
          ),
        ),
      );
    }
    return const Text('No Data');
  },
);

final payment = FadeInUp(
  delay: const Duration(seconds: 4),
  child: Center(
    child: GestureDetector(
      onTap: () => Get.to(() => const KWallet()),
      child: SizedBox(
        height: widthOfButton.height / 5,
        width: widthOfButton.width / 1.3,
        child: Card(
          color: orange,
          child: Center(
            child: Stack(children: [
              Text(
                'K',
                style: GoogleFonts.jua(fontSize: 100, color: blueColor),
              ),
              Transform.rotate(
                angle: math.pi / 9,
                child: Text(
                  "Wallet",
                  style: GoogleFonts.jua(fontSize: 72, color: white),
                ),
              )
            ]),
          ),
        ),
      ),
    ),
  ),
);

///==================================///
///==========[TelephonesPage]========///
///==================================///
final telephoneBack = Row(
  children: [
    IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.backward)),
    Text(
      'Telephones & customer care',
      style: GoogleFonts.aleo(
          fontWeight: FontWeight.w500, fontSize: 23, color: black),
    )
  ],
);

const phoneText = Center(
  child: Text("Phones"),
);

final forCustomerService = Padding(
  padding: appSym,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'For customer service',
        style: GoogleFonts.aleo(fontWeight: FontWeight.w500, color: black),
      ),
      SizedBox(
        width: widthOfButton.width / 3,
        child: ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(blueColor)),
            onPressed: () {},
            child: const Text(
              '+962790006',
              style: TextStyle(color: white),
            )),
      )
    ],
  ),
);

final contactReception = Padding(
  padding: appSym,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Contact with the Reception',
        style: GoogleFonts.aleo(fontWeight: FontWeight.w500, color: black),
      ),
      SizedBox(
        width: widthOfButton.width / 3,
        child: ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(blueColor)),
            onPressed: () {},
            child: const Text(
              '+962790005',
              style: TextStyle(color: white),
            )),
      )
    ],
  ),
);

const chatText = Center(
  child: Text("Chat"),
);

final chatLiveButton = Padding(
  padding: appSym,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Chat live, with chat agent',
        style: GoogleFonts.aleo(fontWeight: FontWeight.w500, color: black),
      ),
      SizedBox(
        width: widthOfButton.width / 3,
        child: ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(blueColor)),
            onPressed: () {},
            child: const Text(
              'Start chating',
              style: TextStyle(color: white),
            )),
      )
    ],
  ),
);

final sendChatReport = Padding(
  padding: appSym,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Send chat Reports',
        style: GoogleFonts.aleo(fontWeight: FontWeight.w500, color: black),
      ),
      SizedBox(
        width: widthOfButton.width / 3,
        child: ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(blueColor)),
            onPressed: () {},
            child: const Text(
              'Send',
              style: TextStyle(color: white),
            )),
      )
    ],
  ),
);

const helpText = Center(
  child: Text("Help?"),
);

final helpCenterButton = Padding(
  padding: appSym,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Help center',
        style: GoogleFonts.aleo(fontWeight: FontWeight.w500, color: black),
      ),
      SizedBox(
        width: widthOfButton.width / 3,
        child: ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(blueColor)),
            onPressed: () {},
            child: const Text(
              'Help',
              style: TextStyle(color: white),
            )),
      )
    ],
  ),
);

final aboutAppButton = Padding(
  padding: appSym,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'About the app',
        style: GoogleFonts.aleo(fontWeight: FontWeight.w500, color: black),
      ),
      SizedBox(
        width: widthOfButton.width / 3,
        child: ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(blueColor)),
            onPressed: () {},
            child: const Text(
              'View',
              style: TextStyle(color: white),
            )),
      )
    ],
  ),
);

final suggestText = Center(
  child: Text(
    'If you have any advies and suggestes, please drop it\n inside the text field, and we will fulfill your needs',
    style: GoogleFonts.aleo(fontWeight: FontWeight.w500, color: black),
  ),
);

final suggestTextField = Center(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextFormField(
      maxLines: 7,
      maxLength: 600,
      // controller: carController.carMake,
      cursorRadius: const Radius.circular(3),
      autocorrect: true,
      enableInteractiveSelection: true,
      cursorColor: Colors.white,
      style: const TextStyle(color: black),
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: const Color.fromARGB(255, 222, 222, 222),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    ),
  ),
);

final suggestButton = SizedBox(
  width: widthOfButton.width / 1.2,
  child: ElevatedButton(
      style:
          const ButtonStyle(backgroundColor: WidgetStatePropertyAll(blueColor)),
      onPressed: () {},
      child: const Text(
        'Submit',
        style: TextStyle(color: white),
      )),
);

///==================================///
///=============[Eshop]==============///
///==================================///

final kWalletAndSearchbarAndCart = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    GestureDetector(
      onTap: () => Get.to(() => const KWallet()),
      child: Stack(children: [
        Text(
          'K',
          style: GoogleFonts.jua(fontSize: 25, color: blueColor),
        ),
        Transform.rotate(
          angle: math.pi / 9,
          child: Text(
            "Wallet",
            style: GoogleFonts.jua(fontSize: 12, color: grey),
          ),
        )
      ]),
    ),
    Container(
      width: widthOfButton.width / 1.45,
      margin: veAho,
      child: CupertinoSearchTextField(
        onSuffixTap: () {},
        suffixIcon: const Icon(Icons.clear),
        enableIMEPersonalizedLearning: true,
        onChanged: (value) {},
        style: const TextStyle(color: Colors.black),
      ),
    ),
    const Icon(Iconsax.shop_add),
  ],
);

final categories = Padding(
  padding: const EdgeInsets.only(right: 295),
  child: Text(
    'Categories',
    style: GoogleFonts.jua(color: grey),
  ),
);
final mostSales = Padding(
  padding: const EdgeInsets.only(right: 295),
  child: Text('Most sales!', style: GoogleFonts.jua(color: grey, fontSize: 20)),
);
final thingMayYouLike = Padding(
  padding: const EdgeInsets.only(right: 290),
  child: Text('Things may you like',
      style: GoogleFonts.jua(color: grey, fontSize: 13)),
);
final all = SingleChildScrollView(
  child: Column(
    children: [
      mostSales,
      Card(
        color: redColor,
        child: Text('ALL'),
      ),
      thingMayYouLike
    ],
  ),
);

const accessoiress = Column(
  children: [
    Card(
      color: blueColor,
      child: Text('acccessoires'),
    )
  ],
);

const carparts = Column(
  children: [
    Card(
      color: green,
      child: Text('car parts'),
    )
  ],
);

const carservices = Column(
  children: [
    Card(
      color: orange,
      child: Text('car service'),
    )
  ],
);
const others = Column(
  children: [
    Card(
      color: grey,
      child: Text('other'),
    )
  ],
);

final res = Center(
    child: Text(
  eShopController.displayedInfo,
  style: const TextStyle(fontSize: 55),
));
final trinding = Padding(
  padding: const EdgeInsets.only(right: 295),
  child: Text(
    'Trinding',
    style: GoogleFonts.jua(fontSize: 20, color: grey),
  ),
);

///==================================///
///===========[Carservice]===========///
///==================================///
final regularService = Container(
  height: widthOfButton.height / 4.4,
  width: widthOfImages.width / 1.1,
  decoration:
      BoxDecoration(color: grey, borderRadius: BorderRadius.circular(12)),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        onTap: () {
          print('got to washing');
        },
        child: SizedBox(
          width: widthOfButton.width / 3.6,
          height: widthOfButton.height / 5,
          child: Card(
            color: carGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.water_drop_outlined,
                  size: 25,
                  color: white,
                ),
                Icon(
                  UIcons.regularRounded.car,
                  size: 45,
                  color: white,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text('Car\nwashing',
                      style: GoogleFonts.aleo(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: white)),
                )
              ],
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          print('changing oil');
        },
        child: SizedBox(
          width: widthOfButton.width / 3.6,
          height: widthOfButton.height / 5,
          child: Card(
            color: carGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  UIcons.regularRounded.oil_can,
                  size: 25,
                  color: white,
                ),
                Icon(
                  UIcons.regularRounded.car,
                  size: 45,
                  color: white,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text("Changing\n oil",
                      style: GoogleFonts.aleo(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: white)),
                )
              ],
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          print('repair');
        },
        child: SizedBox(
          width: widthOfButton.width / 3.6,
          height: widthOfButton.height / 5,
          child: Card(
            color: carGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.settings,
                  size: 25,
                  color: white,
                ),
                Icon(
                  UIcons.regularRounded.car,
                  size: 45,
                  color: white,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text("Car\n repairing",
                      style: GoogleFonts.aleo(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: white)),
                )
              ],
            ),
          ),
        ),
      )
    ],
  ),
);

final urgentService = Container(
  height: widthOfButton.height / 2.6 + 14,
  width: widthOfImages.width / 1.1,
  decoration:
      BoxDecoration(color: grey, borderRadius: BorderRadius.circular(12)),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              print('got to urgent gaz');
            },
            child: SizedBox(
              width: widthOfButton.width / 3.6,
              height: widthOfButton.height / 5,
              child: Card(
                color: carGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      UIcons.regularStraight.oil_can,
                      size: 25,
                      color: white,
                    ),
                    Icon(
                      UIcons.regularRounded.car,
                      size: 45,
                      color: white,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text('Urgent\ngaz',
                          style: GoogleFonts.aleo(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: white)),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('Call Winsh');
            },
            child: SizedBox(
              width: widthOfButton.width / 3.6,
              height: widthOfButton.height / 5,
              child: Card(
                color: carGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      UIcons.regularRounded.wind,
                      size: 45,
                      color: white,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text("Call\n winsh",
                          style: GoogleFonts.aleo(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: white)),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('urgent repair');
            },
            child: SizedBox(
              width: widthOfButton.width / 3.6,
              height: widthOfButton.height / 5,
              child: Card(
                color: carGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 25,
                      color: white,
                    ),
                    Icon(
                      UIcons.regularRounded.car,
                      size: 45,
                      color: white,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text("Car\n repairing",
                          style: GoogleFonts.aleo(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: white)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      GestureDetector(
        onTap: () {
          print('urgent electircity');
        },
        child: SizedBox(
          width: widthOfButton.width / 3.6,
          height: widthOfButton.height / 5,
          child: Card(
            color: carGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.electrical_services_outlined,
                  size: 25,
                  color: white,
                ),
                Icon(
                  UIcons.regularRounded.car,
                  size: 45,
                  color: white,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text("Urgent\neletric charging",
                      style: GoogleFonts.aleo(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: white)),
                )
              ],
            ),
          ),
        ),
      )
    ],
  ),
);

///==================================///
///==============[News]==============///
///==================================///

///==================================///
///===========[Payments]=============///
///==================================///
final wallet = Padding(
  padding: appSym,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('Wallet',
          style: GoogleFonts.aleo(
              fontWeight: FontWeight.w500, fontSize: 23, color: black)),
      PopupMenuButton<String>(
          offset: const Offset(22, 34),
          color: blueColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          itemBuilder: (context) {
            return [
              const PopupMenuItem<String>(
                value: 'Deposit',
                child: Text('Deposit', style: TextStyle(color: white)),
              ),
              const PopupMenuItem<String>(
                value: 'Withdraw',
                child: Text('Withdraw', style: TextStyle(color: white)),
              ),
              const PopupMenuItem<String>(
                value: 'Help',
                child: Text('Help', style: TextStyle(color: white)),
              ),
            ];
          },
          child: const Icon(
            Iconsax.more_2,
            color: blueColor,
          ))
    ],
  ),
);

balanceInWallet() => Container(
      width: widthOfButton.width / 1.3,
      height: widthOfButton.height / 7 + 18,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13), color: carGrey),
      child: Padding(
        padding: appSym,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Balance',
                      style: GoogleFonts.jua(fontSize: 20, color: white)),
                  Text('344 JOD',
                      style: GoogleFonts.jua(fontSize: 20, color: white)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Points',
                      style: GoogleFonts.jua(fontSize: 20, color: white)),
                  Text('2222 points',
                      style: GoogleFonts.jua(fontSize: 20, color: white))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: widthOfButton.width / 4,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(blueColor)),
                      onPressed: () {},
                      child: const Text('Request',
                          style: TextStyle(color: white))),
                ),
                SizedBox(
                  width: widthOfButton.width / 4,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(blueColor)),
                      onPressed: () {},
                      child:
                          const Text('Send', style: TextStyle(color: white))),
                ),
              ],
            )
          ],
        ),
      ),
    );

final historyOfWallet = Padding(
  padding: const EdgeInsets.only(right: 100),
  child: Text('History of using the wallet',
      style: GoogleFonts.aleo(
          fontWeight: FontWeight.w500, fontSize: 23, color: black)),
);
