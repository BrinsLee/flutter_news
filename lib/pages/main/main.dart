import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_new/common/api/apis.dart';
import 'package:flutter_new/common/entity/entitys.dart';
import 'package:flutter_new/common/utils/screen.dart';
import 'package:flutter_new/common/utils/utils.dart';
import 'package:flutter_new/common/values/values.dart';
import 'package:flutter_new/common/widgets/widgets.dart';
import 'package:flutter_new/pages/main/categories_widget.dart';
import 'package:flutter_new/pages/main/channels_widget.dart';
import 'package:flutter_new/pages/main/news_item_widget.dart';
import 'package:flutter_new/pages/main/newsletter_widget.dart';
import 'package:flutter_new/pages/main/recommend_widget.dart';

/// Created by lipeilin
/// on 2021/4/25
class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  EasyRefreshController _controller; // EasyRefresh控制器
  NewsPageListResponseEntity _newsPageList; // 新闻翻页
  NewsRecommendResponseEntity _newsRecommend; // 新闻推荐
  List<CategoryResponseEntity> _categories; // 分类
  List<ChannelResponseEntity> _channels; // 频道

  String _selCategoryCode; // 选中的分类Code

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _loadAllData();
    _loadLatestWithDiskCache();
  }

  // 如果有磁盘缓存，延迟3秒拉取更新档案
  _loadLatestWithDiskCache() {
    if (CACHE_ENABLE) {
      var cacheData = StorageUtil().getJSON(STORAGE_INDEX_NEWS_CACHE_KEY);
      if (cacheData != null) {
        Timer(Duration(seconds: 3), () {
          _controller.callRefresh();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _newsPageList == null
        ? cardListSkeleton()
        : EasyRefresh(
            enableControlFinishRefresh: true,
            controller: _controller,
            header: ClassicalHeader(),
            onRefresh: () async {
              await _loadNewsData(
                _selCategoryCode,
                refresh: true,
              );
              _controller.finishRefresh();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildCategories(),
                  Divider(height: 1),
                  _buildRecommend(),
                  Divider(height: 1),
                  _buildChannels(),
                  Divider(height: 1),
                  _buildNewsList(),
                  Divider(height: 1),
                  _buildEmailSubscribe(),
                ],
              ),
            ),
          );
  }

  /// 加载数据
  _loadAllData() async {
    _categories = await NewsApi.categories(context: context, cacheDisk: true);
    _channels = await NewsApi.channels(context: context, cacheDisk: true);
    _newsRecommend =
        await NewsApi.newsRecommend(context: context, cacheDisk: true);
    _newsPageList =
        await NewsApi.newsPageList(context: context, cacheDisk: true);
    _selCategoryCode = _categories.first.code;

    if (mounted) {
      setState(() {});
    }
  }

  _loadNewsData(selCategoryCode, {bool refresh = false}) async {
    _selCategoryCode = selCategoryCode;
    _newsRecommend = await NewsApi.newsRecommend(
      context: context,
      params: NewsRecommendRequestEntity(categoryCode: selCategoryCode),
      refresh: refresh,
      cacheDisk: true,
    );
    _newsPageList = await NewsApi.newsPageList(
      context: context,
      params: NewsPageListRequestEntity(categoryCode: selCategoryCode),
      refresh: refresh,
      cacheDisk: true,
    );

    if (mounted) {
      setState(() {});
    }
  }

  /// 分类菜单
  Widget _buildCategories() {
    return newsCategoriesWidget(
        categories: _categories,
        selCategoryCode: _selCategoryCode,
        onTap: (CategoryResponseEntity item) {
          setState(() {
            _selCategoryCode = item.code;
          });
        });
  }

  /// 推荐阅读
  Widget _buildRecommend() {
    return _newsRecommend == null
        ? Container(
            height: duSetHeight(490),
          )
        : recommendWidget(_newsRecommend);
  }

  /// 频道
  Widget _buildChannels() {
    return _channels == null
        ? Container()
        : newsChannelsWidget(
            channels: _channels, onTap: (ChannelResponseEntity item) {});
  }

  // 新闻列表
  Widget _buildNewsList() {
    return _newsPageList == null
        ? Container(
            height: duSetHeight(161 * 5 + 100.0),
            color: Colors.white,
          )
        : Column(
            children: _newsPageList.items.map((item) {
              return Column(
                children: [
                  newsItem(item),
                  Divider(height: 1),
                ],
              );
            }).toList(),
          );
  }

  // ad 广告条
  // 邮件订阅
  Widget _buildEmailSubscribe() {
    return newsletterWidget();
  }
}
