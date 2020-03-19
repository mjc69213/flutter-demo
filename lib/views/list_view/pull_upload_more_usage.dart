import 'package:flutter/material.dart';
import 'news_card.dart';
import 'mock_data.dart';

class PullUpLoadMoreList extends StatefulWidget {
  const PullUpLoadMoreList({Key key}) : super(key: key);

  @override
  _PullUpLoadMoreListState createState() => _PullUpLoadMoreListState();
}

class _PullUpLoadMoreListState extends State<PullUpLoadMoreList> {
  // 需要用的几个变量
  bool isloading =
      false; // 标示是否处于loading状态 加载数据的时候置为true,加载完毕的时候将数据合并到list中,并且置为false
  ScrollController scrollController =
      ScrollController(); // 需要一个controller来判断是否处于底部
  List<NewsViewModel> list = List.from(newsList); // 需要一个list来存储列表的数据源

  //
  @override
  void initState() {
    super.initState();
    // 添加监听
    print('${this.isloading}');
    this.scrollController.addListener(() {
      // 滚动到底部的判断
      if (!this.isloading &&
          this.scrollController.position.pixels >=
              this.scrollController.position.maxScrollExtent) {
        // 开始加载数据
        setState(() {
          this.isloading = true;
          this.loadMoreData();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    this.scrollController.dispose();
  }

  Future loadMoreData() {
    return Future.delayed(Duration(seconds: 2), () {
      setState(() {
        this.isloading = false;
        this.list.addAll(newsList);
      });
    });
  }

  Widget renderBottom() {
    if (this.isloading) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '努力加载中...',
              style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
            ),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: Text(
          '上拉加载更多',
          style: TextStyle(color: Color(0xFF333333), fontSize: 14),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: this.scrollController, // 别忘了这个,调试的时候忘记加这个,造成没有办法监控滚动
      itemCount: list.length + 1,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 0.5,
          color: Color(0xFFDDDDDD),
        );
      },
      itemBuilder: (BuildContext context, int index) {
        if (index < this.list.length) {
          return NewsCard(
            postData: list[index],
          );
        } else {
          return this.renderBottom();
        }
      },
    );
  }
}
