import 'package:flutter/material.dart';
import 'builder_usage.dart';
import 'normal_usage.dart';
import 'pull_down_refresh_usage.dart';
import 'pull_upload_more_usage.dart';
import 'separated_usage.dart';





const List<TabViewModel> tabs = [
  TabViewModel(
    title: '普通用法',
    widget: NormalList(),
  ),
  TabViewModel(
    title: 'builder用法',
    widget: SubscribeAccountList(),
  ),
  TabViewModel(
    title: 'seperated用法',
    widget: FriendList(),
  ),
  TabViewModel(
    title: '下拉刷新用法',
    widget: PullDownRefreshList(),
  ),
  TabViewModel(
    title: '上拉加载用法',
    widget: PullUpLoadMoreList(),
  ),
];

class TabViewModel {
  final String title;
  final Widget widget;
  const TabViewModel({this.title, this.widget});
}

class ListViewDemo extends StatefulWidget {
  ListViewDemo({Key key}) : super(key: key);

  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> with SingleTickerProviderStateMixin {
  TabController _tabController;
  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this._tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'ListView组件',
            style: TextStyle(fontSize: 16),
          ),
          centerTitle: false,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3.0,
            isScrollable: true,
            controller: _tabController,
            tabs: tabs.map((tab) => Tab(text: tab.title,)).toList()
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: tabs.map((tab) => tab.widget).toList(),
        ),
      ),
    );
  }
}
