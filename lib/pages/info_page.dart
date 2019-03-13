import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage> {
  static const double _sectionAllPadding = 20.0;
  static const double _sectionTopPadding = 10.0;
  static const double _contentsAllPadding = 10.0;


  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _coexPosition = CameraPosition(
    target: LatLng(37.513212, 127.058595),
    zoom: 14.4746,
  );

  static MarkerId markerId = MarkerId('coex');
  static Marker marker = Marker(
    markerId: markerId,
    position: LatLng(37.513212, 127.058595),
    infoWindow: InfoWindow(title: 'coex', snippet: '*'),
  );

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{
    markerId:marker,
  };


  final TextStyle _titleTextStyle = new TextStyle(
      fontSize: 19.0,
      color: const Color(0xFF77e448),
      fontWeight: FontWeight.w400,
      fontFamily: "Roboto");

  final TextStyle _subtitleTextStyle = new TextStyle(
      fontSize: 13.0,
      color: const Color(0xFFededed),
      fontWeight: FontWeight.w200,
      fontFamily: "Roboto");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _contentWidget(),
    );
  }

  _contentWidget() {
    return Container(
      color: const Color(0xFF112030),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(_sectionAllPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            imageBanner(),
            mainTitle("오직 안드로이드 개발자들을 위한 컨퍼런스! 드로이드나이츠 2019"),
            sectionTopPadding(),
            sectionTitle("DROID KNIGHTS 2019"),
            sectionSubTitle("드로이드나이츠는 \"안드로이드 개발자들을 위한 컨퍼런스\"를 표방하며 안드로이드 기술에 대한 세션으로 안드로이드 개발자들의 경험을 공유하고 만남의 장을 만드는 컨퍼런스 입니다.\n한국은 높은 안드로이드점유율과 관련 제조사, 플랫폼 개발회사, 앱 개발회사 등 개발 생태계가 잘 발달하였음에도 불구하고 안드로이드 개발자들이 지식을 나눌 수 있는 기회가 부족하다는 필요로 인해 비영리 개발자 조직에 의해 만들어졌습니다.\n드로이드나이츠 2017, 2018을 성공리에 개최하고 이번 2019년에는 더욱 성숙한 행사를 통해 안드로이드 개발자들이 새로운 기술과 정보를 공유하고 서로 교류할 수 있는 행사가 되기를 희망합니다."),
            sectionTopPadding(),
            sectionTitle("PROGRAM"),
            sectionSubTitle("2019 드로이드 나이츠는 세션 이외의 다양한 프로그램을 준비하고 있습니다."),
            programList(),
            sectionTopPadding(),
            sectionTitle("LOCATION"),
            sectionSubTitle("장소 : 코엑스 E홀 / 서울특별시 강남구 영동대로 513 (삼성동, 코엑스)"),
            googleMap(),
            sectionTitle("SPONSOR"),
            sponsorList(),
          ]
        ),
      )
    );
  }

  Widget imageBanner() => new Stack(children: <Widget>[
    new Image.asset(
      'assets/images/dk_main_graphic.png',
      fit: BoxFit.fitWidth,
    ),
    new Image.asset(
      'assets/images/dk_title.png',
      fit: BoxFit.fitWidth,
    ),
  ]);

  Widget sectionTopPadding() => new Padding(padding: const EdgeInsets.symmetric(vertical: _sectionTopPadding));

  Widget mainTitle(String title) => new Text(
    title,
    style: new TextStyle(
        fontSize: 24.0,
        color: const Color(0xFFFFFFFF),
        fontWeight: FontWeight.w600,
        fontFamily: "Roboto"),
  );

  Widget sectionTitle(String title) => new Text(title, style: _titleTextStyle,);

  Widget sectionSubTitle(String title) => new Text(title, style: _subtitleTextStyle,);

  Widget programList() => new SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            program("코드리뷰", "다른사람들은 어떻게 코딩할까요?\n서로 코드를 공유해봅시다."),
            program("코드랩", "해봐야지 생각하면서 미뤄둔 기술이 있나요?\n드로이드 나이츠에서 한번 시작해보세요!"),
            program("실시간 퀴즈쇼", "당신의 개발력을 뽐내보세요!\n푸짐한 상품이 함께합니다."),
          ]
      )
  );

  Widget program(String title, String description) => new Padding(
    padding: const EdgeInsets.all(_contentsAllPadding),
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(
          title,
          style: new TextStyle(
              fontSize: 13.0,
              color: const Color(0xFFededed),
              fontWeight: FontWeight.w600,
              fontFamily: "Roboto"),
        ),
        new Text(
          description,
          style: _subtitleTextStyle,
        ),
      ],
    ),
  );

  Widget googleMap() => new Container(
    padding: const EdgeInsets.all(_contentsAllPadding),
    alignment: Alignment.topLeft,
    width: 300.0,
    height: 200.0,
    child: GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _coexPosition,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: Set<Marker>.of(markers.values),
    ),
  );

  Widget sponsorList() => new SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.all(_contentsAllPadding),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () => _launchURL('https://prnd.co.kr/'),
                child: Image.network(
                  'https://droidknights.github.io/2019/static/media/%ED%97%A4%EC%9D%B4%EB%94%9C%EB%9F%AC.f213d29a.png',
                  width: 50.0,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
      ]
    )
  );

  _launchURL(url) async {
    //const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
