abstract class StringValidator {
  bool isValid(String  value);
}

class NonemptyStringValidators implements StringValidator{
  @override
  bool isValid(String value){
    return value.isEmpty;
  }
}

class EmailPasswordProviders {
  final StringValidator emailValidator = NonemptyStringValidators();
  final StringValidator passwordValidator = NonemptyStringValidators();
  final String emailerror = 'Email can\'t be empty';
  final String usernameError = 'Username can\'t be empty';
  final String passwordError = 'Password can\'t be empty';
}
