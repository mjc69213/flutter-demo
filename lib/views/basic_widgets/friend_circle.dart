import 'package:flutter/material.dart';

class FriendCircleDemo extends StatelessWidget {
  final FriendCircleViewModel postData;
  const FriendCircleDemo({Key key, this.postData}) : super(key: key);
  // 用户头像
  Widget renderUserImg() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        postData.userImgUrl,
        width: 50,
      ),
    );
  }

  // 用户名
  Widget renderUserName() {
    return Text(
      postData.userName,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    );
  }

  // 说说内容
  Widget renderSaying() {
    return Text(postData.saying);
  }

  // 说说时间
  Widget renderPublishInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          postData.publishTime,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        Icon(
          Icons.message,
          size: 14,
          color: Colors.grey,
        )
      ],
    );
  }

  // 评论
  Widget renderComment() {
    return Container(
      padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: postData.comments.map((common) {
            return Text.rich(
              TextSpan(
                children: [TextSpan(text: common.content)],
                text: common.source?'${common.toUser}: ':'${common.fromUser} 回复 ${common.toUser}'
              ),
            );
          }).toList(),
    ));
  }

  // 左边部分
  Widget renderInfo() {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          renderUserName(),
          renderSaying(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Image.network(postData.pic),
          ),
          renderPublishInfo(),
          renderComment(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          renderUserImg(),
          Expanded(
            child: renderInfo(),
          ),
        ],
      ),
    );
  }
}

class FriendCircleViewModel {
  /// 用户名
  final String userName;

  /// 用户头像地址
  final String userImgUrl;

  /// 说说
  final String saying;

  /// 图片
  final String pic;

  ///发布时间
  final String publishTime;

  /// 评论内容
  final List<Comment> comments;

  const FriendCircleViewModel({
    this.userName,
    this.userImgUrl,
    this.saying,
    this.pic,
    this.publishTime,
    this.comments,
  });
}

class Comment {
  /// 是否发起人
  final bool source;

  /// 评论者
  final String fromUser;

  /// 被评论者
  final String toUser;

  // 评论内容
  final String content;

  const Comment({
    this.source,
    this.fromUser,
    this.toUser,
    this.content,
  });
}
