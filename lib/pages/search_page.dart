import 'dart:io';

import 'package:insta_clone/database/users.dart';
import 'package:insta_clone/models/user.dart';
import 'package:insta_clone/pages/home_page.dart';
import 'package:insta_clone/pages/sign_in_page.dart';
import 'package:insta_clone/pages/state_widget.dart';

class SearchPage extends StateWidget {
  void build() {
    print(users);
    stdout.write("Select user: ");
    String selectUser = stdin.readLineSync() ?? "0";
    for (User user in users) {
      if (selectUser == user.fullname) {
        print("1. Follow for $selectUser");
        print("2. Unfollow for $selectUser");
        print("3. Exit");
        stdout.write("Enter command: ");
        int followCommand = int.tryParse(stdin.readLineSync() ?? "0")!;
        if (followCommand == 1) {
          user.writeFollow(signInUsersList[0]);
          print("Successfully followed for $selectUser user");
          print(user.getFollowers);
          build();
          return;
        } else if (followCommand == 2) {
          user.removeFollow(signInUsersList[0]);
          print("Successfully unfollowed for $selectUser user");
          print(user.getFollowers);
          build();
          return;
        } else if (followCommand == 3) {
          HomePage();
          return;
        } else {
          print("Invalid command!!!\nPlease try again!!!");
          build();
          return;
        }
      }
    }
  }
}
