import 'package:insta_clone/database/users.dart';
import 'package:insta_clone/models/user.dart';
import 'package:insta_clone/pages/home_page.dart';
import 'package:insta_clone/pages/state_widget.dart';
import 'package:insta_clone/services/io_service.dart';

List signInUsersList = [];

class SignInPage extends StateWidget {
  @override
  void build() {
    io.console("Sign In\n");

    io.console("Email: ");
    String email = io.text;

    io.console("Password: ");
    String password = io.text;

    try {
      for (User client in users) {
        if (client.password == password && client.email == email) {
          currentUser = client;
          signInUsersList = [client];
          break;
        }
      }

      if (currentUser == null) {
        print("Please check your password or email!");
        build();
        return;
      }

      print("\n\n\n\n");
      HomePage();
    } catch (e) {
      print(e);
      print("\n");
      build();
    }
  }
}
