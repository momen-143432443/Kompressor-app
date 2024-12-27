import 'dart:io';
import 'package:ecar/Backend/CarStructure/carController.dart';
import 'package:ecar/Backend/EshopBackend/EShopController.dart';
import 'package:ecar/Backend/authenticationRespository/authenticationRespository.dart';
import 'package:ecar/Backend/carNotes.dart/carNoteScreen.dart';
import 'package:ecar/Backend/carNotes.dart/notesController.dart';
import 'package:ecar/Backend/carNotes.dart/notesRepository.dart';
import 'package:ecar/Backend/for_User/LoginController.dart';
import 'package:ecar/Backend/for_User/ProfileController.dart';
import 'package:ecar/Backend/for_User/SignUpController.dart';
import 'package:ecar/Backend/for_User/update_name_controller.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
Divider spc(double num) => const Divider();

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

/////////////////////////////////////////////////////////////////
////////[AppleAndFacebookAndGoogleForSignInAndSignUp]////////////
/////////////////////////////////////////////////////////////////
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

/////////////////////////////////////////////////////////////////
///////////////[PicTriggerUsingforUploadImages]//////////////////
/////////////////////////////////////////////////////////////////

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

//============================================================================//
///=============[FunctionsOfCarNotesIfAreAvailableOrNot]=====================//
//==========================================================================//

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
