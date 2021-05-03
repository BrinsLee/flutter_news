import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/common/entity/entitys.dart';
import 'package:flutter_new/common/router/router.gr.dart';
import 'package:flutter_new/common/utils/screen.dart';
import 'package:flutter_new/common/utils/utils.dart';
import 'package:flutter_new/common/values/colors.dart';
import 'package:flutter_new/common/widgets/image.dart';

Widget recommendWidget(NewsRecommendResponseEntity newsRecommend) {
  return Container(
    margin: EdgeInsets.all(duSetWidth(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            ExtendedNavigator.root.push(Routes.detailPage,
                arguments: DetailPageArguments(
                    title: newsRecommend.title, url: newsRecommend.url));
          },
          child: imageCached(
            newsRecommend.thumbnail,
            width: duSetWidth(335),
            height: duSetHeight(290),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: duSetHeight(14)),
          child: Text(
            newsRecommend.author,
            style: TextStyle(
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              color: AppColors.thirdElementText,
              fontSize: duSetFontSize(14),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: duSetHeight(10)),
          child: Text(
            newsRecommend.title,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
                fontSize: duSetFontSize(24),
                height: 1),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: duSetHeight(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 分类
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 120,
                ),
                child: Text(
                  newsRecommend.category,
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                    color: AppColors.secondaryElementText,
                    fontSize: duSetFontSize(14),
                    height: 1,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ),
              // 添加时间
              Container(
                width: duSetWidth(15),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 120,
                ),
                child: Text(
                  '• ${duTimeLineFormat(newsRecommend.addtime)}',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                    color: AppColors.thirdElementText,
                    fontSize: duSetFontSize(14),
                    height: 1,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ),
              // 更多
              Spacer(),
              InkWell(
                child: Icon(
                  Icons.more_horiz,
                  color: AppColors.primaryText,
                  size: 24,
                ),
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    ),
  );
}
