import 'dart:io';

import 'package:insta_clone/database/users.dart';
import 'package:insta_clone/models/post.dart';
import 'package:insta_clone/models/user.dart';
import 'package:insta_clone/pages/home_page.dart';
import 'package:insta_clone/pages/sign_in_page.dart';
import 'package:insta_clone/pages/state_widget.dart';

class FeedPage extends StateWidget {
  void build() {
    print("1. View your and followers posts");
    print("2. Like for selected post");
    print("3. Delete post");
    print("4. Exit");
    stdout.write("Enter command: ");
    int command = int.tryParse(stdin.readLineSync() ?? "0")!;
    if (command == 1) {
      print("Your posts:");
      User userPosts = signInUsersList[0];
      print(userPosts.getUserPosts);
      List list = userPosts.getFollowers;
      print("Followers posts:");
      for (User user in list) {
        print(user.getUserPosts);
      }
      build();
      return;
    } else if (command == 2) {
      print(users);
      stdout.write("Select user: ");
      String selectUser = stdin.readLineSync() ?? "0";
      for (User user in users) {
        if (user.fullname == selectUser) {
          print(user.getUserPosts);
          stdout.write("Select post: ");
          String selectedPost = stdin.readLineSync() ?? "0";
          for (Post post in user.getUserPosts) {
            if (post.title == selectedPost) {
              print("1. Like");
              print("2. Remove like");
              stdout.write("Enter command: ");
              int likeCommand = int.tryParse(stdin.readLineSync() ?? "0")!;
              if (likeCommand == 1) {
                post.likeCount++;
                print("You liked ${post.title} post");
                user.writeLikes(user);
                build();
                return;
              } else if (likeCommand == 2) {
                post.likeCount = post.likeCount-- < 0 ? 0 : post.likeCount--;
                print("You remove liked ${post.title} post");
                build();
                return;
              } else {
                print("Wrong command!!!\nPlease try again!!!");
                build();
                return;
              }
            }
          }
          print("Post is not found!!!");
          build();
          return;
        }
      }
      print("User doesn't exist!!!");
      build();
      return;
    } else if (command == 3) {
      User user = signInUsersList[0];
      print(user.getUserPosts);
      String selectedPost = stdin.readLineSync() ?? "0";
      for (Post post in user.getUserPosts) {
        if (post.title == selectedPost) {
          print("1. Delete post");
          print("2. Exit");
          stdout.write("Enter command: ");
          int postCommand = int.tryParse(stdin.readLineSync() ?? "0")!;
          if (postCommand == 1) {
            user.removePost(post);
            print("Your post  has been deleted!");
            build();
            return;
          } else if (postCommand == 2) {
            print("Returning to Home page!");
            HomePage();
            return;
          } else {
            print("Wrong command!!!\nPlease try again!!!");
            build();
            return;
          }
        }
      }
    } else if (command == 4) {
      print("Returning to Home page");
      HomePage();
      return;
    } else {
      print("Invalid command!!!\nPlease try again!!!");
      build();
      return;
    }
  }
}
