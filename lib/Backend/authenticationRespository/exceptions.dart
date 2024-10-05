class SignupWithEmailAndPasswordFailure {
  final String message;
  const SignupWithEmailAndPasswordFailure(
      [this.message = "An unknown error occurred"]);
  factory SignupWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak Password':
        return const SignupWithEmailAndPasswordFailure(
            'Please enter a strong password');
      case 'invaild email':
        return const SignupWithEmailAndPasswordFailure('Email is not valid');
      case 'email=already-in-use':
        return const SignupWithEmailAndPasswordFailure(
            "An account already exists for that email");
      default:
        return const SignupWithEmailAndPasswordFailure();
    }
  }
}
