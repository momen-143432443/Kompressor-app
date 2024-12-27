import 'package:ecar/Backend/BLOCS/homeBloc/HomeBlocItregration.dart';
import 'package:ecar/Backend/BLOCS/homeBloc/HomeblocEvent.dart';
import 'package:ecar/Backend/BLOCS/homeBloc/HomeblocState.dart';
import 'package:ecar/Backend/for_User/ProfileController.dart';
import 'package:ecar/Frontend/Screens/CarInfoPages/carInfo.dart';
import 'package:ecar/Frontend/GerenalFunctions.dart';
import 'package:ecar/main.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Signupuploadimage extends StatefulWidget {
  const Signupuploadimage({super.key});

  @override
  State<Signupuploadimage> createState() => _SignupuploadimageState();
}

class _SignupuploadimageState extends State<Signupuploadimage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [TextPic(), UploadPicSignUp(), NaviTextBotton()],
        ),
      )),
    );
  }
}

class NaviTextBotton extends StatelessWidget {
  const NaviTextBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 180),
      child: TextButton(
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(blueColor)),
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
  }
}

class UploadPicSignUp extends StatelessWidget {
  const UploadPicSignUp({
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
  }
}

class TextPic extends StatelessWidget {
  const TextPic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "You can upload your image now!",
      style: TextStyle(fontSize: 24),
    );
  }
}
