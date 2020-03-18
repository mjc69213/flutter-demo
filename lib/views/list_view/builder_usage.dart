import 'package:flutter/material.dart';

import 'mock_data.dart';
import 'subscribe_account_card.dart';

class SubscribeAccountList extends StatelessWidget {
  const SubscribeAccountList({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView.builder(
          itemCount: subscribeAccountList.length,
          itemBuilder: (BuildContext context, int index) {
            return SubscribeAccountCard(postData: subscribeAccountList[index],);
          }
      ),
    );
  }
}
