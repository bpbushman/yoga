import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return DummyOne();
      case 1:
        return DummyTwo();
      case 2:
        return DummyThree();
      default:
        return DummyOne();
    }
  }

  @override
  Widget build(BuildContext context) {
    print('hello from home!');
    return ViewModelBuilder.reactive(
      //disposeViewModel: false,
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Scaffold(
          bottomNavigationBar: Container(
            height: 48,
            child: BottomNavigationBar(
              iconSize: 18,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              type: BottomNavigationBarType.fixed,
              currentIndex: model.currentIndex,
              onTap: model.setIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  title: Text('notifications'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  title: Text('feed'),
                ),
              ],
            ),
          ),
          body: getViewForIndex(model.currentIndex),
        ),
      ),
    );
  }
}

class DummyOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('hello from dummy one');
    return Center(
      child: Text('Home'),
    );
  }
}

class DummyTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('hello from dummy two');
    return Center(
      child: Text('notifications'),
    );
  }
}

class DummyThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('hello from dummy three');
    return Center(
      child: Text('announcements'),
    );
  }
}
