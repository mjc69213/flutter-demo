import 'package:flutter/material.dart';

class BankCardDemo extends StatelessWidget {
  final BankCardViewModel postData;

  const BankCardDemo({Key key, this.postData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.only(top: 20, left: 20),
      height: 200,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: postData.cardColors,
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(50, 0, 0, 0),
                blurRadius: 5,
                offset: Offset(3.0, 4.0))
          ],
          borderRadius: BorderRadius.circular(5)),
      child: Stack(
        children: <Widget>[
          Positioned(
            right: -100,
            bottom: -100,
            child: Image.asset(
              postData.bankLogoUrl,
              width: 250,
              color: Colors.white10,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // Log
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        postData.bankLogoUrl,
                        width: 36,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          postData.bankName,
                          style: TextStyle(
                              fontFamily: 'Famington',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          postData.cardType,
                          style: TextStyle(fontSize: 12, color: Colors.white70),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 65, top: 20),
                  child: Text(
                    postData.cardNumber,
                    style: TextStyle(
                        fontFamily: 'Famington',
                        fontSize: 16,
                        color: Colors.white,
                        wordSpacing: 6),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 65, top: 10),
                  child: Text(postData.validDate, style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BankCardViewModel {
  /// 银行
  final String bankName;

  /// 银行Logo
  final String bankLogoUrl;

  /// 卡类型
  final String cardType;

  /// 卡号
  final String cardNumber;

  /// 卡片颜色
  final List<Color> cardColors;

  /// 有效期
  final String validDate;

  const BankCardViewModel({
    this.bankName,
    this.bankLogoUrl,
    this.cardType,
    this.cardNumber,
    this.cardColors,
    this.validDate,
  });
}
