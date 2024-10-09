import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phoenix/screens/screens_bottom_navigation_bar/home_screen.dart';
import 'package:phoenix/screens/screens_bottom_navigation_bar/here_location_screen.dart';
import 'package:phoenix/screens/screens_bottom_navigation_bar/map_type.dart';
import 'package:phoenix/screens/screens_bottom_navigation_bar/store.dart';




class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _currentIndex = 0;
  List<Widget> screens = [
    const AlertsScreen(),
    const HereLocationScreen(),
    const StoreScreen(),
    const MapTypeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // locale: state.locale,
          // localizationsDelegates: const [
          //   S.delegate,
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          // ],
          // supportedLocales: S.delegate.supportedLocales,
          home: Scaffold(
            body: screens[_currentIndex],
            bottomNavigationBar: NavigationBarTheme(
              data: NavigationBarThemeData(
                labelTextStyle: WidgetStateProperty.all(
                    const TextStyle(color: Colors.white,fontFamily: "Rubik")
                ),
              ),
              child: BottomNavigationBar(
                onTap: (int index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
               showSelectedLabels: false,
                currentIndex: _currentIndex,
                items: [
                  BottomNavigationBarItem(
                    icon:  Column(
                      children: [
                        const FaIcon(FontAwesomeIcons.house,color: Colors.black,),
                       const SizedBox(height: 8),
                        if(_currentIndex ==0) _buildDot()
                      ],
                    ),
                    label:''
                  ),
                  BottomNavigationBarItem(
                    icon:  Column(
                      children: [
                        const FaIcon(FontAwesomeIcons.locationArrow,color: Colors.black,),
                        const SizedBox(height: 8),
                        if(_currentIndex ==1) _buildDot()
                      ],
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon:  Column(
                      children: [
                        const FaIcon(FontAwesomeIcons.cartPlus,color: Colors.black,),
                        const SizedBox(height: 8),
                        if(_currentIndex ==2) _buildDot()
                      ],
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        const FaIcon(FontAwesomeIcons.layerGroup,color: Colors.black,),
                        const SizedBox(height: 8),
                        if(_currentIndex ==3) _buildDot()
                      ],
                    ),
                    label:  '',
                  ),
                ],
              ),
            ),
          ),
        );
  }
  Widget _buildDot() {
    return Container(
      width: 8,
      height: 8,
      decoration:const  BoxDecoration(
        color: Colors.indigo, // You can change the dot color here
        shape: BoxShape.circle,
      ),
    );
  }
}