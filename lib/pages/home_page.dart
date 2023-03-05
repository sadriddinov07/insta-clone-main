import 'dart:io';

import 'package:insta_clone/pages/feeds_page.dart';
import 'package:insta_clone/pages/like_page.dart';
import 'package:insta_clone/pages/post_page.dart';
import 'package:insta_clone/pages/search_page.dart';
import 'package:insta_clone/pages/state_widget.dart';

class HomePage extends StateWidget {
  @override
  void build() {
    print("Welcome to HomePage!");

    print("1. Feeds");
    print("2. Search");
    print("3. Post");
    print("4. Likes");
    print("5. Profile");
    stdout.write("Enter command: ");
    int command = int.tryParse(stdin.readLineSync() ?? "0")!;
    switch (command) {
      case 1:
        {
          FeedPage();
          break;
        }
      case 2:
        {
          SearchPage();
          break;
        }
      case 3:
        {
          CreatePost();
          break;
        }
      case 4:
        {
          LikePage();
          break;
        }
      case 5:
        {
          return;
        }
      default:
        {
          print("Invalid command!!!");
          build();
        }
    }
  }
}
