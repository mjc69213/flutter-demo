import 'package:flutter/material.dart';
import '../basic_widgets/friend_circle.dart';
import '../basic_widgets/pet_card.dart';
import '../basic_widgets/bank_card.dart';
import '../basic_widgets/index.dart';

class NormalList extends StatelessWidget {
  const NormalList({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        PetCardDemo(postData: petCardData,),
        BankCardDemo(postData: creditCardData,),
        FriendCircleDemo(postData: friendCircleData,)
      ],
    );
  }
}