import 'dart:async';

import 'package:droidknights/res/strings.dart';
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

  static MarkerId markerId = MarkerId(Strings.INFO_TAB_MAKER);
  static Marker marker = Marker(
    markerId: markerId,
    position: LatLng(37.513212, 127.058595),
    infoWindow: InfoWindow(title: Strings.INFO_TAB_MAKER, snippet: '*'),
  );

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{
    markerId:marker,
  };


  final TextStyle _titleTextStyle = new TextStyle(
      fontSize: 19.0,
      color: const Color(0xFF77e448),
      fontWeight: FontWeight.w400,
      height: 1.3,
      fontFamily: Strings.FONT_DUNG_GEUN_MO);

  final TextStyle _subtitleTextStyle = new TextStyle(
      fontSize: 13.0,
      color: const Color(0xFFededed),
      fontWeight: FontWeight.w200,
      height: 1.5,
      fontFamily: Strings.FONT_DUNG_GEUN_MO);

  final TextStyle _buttonTextStyle = new TextStyle(
      fontSize: 15.0,
      color: const Color(0xFFededed),
      fontWeight: FontWeight.w500,
      fontFamily: Strings.FONT_DUNG_GEUN_MO);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF112030),
        centerTitle: true,
        title: Image.asset(
          Strings.SCHEDULE_TAB_IMAGES_APP_BAR,
          fit: BoxFit.fitHeight,
          height: 25,
        ),
      ),
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
            mainTitle(Strings.INFO_TAB_MAIN_TITLE),
            sectionTopPadding(),
            sectionTitle(Strings.INFO_TAB_SECTION_TITLE_DROID_KNIGHTS),
            sectionSubTitle(Strings.INFO_TAB_SECTION_SUB_TITLE_INTRO),
            goToHomepage(),
            sectionTopPadding(),
            sectionTitle(Strings.INFO_TAB_SECTION_TITLE_PROGRAM),
            sectionSubTitle(Strings.INFO_TAB_SECTION_SUB_TITLE_INTRO2),
            programList(),
            sectionTopPadding(),
            sectionTitle(Strings.INFO_TAB_SECTION_TITLE_LOCATION),
            sectionSubTitle(Strings.INFO_TAB_SECTION_SUB_TITLE_LOCATION),
            googleMap(),
            sectionTitle(Strings.INFO_TAB_SECTION_TITLE_SPONSOR),
            sponsorList(),
          ]
        ),
      )
    );
  }

  Widget imageBanner() => new Stack(children: <Widget>[
    new Image.asset(
      Strings.INFO_TAB_IMAGES_PATH_DK_MAIN_GRAPHIC,
      fit: BoxFit.fitWidth,
    ),
    new Image.asset(
      Strings.INFO_TAB_IMAGES_PATH_DK_TITLE,
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
      height: 1.2,
      fontFamily: Strings.FONT_DUNG_GEUN_MO),
  );

  Widget sectionTitle(String title) => new Text(title, style: _titleTextStyle,);

  Widget sectionSubTitle(String title) => new Text(title, style: _subtitleTextStyle,);

  Widget goToHomepage() =>
      new Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.only(bottom: 3),
        child: new MaterialButton(
          onPressed: () => _launchURL(Strings.INFO_TAB_URL_DROID_KNIGHTS),
          color: const Color(0xFF77e448),
          child: new Text(Strings.INFO_TAB_MOVE_HOMEPAGE, style: _buttonTextStyle),
        ),
      );

  Widget programList() => new SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            program(Strings.INFO_TAB_TITLE_CODE_LAB,
                Strings.INFO_TAB_TITLE_CODE_LAB_CONTENT),
            program(Strings.INFO_TAB_TITLE_CODE_REVIEW,
                Strings.INFO_TAB_TITLE_CODE_REVIEW_CONTENT),
            program(Strings.INFO_TAB_TITLE_LIGHTENING_TALK,
                Strings.INFO_TAB_TITLE_LIGHTENING_TALK_CONTENT),
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
              fontFamily: Strings.FONT_DUNG_GEUN_MO),
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
        new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: _contentsAllPadding),
              child: GestureDetector(
                onTap: () => _launchURL(Strings.INFO_TAB_URL_SPONSOR_LINE),
//                child: Text("NO IMAGE", style:_subtitleTextStyle),
                child: Image.network(
                  Strings.INFO_TAB_URL_IMAGE_SPONSOR_LINE,
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: _contentsAllPadding),
              child: GestureDetector(
                onTap: () => _launchURL(Strings.INFO_TAB_URL_SPONSOR_PRD),
//                child: Text("NO IMAGE", style:_subtitleTextStyle),
                child: Image.network(
                  Strings.INFO_TAB_URL_IMAGE_SPONSOR_PRD,
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: _contentsAllPadding),
              child: GestureDetector(
                onTap: () => _launchURL(Strings.INFO_TAB_URL_SPONSOR_JETBRAINS),
//                child: Text("NO IMAGE", style:_subtitleTextStyle),
                child: Image.network(
                  Strings.INFO_TAB_URL_IMAGE_SPONSOR_JETBRAINS,
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: _contentsAllPadding),
              child: GestureDetector(
                onTap: () => _launchURL(Strings.INFO_TAB_URL_SPONSOR_HYPERCONNECT),
//                child: Text("NO IMAGE", style:_subtitleTextStyle),
                child: Image.network(
                  Strings.INFO_TAB_URL_IMAGE_SPONSOR_HYPERCONNECT,
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: _contentsAllPadding),
              child: GestureDetector(
                onTap: () => _launchURL(Strings.INFO_TAB_URL_SPONSOR_YANOLJA),
//                child: Text("NO IMAGE", style:_subtitleTextStyle),
                child: Image.network(
                  Strings.INFO_TAB_URL_IMAGE_SPONSOR_YANOLJA,
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: _contentsAllPadding),
              child: GestureDetector(
                onTap: () => _launchURL(Strings.INFO_TAB_URL_SPONSOR_RAINIST),
//                child: Text("NO IMAGE", style:_subtitleTextStyle),
                child: Image.network(
                  Strings.INFO_TAB_URL_IMAGE_SPONSOR_RAINIST,
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: _contentsAllPadding),
              child: GestureDetector(
                onTap: () => _launchURL(Strings.INFO_TAB_URL_SPONSOR_EBRAIN),
//                child: Text("NO IMAGE", style:_subtitleTextStyle),
                child: Image.network(
                  Strings.INFO_TAB_URL_IMAGE_SPONSOR_EBRAIN,
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: _contentsAllPadding),
              child: GestureDetector(
                onTap: () => _launchURL(Strings.INFO_TAB_URL_SPONSOR_LEZHIN),
//                child: Text("NO IMAGE", style:_subtitleTextStyle),
                child: Image.network(
                  Strings.INFO_TAB_URL_IMAGE_SPONSOR_LEZHIN,
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
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
