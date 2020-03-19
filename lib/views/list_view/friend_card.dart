import 'package:flutter/material.dart';

class FriendCard extends StatelessWidget {
  final FriendViewModel postData;
  const FriendCard({Key key, this.postData}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 图标
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(postData.userImgUrl, width: 40, height: 40, fit:BoxFit.cover),
          ),
          SizedBox(width: 15,),
          // 剩下的做为一部分
          Expanded(
            // 分为上下两行
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 第一行
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(postData.userName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff333333)),),
                    Text(postData.msgTime, style: TextStyle(color: Color(0xff999999)),)
                  ],
                ),
                // 第二行
                    SizedBox(height: 8,),
                Text(postData.msgContent, style: TextStyle(color: Color(0xff999999), fontSize: 14),)
              ],
            ),
          )
        ],
      ),
    );
  }
}








class FriendViewModel {
  /// 用户昵称
  final String userName;

  /// 用户头像
  final String userImgUrl;

  /// 消息内容
  final String msgContent;

  /// 消息收到时间
  final String msgTime;

  const FriendViewModel({
    this.userName,
    this.userImgUrl,
    this.msgContent,
    this.msgTime,
  });
}
