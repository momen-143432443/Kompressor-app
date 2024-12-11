import 'package:ecar/Frontend/Screens/editorialPages/epController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'dart:math' as math;

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  //pink
  late Animation<double> _pinkScaleAnimation;
  late Animation<Offset> _pinkBoxAnimation;
  late Animation<double> _pinkOpacityAnimation;

  //green
  late Animation<double> _greenScaleAnimation;
  late Animation<Offset> _greenBoxAnimation;
  late Animation<double> _greenOpacityAnimation;

  //blue
  late Animation<double> _blueScaleAnimation;
  late Animation<Offset> _blueBoxAnimation;
  late Animation<double> _blueOpacityAnimation;

  //grey˳
  late Animation<double> greyScaleAnimation;
  late Animation<Offset> greyBoxAnimation;
  late Animation<double> _greyOpacityAnimation;

  double greyOpacity = 0;
  double blueOpacity = 0;
  double greenOpacity = 0;
  double pinkOpacity = 0;

  //text animation
  late Animation<Offset> _textAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    //pink

    _pinkBoxAnimation =
        Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: _animationController,
                curve: const Interval(
                  0,
                  0.25,
                  curve: Curves.ease,
                )));
    _pinkOpacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(
              0,
              0.25,
              curve: Curves.ease,
            )));
    _pinkScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(
              0.08,
              0.5,
              curve: Curves.ease,
            )));

    //green

    _greenBoxAnimation =
        Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: _animationController,
                curve: const Interval(
                  0.25,
                  0.5,
                  curve: Curves.ease,
                )));
    _greenOpacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(
              0.25,
              0.5,
              curve: Curves.ease,
            )));
    _greenScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(
              0.35,
              0.75,
              curve: Curves.ease,
            )));

    //blue
    _blueBoxAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: _animationController,
                curve: const Interval(
                  0.5,
                  0.75,
                  curve: Curves.ease,
                )));
    _blueOpacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(
              0.5,
              0.75,
              curve: Curves.ease,
            )));
    _blueScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(
              0.5,
              0.85,
              curve: Curves.ease,
            )));

    //grey
    greyScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(
              0.8,
              1,
              curve: Curves.ease,
            )));
    greyBoxAnimation =
        Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: _animationController,
                curve: const Interval(
                  0.7,
                  1,
                  curve: Curves.ease,
                )));
    _greyOpacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(
              .7,
              1,
              curve: Curves.ease,
            )));

    _animationController.forward();

    //textAnimation
    _textAnimation =
        Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: _animationController,
                curve: const Interval(
                  0,
                  0.4,
                  curve: Curves.ease,
                )));
    //listeners

    _pinkOpacityAnimation.addListener(() {
      setState(() {
        pinkOpacity = _pinkOpacityAnimation.value;
      });
    });

    _greenOpacityAnimation.addListener(() {
      setState(() {
        greenOpacity = _greenOpacityAnimation.value;
      });
    });

    _blueOpacityAnimation.addListener(() {
      setState(() {
        blueOpacity = _blueOpacityAnimation.value;
      });
    });

    _greyOpacityAnimation.addListener(() {
      setState(() {
        greyOpacity = _greyOpacityAnimation.value;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final T = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                opacity: pinkOpacity,
                child: SlideTransition(
                  position: _textAnimation,
                  child: Text(
                    'What else?',
                    style: GoogleFonts.roboto(
                      fontSize: 48,
                      height: 1,
                      letterSpacing: -3,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                flex: 3,
                child: Row(
                  children: [
                    //blue box
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 100),
                      opacity: blueOpacity,
                      child: SlideTransition(
                        position: _blueBoxAnimation,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2 - 25,
                            height: double.maxFinite,
                            color: redColor,
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Stack(
                              children: [
                                Positioned(
                                    bottom: 0,
                                    right: -180,
                                    child: Transform.rotate(
                                        angle: -math.pi / 5.5,
                                        child: ScaleTransition(
                                          scale: _blueScaleAnimation,
                                          child: Image.asset(
                                            'assets/fix_car.jpg',
                                            height: 300,
                                          ),
                                        ))),
                                // const Positioned(
                                //     left: 0,
                                //     top: 10,
                                //     child:  RatingStars(
                                //       rating: 2,
                                //     )),
                                Positioned(
                                  left: 0,
                                  top: 10,
                                  child: Text(
                                    'Making your\nnotifications',
                                    style: GoogleFonts.openSansCondensed(
                                      fontSize: 28,
                                      height: 1,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 25,
                      child: Column(
                        children: [
                          //pink box
                          Expanded(
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 100),
                              opacity: pinkOpacity,
                              child: SlideTransition(
                                position: _pinkBoxAnimation,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 10),
                                    color: colorGrey,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            bottom: -10,
                                            right: 0,
                                            child: ScaleTransition(
                                              scale: _pinkScaleAnimation,
                                              child: Image.asset(
                                                  'assets/mechanic_tools.jpg',
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      4),
                                            )),
                                        // const Positioned(
                                        //     left: 0,
                                        //     top: 9,
                                        //     child: RatingStars(
                                        //       rating: 2,
                                        //     )),
                                        Positioned(
                                          left: 0,
                                          top: 10,
                                          child: Text(
                                            'Reminder\nof your notes for\n the car',
                                            style:
                                                GoogleFonts.openSansCondensed(
                                              fontSize: 20,
                                              height: 1,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //green box
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: AnimatedOpacity(
                              opacity: greenOpacity,
                              duration: const Duration(milliseconds: 100),
                              child: SlideTransition(
                                position: _greenBoxAnimation,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    color: greenColor,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            bottom: -40,
                                            right: -65,
                                            child: ScaleTransition(
                                              scale: _greenScaleAnimation,
                                              child: Image.asset(
                                                'assets/Lamborghini_Aventador_SVJ_Green.webp',
                                                width: 240,
                                              ),
                                            )),
                                        // const Positioned(
                                        //     left: 10,
                                        //     top: 20,
                                        //     child: RatingStars(
                                        //       rating: 2,
                                        //     )),
                                        Positioned(
                                          left: 10,
                                          bottom: 22,
                                          child: Text(
                                            'Kompressor\nprovide to a many\n tools to achieve\n your goals ',
                                            style:
                                                GoogleFonts.openSansCondensed(
                                              fontSize: 20,
                                              height: 1,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      width: T.width,
                      height: 50,
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: ElevatedButton(
                        onPressed: () => Epcontroller.instance.nextPage(),
                        style: ButtonStyle(
                            backgroundColor:
                                const WidgetStatePropertyAll(blueColor),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                        child: const Text(
                          "Get start",
                          style: TextStyle(color: white),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
