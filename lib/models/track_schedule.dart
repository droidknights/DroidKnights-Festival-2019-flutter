class ScheduleListModel{
  final List<ScheduleModel> list;

  ScheduleListModel({this.list});

  factory ScheduleListModel.fromJson(List<dynamic> parsedJson) {
    List<ScheduleModel> lists = new List<ScheduleModel>();
    lists = parsedJson.map((i)=>ScheduleModel.fromJson(i)).toList();

    return ScheduleListModel(
        list: lists
    );
  }
}
class ScheduleModel{
  final String name;
  final String title;
  final String time;
  final String avatarUrl;
  final String contents;

  ScheduleModel({this.name, this.title, this.time, this.avatarUrl, this.contents});

  factory ScheduleModel.fromJson(Map<String, dynamic> parsedJson){
    return ScheduleModel(
        name: parsedJson['name'],
        title: parsedJson['title'],
        time: parsedJson ['time'],
        avatarUrl: parsedJson['avatarUrl'],
        contents: parsedJson ['contents']
    );
  }
}
List<ScheduleModel> dummyData = [
  new ScheduleModel(
      name: "정승욱",
      title: "No More Fragment, No More Activity",
      time: "10:15-11:00",
      avatarUrl: "https://droidknights.github.io/2018/images/Profile/s1.png",
      contents: "FragmentManager 도 필요 없고 OnActivityResult 처리도 필요 없는 단일 액티비티로 앱 구현하기.\n싱글 액티비티 구현을 위해 찾았던 다양한 솔루션, 싱글 액티비티에서 앱을 동작하기 위해 만든 기본 프레임워크와 동작 방식에 대해서 공유합니다. 또한 Side-Effect 를 처리하기 위한 다양한 구현 방법과 사용 방법 및 고려사항을 공유합니다."
  ),
  new ScheduleModel(
      name: "남상균, 정현지",
      title: "Next Step Architecture",
      time: "11:15-12:00",
      avatarUrl: "https://droidknights.github.io/2018/images/Profile/s2-2.png",
      contents: "다양한 안드로이드 아키텍처들에 관심이 가는 요즘, 이를 적용하기 위해 충돌하고 고민하며, 어떻게 적절한 개발을 진행하고 있는지 이야기 하려 합니다. 특히, 오래된 기존 시스템을 개선하기 위한 많은 노력들을 공유하려 합니다."
  ),
  new ScheduleModel(
      name: "한정일",
      title: "Paging Library, 그것이 쓰고싶다",
      time: "13:15-13:40",
      avatarUrl: "https://droidknights.github.io/2018/images/Profile/s3.png",
      contents: "AAC의 일부인 Paging Library에 대해서 소개하고, 이를 이용해 점진적으로 데이터를 로드하는 완전히 새로운 방법과 가능성에 대해서 이야기합니다. 동작하는 예제 코드를 통해 페이징 된 데이터를 가져오는 몇몇 사례들과 방법을 살펴볼 수 있습니다."
  ),
  new ScheduleModel(
      name: "안세원",
      title: "지금은 ConstraintLayout 시대",
      time: "13:55-14:40",
      avatarUrl: "https://droidknights.github.io/2018/images/Profile/s4.png",
      contents: "Guide, Chain 등에서 부터 최신 업데이트된 기능까지! 혼자 알기 아까운 ConstraintLayout, 복잡한 구조도 한방에 멋지게!"
  ),
  new ScheduleModel(
      name: "박상권",
      title: "Firebase Dynamic Link로 사용자 유입시키기",
      time: "14:55-15:20",
      avatarUrl: "https://droidknights.github.io/2018/images/Profile/s5.png",
      contents: "사용자가 컨텐츠/상품을 공유할때 우리서비스로 효율적으로 유입시킬수 있는 방법에 대해 소개하고, 이를 추천인/프로모션에 활용하는 서비스에서 효율적으로 적용할 수 있는 방법에 대해서 소개합니다. Android뿐만 아니라 iOS, Web에서도 공통으로 사용할 수 있어 모든 개발자들의 개발시간을 단축시켜 줍니다."
  ),
  new ScheduleModel(
      name: "노재춘",
      title: "RxJava 적용 팁과 트러블 슈팅",
      time: "15:35-16:20",
      avatarUrl: "https://droidknights.github.io/2018/images/Profile/s6.png",
      contents: "RxJava를 적용해보면 예상과는 달리 동작하는 부분도 있고, 잘 될 거 같은데 잘 안 되는 부분이 있습니다. Retry 방법, 스케줄러, 사이드 이펙트를 줄이는 방법, 구독 제거와 관련한 문제 등 개발하면서 신경써야 하는 여러 이슈에 대해서 짚어보고 RxJava를 좀 더 잘 활용할 수 있는 방법을 찾아보려고 합니다."
  ),
  new ScheduleModel(
      name: "정경호",
      title: "Android Test",
      time: "16:35-17:00",
      avatarUrl: "https://droidknights.github.io/2018/images/Profile/s7.png",
      contents: "누구나 다 알고는 있지만 잘 하지 않게 된다는 테스트에 대해 이야기합니다. 안드로이드 앱 개발할 때 좋은 테스트를 작성하는 방법과 유지보수 및 Testable 구조, Test pattern 들에 이야기합니다."
  ),
  new ScheduleModel(
      name: "강사룡",
      title: "내가 안드로이드 개발자가 되었을 때 아무도 알려주지 않은 것들",
      time: "17:15-18:00",
      avatarUrl: "https://droidknights.github.io/2018/images/Profile/s8_2.png",
      contents: "중급 개발자 이후에 걸어야하는 고독한 길.. 빠른 성장 속도를 유지하기 위한 제언. 그리고 이제는 대세가 된 MVP와 MVVM를 현업 프로젝트에서 적용한 예와 적용시 주의해야할 점."
  ),
];

List<ScheduleModel> dummyData2 = [
  new ScheduleModel(
      name: "우명인",
      title: "Kotlin Sealed Class를 이용한 뷰상태 관리",
      time: "10:15-11:00",
      avatarUrl: "https://droidknights.github.io/2018/images/Profile/s_no.png",
      contents: "Android는 UI 관련 작업이 많고, 이는 상태가 있고 그 상태를 사용자에게 표현하는 작업입니다. 하지만 상태 관리는 만만치 않습니다. 이런 상태를 Kotlin의 Sealed Class 를 사용해 보다 쉽고 간결하고 안전하게 관리하는 방법을 공유합니다."
  ),
  new ScheduleModel(
      name: "김범준",
      title: "What is the difference between List, Sequence, Observable?",
      time: "11:15-12:00",
      avatarUrl: "https://droidknights.github.io/2018/images/Profile/s2_2.png",
      contents: "낯설거나 혹은 익숙하게 사용하더라도 실제 구현 혹은 실제 chaining이 어떻게 동작하는건지 자세하게 모르시는 분들이 많습니다. chaining하여 사용하는 List,Sequence,Observable이 실제 어떻게 구현되어 있고 chaining되는지 각각을 구현코드단까지 분석하여 들어가 이해하고 차이점을 알아봅시다"
  ),
  new ScheduleModel(
      name: "김종식",
      title: "Best Practice on Android Instant Apps",
      time: "13:15-13:40",
      avatarUrl: "https://droidknights.github.io/2018/images/Profile/s3_2.png",
      contents: "만약 내가 개발한 앱이 설치없이 동작한다면? 설치 없이 네이티브앱의 사용 경험을 제공할 수 있는 인스턴트앱의 개발과정을 환경 설정 구성부터 배포까지 준비하였습니다. 이를 작업하면서 알게 된 많은 내용과 배포를 하면서 경험했던 유의사항, 인스턴트앱을 이용하여 시도했던 다양한 경험과 기존 프로젝트에 함께 적용하는 방법 등을 공유하려고 합니다."
  ),
  new ScheduleModel(
      name: "도창욱",
      title: "Kotlin 코루틴은 어떻게 동작하는가?",
      time: "13:55-14:40",
      avatarUrl: "https://droidknights.github.io/2018/images/Profile/s4_2.png",
      contents: "동시성을 처리하기 위해 멀티스레드 기반의 코드를 작성하는 것은 생각보다 많은 주의를 요하며, 특히 스케쥴링을 위한 코드 작성은 더더욱 그렇습니다. 코루틴은 이러한 작업에 있어서 좀 더 쉽게 코드를 작성할 수 있도록 합니다. 코루틴이 어떤 것이고, 코틀린은 이를 어떻게 구현하였는지와 JVM과 안드로이드의 관점에서 어떻게 동작하는 살펴보도록 하겠습니다."
  ),
  new ScheduleModel(
      name: "장혁재",
      title: "Google Mobile Vision과 OpenCV로 card.io를 확장한 범용 카드번호인식 개발",
      time: "14:55-15:20",
      avatarUrl: "https://droidknights.github.io/2018/images/Profile/s5_2.png",
      contents: "널리 알려져 있고 LINE에서도 사용중인 신용카드 인식 오픈소스로 card.io가 있습니다. 다만 card.io는 숫자가 양각되어 있는 신용카드만을 인식하고 최근 유행하는 캐릭터 신용카드처럼 숫자가 인쇄된 신용카드를 인식하지 못하는 한계가 있습니다. Google Mobile Vision과 OpenCV를 활용하여 이런 숫자가 인쇄된 신용카드는 물론, 멤버쉽 카드와 같은 범용 카드에서 카드 번호와 바코드를 인식하는 라이브러리를 개발한 경험을 나누고자 합니다."
  ),
  new ScheduleModel(
      name: "장인수",
      title: "Travis-ci 를 이용한 CI/CD 와 도커를 이용한 Jenkins for Android 구성하기",
      time: "15:35-16:20",
      avatarUrl: "https://droidknights.github.io/2018/images/Profile/s6_2.png",
      contents: "Travis CI 를 이용해서 Github 에 소스에 변경사항이 생기면 Buiild & Test 를 통해서 결과를 slack 에 알림을 주는 방법을 설명합니다. 많은 회사에서 이미 사용중인 Jenkins를 Docker로 이용해서 Android CI/CD를 하는 방법을 소개하고자 합니다."
  ),
  new ScheduleModel(
      name: "김용준",
      title: "Android Studio에서 Vim 사용과 IdeaVim 커스터마이징 (code refactoring, adb, git)",
      time: "16:35-17:00",
      avatarUrl: "https://droidknights.github.io/2018/images/Profile/s7_2.png",
      contents: "안드로이드 앱을 개발할 때 사용하는 IDE(Android Studio) 장점과 Vim의 장점을 섞어 개발하면 코드 생산성을 높이는데 도움을 줍니다. 오픈소스 JetBrains Plugin ideaVim을 커스터마이징한 경험을 공유합니다."
  ),
  new ScheduleModel(
      name: "황성현",
      title: "Practical FP in Kotlin",
      time: "17:15-18:00",
      avatarUrl: "https://droidknights.github.io/2018/images/Profile/s8.png",
      contents: "안드로이드 앱을 개발할 경우 프레임워크의 한계 또는 작업의 특성상 FP 구현에 어려움을 겪게 된다. 본 발표는 경험을 바탕으로 최대한 프로젝트의 코드베이스를 FP 형태로 작성할 수 있는 실질적인 조언과 생각을 공유하고자 한다. 이 발표를 통해 안드로이드 개발 과정에서 FP 스타일 코드 작성의 어려움이 해소되었으면 한다."
  ),
];