import 'dart:io';

import 'package:insta_clone/models/post.dart';
import 'package:insta_clone/models/user.dart';
import 'package:insta_clone/pages/home_page.dart';
import 'package:insta_clone/pages/sign_in_page.dart';
import 'package:insta_clone/pages/state_widget.dart';

class CreatePost extends StateWidget {
  @override
  void build() {
    print("Welcome to Post dashboard");
    print("Do you want Create Post?");
    print("1. Create");
    print("2. Exit");
    int command = int.tryParse(stdin.readLineSync() ?? "0")!;
    if (command == 1) {
      stdout.write("Choose a title for your post: ");
      String title = stdin.readLineSync() ?? "";
      stdout.write("Upload your content: ");
      String content = stdin.readLineSync() ?? "";
      stdout.write("Enter MediaUrl: ");
      String mediaUrl = stdin.readLineSync() ?? "";

      if (title.isEmpty || content.isEmpty || mediaUrl.isEmpty) {
        print("Empty dates please try again!!!");
        build();
        return;
      }
      Post userPost = Post(title: title, content: content, mediaUrl: mediaUrl);
      print("Your content has been successfully uploaded!!!");
      User user = signInUsersList[0];
      user.writePost(userPost);
      print(user.getUserPosts);
      build();
      return;
    } else if (command == 2) {
      print("Returning to Home page");
      HomePage();
      return;
    } else {
      print("Invalid command!!!Please try again!!!");
      build();
    }
  }
}
