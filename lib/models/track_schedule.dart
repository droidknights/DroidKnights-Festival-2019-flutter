class ScheduleModel{
  final String name;
  final String title;
  final String time;
  final String avatarUrl;
  final String contents;

  ScheduleModel({this.name, this.title, this.time, this.avatarUrl, this.contents});


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