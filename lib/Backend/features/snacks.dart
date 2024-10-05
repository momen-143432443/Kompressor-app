import 'package:ecar/Frontend/widgets.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

////////////////////////////////////////////////////////////////////////////////////////////////////////
////////===========================================[Errors]===========================================//
////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////
////////[SigninOrSignupSomeFieldsAreNull]//////
//////////////////////////////////////////////

theFullnameIsRequired() {
  return ScaffoldMessenger.of(navigator!.context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.down,
    width: widthOfButton.width / 1.3,
    behavior: SnackBarBehavior.floating,
    backgroundColor: white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    content: const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.error_outline,
          color: redColor,
        ),
        Text(
          "The full name is required.",
          style: TextStyle(color: redColor),
        ),
        Text(
          '.',
          style: TextStyle(color: Colors.transparent, fontSize: 1),
        )
      ],
    ),
    duration: const Duration(seconds: 2),
  ));
}

theEmailIsRequired() {
  return ScaffoldMessenger.of(navigator!.context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.down,
    width: widthOfButton.width / 1.3,
    behavior: SnackBarBehavior.floating,
    backgroundColor: white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    content: const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.error_outline,
          color: redColor,
        ),
        Text(
          "The email is required.",
          style: TextStyle(color: redColor),
        ),
        Text(
          '.',
          style: TextStyle(color: Colors.transparent, fontSize: 1),
        )
      ],
    ),
    duration: const Duration(seconds: 2),
  ));
}

thePasswordIsRequired() {
  return ScaffoldMessenger.of(navigator!.context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.down,
    width: widthOfButton.width / 1.3,
    behavior: SnackBarBehavior.floating,
    backgroundColor: white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    content: const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.error_outline,
          color: redColor,
        ),
        Text(
          "The password is required.",
          style: TextStyle(color: redColor),
        ),
        Text(
          '.',
          style: TextStyle(color: Colors.transparent, fontSize: 1),
        )
      ],
    ),
    duration: const Duration(seconds: 2),
  ));
}

thePhoneNumberIsrequired() {
  return ScaffoldMessenger.of(navigator!.context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.down,
    width: widthOfButton.width / 1.3,
    behavior: SnackBarBehavior.floating,
    backgroundColor: white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    content: const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.error_outline,
          color: redColor,
        ),
        Text(
          "The phone number is incorrect.",
          style: TextStyle(color: redColor),
        ),
        Text(
          '.',
          style: TextStyle(color: Colors.transparent, fontSize: 1),
        )
      ],
    ),
    duration: const Duration(seconds: 2),
  ));
}

allFieldsAreRequired() {
  return ScaffoldMessenger.of(navigator!.context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.down,
    width: widthOfButton.width / 1.3,
    behavior: SnackBarBehavior.floating,
    backgroundColor: white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    content: const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.error_outline,
          color: redColor,
        ),
        Text(
          "The all fields are required.",
          style: TextStyle(color: redColor),
        ),
        Text(
          '.',
          style: TextStyle(color: Colors.transparent, fontSize: 1),
        )
      ],
    ),
    duration: const Duration(seconds: 2),
  ));
}

//////////////////////////////////////////////////
////////////[SigninsomeFieldsAreIncorrect]///////
////////////////////////////////////////////////

emailIsIncorrect() {
  return ScaffoldMessenger.of(navigator!.context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.down,
    width: widthOfButton.width / 1.3,
    behavior: SnackBarBehavior.floating,
    backgroundColor: white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    content: const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.error_outline,
          color: redColor,
        ),
        Text(
          "The email is incorrect.",
          style: TextStyle(color: redColor),
        ),
        Text(
          '.',
          style: TextStyle(color: Colors.transparent, fontSize: 1),
        )
      ],
    ),
    duration: const Duration(seconds: 2),
  ));
}

passwordIsIncorect() {
  return ScaffoldMessenger.of(navigator!.context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.down,
    width: widthOfButton.width / 1.3,
    behavior: SnackBarBehavior.floating,
    backgroundColor: white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    content: const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.error_outline,
          color: redColor,
        ),
        Text(
          "The password is incorrect.",
          style: TextStyle(color: redColor),
        ),
        Text(
          '.',
          style: TextStyle(color: Colors.transparent, fontSize: 1),
        )
      ],
    ),
    duration: const Duration(seconds: 2),
  ));
}

nameFieldLenght() {
  return ScaffoldMessenger.of(navigator!.context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.down,
    width: widthOfButton.width / 1.3,
    behavior: SnackBarBehavior.floating,
    backgroundColor: white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    content: const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.error_outline,
          color: redColor,
        ),
        Text(
          "There'The name must be at least 12 letters.",
          style: TextStyle(color: redColor),
        ),
        Text(
          '.',
          style: TextStyle(color: Colors.transparent, fontSize: 1),
        )
      ],
    ),
    duration: const Duration(seconds: 2),
  ));
}

exceptions(String e) {
  return ScaffoldMessenger.of(navigator!.context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.down,
    width: widthOfButton.width / 2,
    behavior: SnackBarBehavior.floating,
    backgroundColor: white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(
          Icons.error_outline,
          color: redColor,
        ),
        Text(
          e.toString(),
          style: const TextStyle(color: redColor),
        ),
      ],
    ),
    duration: const Duration(seconds: 2),
  ));
}

//////////////////////////////////////////////////
//////////////////[NoteFields]///////////////////
////////////////////////////////////////////////

titleAndSubjectRequired() {
  return ScaffoldMessenger.of(navigator!.context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.down,
    width: widthOfButton.width / 1.3,
    behavior: SnackBarBehavior.floating,
    backgroundColor: white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    content: const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.error_outline,
          color: redColor,
        ),
        Text(
          "There's two values are required.",
          style: TextStyle(color: redColor),
        ),
        Text(
          '.',
          style: TextStyle(color: Colors.transparent, fontSize: 1),
        )
      ],
    ),
    duration: const Duration(seconds: 2),
  ));
}

titleField() {
  return ScaffoldMessenger.of(navigator!.context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.down,
    width: widthOfButton.width / 1.3,
    behavior: SnackBarBehavior.floating,
    backgroundColor: white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    content: const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.error_outline,
          color: redColor,
        ),
        Text(
          'Title field is required.',
          style: TextStyle(color: redColor),
        ),
        Text(
          '.',
          style: TextStyle(color: Colors.transparent, fontSize: 1),
        )
      ],
    ),
    duration: const Duration(seconds: 2),
  ));
}

subjectField() {
  return ScaffoldMessenger.of(navigator!.context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.down,
    width: widthOfButton.width / 1.3,
    behavior: SnackBarBehavior.floating,
    backgroundColor: white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    content: const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.error_outline,
          color: redColor,
        ),
        Text(
          'Subject field is required.',
          style: TextStyle(color: redColor),
        ),
        Text(
          '.',
          style: TextStyle(color: Colors.transparent, fontSize: 1),
        )
      ],
    ),
    duration: const Duration(seconds: 2),
  ));
}

oops() {
  return ScaffoldMessenger.of(navigator!.context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.down,
    width: widthOfButton.width / 1.3,
    behavior: SnackBarBehavior.floating,
    backgroundColor: white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    content: const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.error_outline,
          color: redColor,
        ),
        Text(
          'Oops!, Unable to find the data.',
          style: TextStyle(color: redColor),
        ),
        Text(
          '.',
          style: TextStyle(color: Colors.transparent, fontSize: 1),
        )
      ],
    ),
    duration: const Duration(seconds: 2),
  ));
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
///////===========================================[Success]===========================================//
////////////////////////////////////////////////////////////////////////////////////////////////////////

accountCreated() {
  return ScaffoldMessenger.of(navigator!.context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.down,
    width: widthOfButton.width / 1.3,
    behavior: SnackBarBehavior.floating,
    backgroundColor: white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    content: const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.done,
          color: green,
        ),
        Text(
          'Account create it successfully.',
          style: const TextStyle(color: green),
        ),
        Text(
          '.',
          style: TextStyle(color: Colors.transparent, fontSize: 1),
        )
      ],
    ),
    duration: const Duration(seconds: 2),
  ));
}

loginSuccess() {
  return ScaffoldMessenger.of(navigator!.context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.down,
    width: widthOfButton.width / 1.3,
    behavior: SnackBarBehavior.floating,
    backgroundColor: white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    content: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(
          Icons.done,
          color: green,
        ),
        Text(
          'Login into ${email?.email} successfully.',
          style: const TextStyle(color: green),
        ),
        const Text(
          '.',
          style: TextStyle(color: Colors.transparent, fontSize: 1),
        )
      ],
    ),
    duration: const Duration(seconds: 2),
  ));
}

noteCreated() {
  return ScaffoldMessenger.of(navigator!.context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.down,
    width: widthOfButton.width / 2,
    behavior: SnackBarBehavior.floating,
    backgroundColor: white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    content: const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.done,
          color: green,
        ),
        Text(
          'Note create it.',
          style: TextStyle(color: green),
        ),
        Text(
          '.',
          style: TextStyle(color: Colors.transparent, fontSize: 1),
        )
      ],
    ),
    duration: const Duration(seconds: 2),
  ));
}

deleteSuccess() {
  return ScaffoldMessenger.of(navigator!.context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.down,
    width: widthOfButton.width / 1.9,
    behavior: SnackBarBehavior.floating,
    backgroundColor: white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    content: const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.done,
          color: green,
        ),
        Text(
          'Note has been deleted.',
          style: TextStyle(color: green),
        ),
        Text(
          '.',
          style: TextStyle(color: Colors.transparent, fontSize: 1),
        )
      ],
    ),
    duration: const Duration(seconds: 2),
  ));
}

void showSnackbar(String message) {
  Get.snackbar('Error', message,
      margin: const EdgeInsets.only(bottom: 13),
      maxWidth: 150,
      shouldIconPulse: true,
      barBlur: 50,
      borderColor: black,
      duration: const Duration(seconds: 2),
      borderRadius: 100,
      animationDuration: const Duration(seconds: 2),
      colorText: white,
      backgroundColor: redColor,
      icon: const Icon(Icons.error));
}
