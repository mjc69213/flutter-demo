import 'package:flutter/material.dart';

class PetCardDemo extends StatelessWidget {
  final PetCardViewModel postData;

  const PetCardDemo({Key key, this.postData}) : super(key: key);

  // 图片
  Widget renderCover() {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5), topLeft: Radius.circular(5)),
          child: Image.network(postData.coverUrl,
              width: double.infinity, fit: BoxFit.fitWidth),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: 100,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(0, 0, 0, 0),
                    Color.fromARGB(80, 0, 0, 0)
                  ]),
            ),
          ),
        )
      ],
    );
  }

  // 用户信息
  Widget renderUserInfo() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              //用户头像
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(postData.userImgUrl),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
              ),
              // 用户信息
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    postData.userName,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff333333)),
                  ),
                  Text(
                    postData.description,
                    style: TextStyle(fontSize: 12, color: Color(0xff999999)),
                  )
                ],
              ),
            ],
          ),
          // 时间
          Text(
            postData.publishTime,
            style: TextStyle(color: Color(0xff999999)),
          )
        ],
      ),
    );
  }

  // 发布内容
  Widget renderPublishContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 标题
          Row(
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFFFFC600),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Text(
                    '# ${postData.topic}',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          // 内容
          Text(
            postData.publishContent,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xff333333)),
          )
        ],
      ),
    );
  }

  // 评论数量
  Widget renderInteractionArea () {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // 评论数
          Row(
            children: <Widget>[
              Icon(Icons.message, size: 14, color: Colors.grey),
              SizedBox(width: 8,),
              Text(postData.replies.toString(), style: TextStyle(color: Color(0xff999999), fontSize: 12),)
            ],
          ),
          // 点赞
          Row(
            children: <Widget>[
              Icon(Icons.favorite, color: Color(0xFFFFC600), size: 14,),
              SizedBox(width: 8,),
              Text(postData.likes.toString(), style: TextStyle(fontSize: 12, color: Color(0xff999999)),)
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.share, size: 14, color: Colors.grey,),
              SizedBox(width: 8,),
              Text(postData.shares.toString(), style: TextStyle(fontSize: 12, color: Color(0xff999999)),)
            ],
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(50, 0, 0, 0),
            blurRadius: 4,
            offset: Offset(2.0, 2.0)
          )
        ]
      ),
      child: Column(
        children: <Widget>[
          // 图片
          renderCover(),
          // 用户
          renderUserInfo(),
          // 发布内容
          renderPublishContent(),
          // 评论
          renderInteractionArea(),
        ],
      ),
    );
  }
}

class PetCardViewModel {
  /// 封面地址
  final String coverUrl;

  /// 用户头像地址
  final String userImgUrl;

  /// 用户名
  final String userName;

  /// 用户描述
  final String description;

  /// 话题
  final String topic;

  /// 发布时间
  final String publishTime;

  /// 发布内容
  final String publishContent;

  /// 回复数量
  final int replies;

  /// 喜欢数量
  final int likes;

  /// 分享数量
  final int shares;

  const PetCardViewModel({
    this.coverUrl,
    this.userImgUrl,
    this.userName,
    this.description,
    this.topic,
    this.publishTime,
    this.publishContent,
    this.replies,
    this.likes,
    this.shares,
  });
}
