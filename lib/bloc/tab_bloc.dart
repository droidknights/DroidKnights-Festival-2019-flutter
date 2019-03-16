import 'package:rxdart/rxdart.dart';

import './bloc_provider.dart';

class TabBloc implements BlocBase{

  final _bottomTab = BehaviorSubject<int>();
  Observable<int> get $bottomTab => _bottomTab.stream;

  /*
   * start bottom tab from Info
   */
  TabBloc() {
    _bottomTab.add(0);
  }

  /*
   * change tab
   */
  void changeBottomTab(int index) {
    print(index);
    _bottomTab.add(index);
  }

  @override
  void dispose() {
  
  }
}