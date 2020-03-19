import 'package:flutter/material.dart';
import 'mock_data.dart';
import 'package:toast/toast.dart';
import 'news_card.dart';

class PullDownRefreshList extends StatefulWidget {
  const PullDownRefreshList({Key key}) : super(key: key);

  @override
  _PullDownRefreshListState createState() => _PullDownRefreshListState();
}

class _PullDownRefreshListState extends State<PullDownRefreshList> {
  Future _onRefresh () {
    return Future.delayed(Duration(seconds: 1), () {
      Toast.show('当前已是最新数据', context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: RefreshIndicator(
         onRefresh: _onRefresh, // 先定义onRefresh
         child: ListView.separated(
           itemCount: newsList.length,
           separatorBuilder: (BuildContext context, int index) {
             return Divider(
               height: 0.5,
               color: Color(0xFFDDDDDD),
             );
           },
           itemBuilder: (BuildContext context, int index) {
             return NewsCard(postData: newsList[index],);
           },
         ),
       ),
    );
  }
}