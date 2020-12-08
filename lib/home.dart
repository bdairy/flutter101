import 'package:MyFirstApp/home-tabs/home-tab.dart';
import 'package:MyFirstApp/home-tabs/popular-movies.dart';
import 'package:MyFirstApp/home-tabs/settings.dart';
import 'package:MyFirstApp/home-tabs/upcoming.dart';
import 'package:MyFirstApp/models/genre.dart';
import 'package:MyFirstApp/providers/genre-provider.dart';
import 'package:MyFirstApp/providers/tabs-provider.dart';
import 'package:MyFirstApp/system-classes/system-colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _tabs = Provider.of<TabsProvider>(context);
    final _genreProvider = Provider.of<GenreProvider>(context, listen: false);
    List<Map<String, dynamic>> _pages = [
      {
        'name': 'Home',
        'widget': HomeTap(),
      },
      {
        'name': 'Popular Movies',
        'widget': PopularMoviesTap(),
      },
      {
        'name': 'Upcoming',
        'widget': UpcomingMoviesTap(),
      },
      {
        'name': 'Settings',
        'widget': SettingsTap(),
      },
    ];
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 14,
          backgroundColor: Colors.grey[100],
          currentIndex: _tabs.selectedTab,
          onTap: (value) {
            _genreProvider.selectGenre(null);
            _tabs.selectTab(value);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: SystemColors.primarylight,
              ),
              label: 'Home',
              activeIcon: Icon(
                Icons.home,
                color: SystemColors.accent,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                color: SystemColors.primarylight,
              ),
              label: 'Popular',
              activeIcon: Icon(
                Icons.star,
                color: SystemColors.accent,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.new_releases,
                color: SystemColors.primarylight,
              ),
              activeIcon: Icon(
                Icons.new_releases,
                color: SystemColors.accent,
              ),
              label: 'Upcoming',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.settings,
                color: SystemColors.accent,
              ),
              icon: Icon(
                Icons.settings,
                color: SystemColors.primarylight,
              ),
              label: 'Settings',
            ),
          ],
        ),
        appBar: AppBar(
          title: Text(_pages[_tabs.selectedTab]['name']),
          actions: [
            FlatButton(
              onPressed: () {},
              child: Text('Logout'),
            ),
          ],
        ),
        body: _pages[_tabs.selectedTab]['widget']);
  }
}
