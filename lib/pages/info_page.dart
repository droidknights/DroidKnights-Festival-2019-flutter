import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage> {
  static const double _topSectionTopPadding = 50.0;
  static const double _topSectionBottomPadding = 20.0;
  static const double _topSectionHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _contentWidget(),
    );
  }

  _contentWidget() {
    final bodyHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;
    return Container(
        color: const Color(0xFF112030),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Stack(children: <Widget>[
                  new Image.network(
                    'https://droidknights.github.io/2019/static/media/main-graphic.b99f9fb7.png',
                    fit: BoxFit.fitWidth,
                  ),
                  new Image.network(
                    'https://droidknights.github.io/2019/static/media/2019_dk_title.cf69c879.png',
                    fit: BoxFit.fitWidth,
                  ),
                ]),
                new Text(
                  "오직 안드로이드 개발자들을 위한 컨퍼런스! 드로이드나이츠 2019",
                  style: new TextStyle(
                      fontSize: 24.0,
                      color: const Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Roboto"),
                ),
                new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0)),
                new Text(
                  "DROID KNIGHTS 2019",
                  style: new TextStyle(
                      fontSize: 19.0,
                      color: const Color(0xFF77e448),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto"),
                ),
                new Text(
                  "드로이드나이츠는 \"안드로이드 개발자들을 위한 컨퍼런스\"를 표방하며 안드로이드 기술에 대한 세션으로 안드로이드 개발자들의 경험을 공유하고 만남의 장을 만드는 컨퍼런스 입니다.\n한국은 높은 안드로이드점유율과 관련 제조사, 플랫폼 개발회사, 앱 개발회사 등 개발 생태계가 잘 발달하였음에도 불구하고 안드로이드 개발자들이 지식을 나눌 수 있는 기회가 부족하다는 필요로 인해 비영리 개발자 조직에 의해 만들어졌습니다.\n드로이드나이츠 2017, 2018을 성공리에 개최하고 이번 2019년에는 더욱 성숙한 행사를 통해 안드로이드 개발자들이 새로운 기술과 정보를 공유하고 서로 교류할 수 있는 행사가 되기를 희망합니다.",
                  style: new TextStyle(
                      fontSize: 13.0,
                      color: const Color(0xFFededed),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                ),
                new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0)),
                new Text(
                  "PROGRAM",
                  style: new TextStyle(
                      fontSize: 19.0,
                      color: const Color(0xFF77e448),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto"),
                ),
                new Text(
                  "2019 드로이드 나이츠는 세션 이외의 다양한 프로그램을 준비하고 있습니다.",
                  style: new TextStyle(
                      fontSize: 13.0,
                      color: const Color(0xFFededed),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text(
                                  "코드리뷰",
                                  style: new TextStyle(
                                      fontSize: 13.0,
                                      color: const Color(0xFFededed),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Roboto"),
                                ),
                                new Text(
                                  "다른사람들은 어떻게 코딩할까요?\n서로 코드를 공유해봅시다.",
                                  style: new TextStyle(
                                      fontSize: 13.0,
                                      color: const Color(0xFFededed),
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "Roboto"),
                                ),
                              ],
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text(
                                  "코드랩",
                                  style: new TextStyle(
                                      fontSize: 13.0,
                                      color: const Color(0xFFededed),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Roboto"),
                                ),
                                new Text(
                                  "해봐야지 생각하면서 미뤄둔 기술이 있나요?\n드로이드 나이츠에서 한번 시작해보세요!",
                                  style: new TextStyle(
                                      fontSize: 13.0,
                                      color: const Color(0xFFededed),
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "Roboto"),
                                ),
                              ],
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text(
                                  "실시간 퀴즈쇼",
                                  style: new TextStyle(
                                      fontSize: 13.0,
                                      color: const Color(0xFFededed),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Roboto"),
                                ),
                                new Text(
                                  "당신의 개발력을 뽐내보세요!\n푸짐한 상품이 함께합니다.",
                                  style: new TextStyle(
                                      fontSize: 13.0,
                                      color: const Color(0xFFededed),
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "Roboto"),
                                ),
                              ],
                            ),
                          ),
                        ])),

              ]),
        ));
  }
}
