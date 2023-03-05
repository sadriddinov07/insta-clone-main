import 'package:insta_clone/pages/sign_in_page.dart';
import 'package:insta_clone/pages/sign_up_page.dart';
import 'package:insta_clone/pages/state_widget.dart';
import 'package:insta_clone/services/io_service.dart';

class IntroPage extends StateWidget {
  @override
  void build() {
    print("Welcome to InstaClone");
    print("1. Sign In");
    print("2. Sign Up");
    int command = io.number;
    if (command == 1) {
      SignInPage();
    } else if (command == 2) {
      SignUpPage();
    } else {
      print("Invalid command!!!\nPlease try again!!!");
      build();
      return;
    }
  }
}
