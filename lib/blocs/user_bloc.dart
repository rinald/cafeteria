class UserBloc {
  final _users = {'': ''};

  void signUp(String email, String password) => _users[email] = password;

  bool signIn(String email, String password) {
    if (_users.containsKey(email)) {
      if (_users[email] == password) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
