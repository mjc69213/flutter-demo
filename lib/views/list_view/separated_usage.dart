import 'package:flutter/material.dart';
import 'friend_card.dart';
import 'mock_data.dart';

class FriendList extends StatelessWidget {
  const FriendList({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemCount: friendList.length,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 0.5,
            color: Color(0xFFDDDDDD),
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return FriendCard(postData: friendList[index],);
        },
      ),
    );
  }
}