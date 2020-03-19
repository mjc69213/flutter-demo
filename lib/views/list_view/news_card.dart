import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final NewsViewModel postData;
  const NewsCard({Key key, this.postData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 左边部分
            Expanded(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    postData.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff333333)
                    ),
                  ),
                Text.rich(TextSpan(
                  style: TextStyle(fontSize: 12, color:Color(0xff999999)),
                  text: postData.source,
                  children: [
                    TextSpan(text: '   '),
                    TextSpan(
                      text: '${postData.comments}评论'
                    )
                  ]
                ))
              ],
            ),
            ),
            SizedBox(width: 15,),
            Image.network(
              postData.coverImgUrl,
              width: 100,
              height: 60,
              fit: BoxFit.cover,
              )

          ],
        ));
  }
}

class NewsViewModel {
  /// 新闻标题
  final String title;

  /// 来源
  final String source;

  /// 评论数量
  final int comments;

  /// 新闻配图
  final String coverImgUrl;

  const NewsViewModel({
    this.title,
    this.source,
    this.comments,
    this.coverImgUrl,
  });
}
