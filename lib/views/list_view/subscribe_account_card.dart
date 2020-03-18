import 'package:flutter/material.dart';

class SubscribeAccountCard extends StatelessWidget {
  final SubscribeAccountViewModel postData;

  const SubscribeAccountCard({Key key, this.postData}) : super(key: key);

  // 第一行
  Widget renderAccountInfo() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(postData.accountImgUrl)),
              SizedBox(
                width: 5,
              ),
              Text(
                postData.accountName,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              )
            ],
          ),
          Text(
            postData.publishTime,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          )
        ],
      ),
    );
  }

  // 第二行图片
  Widget renderPic() {
    final artical = postData.articles[0];
    final shouldClip = postData.articles.length <= 1;
    return ClipRRect(
      borderRadius: !shouldClip
          ? BorderRadius.circular(0)
          : BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Image.network(
            artical.coverImgUrl,
            height: 150,
            fit: BoxFit.scaleDown,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 100,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black54])),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  artical.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // 第三行
  Widget renderArticles() {
    final articles = postData.articles.sublist(1);
    return ListView.separated(
      itemCount: articles.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 0.5,
          margin: EdgeInsets.symmetric(horizontal: 10),
          color: Color(0xFFDDDDDD),
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  articles[index].title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
              SizedBox(width: 15,),
              Image.network(articles[index].coverImgUrl,
                  width: 50, height: 50, fit: BoxFit.cover)
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 5.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              renderAccountInfo(),
              renderPic(),
              renderArticles(),
            ],
          ),
        )
      ],
    );
  }
}

class SubscribeAccountViewModel {
  /// 公众号头像
  final String accountImgUrl;

  /// 公众号名字
  final String accountName;

  /// 发布时间
  final String publishTime;

  /// 文章列表
  final List<Article> articles;

  const SubscribeAccountViewModel({
    this.accountImgUrl,
    this.accountName,
    this.publishTime,
    this.articles,
  });
}

class Article {
  /// 封面图
  final String coverImgUrl;

  /// 文章标题
  final String title;

  const Article({
    this.coverImgUrl,
    this.title,
  });
}
