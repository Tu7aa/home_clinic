import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/modules/view/main_screen/cubit/cubit.dart';
import 'package:homeclinic/modules/view/main_screen/cubit/states.dart';

class MainScreen extends StatelessWidget {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
      return BlocProvider(create: (context)=> MainScreenCubit(),
        child: BlocConsumer<MainScreenCubit, MainScreenStates>(
          listener: (context, state){},
          builder: (context, state){
            var mainCubit = MainScreenCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 0.0,
                elevation: 0.0,
              ),
              body: mainCubit.widget[mainCubit.currentIndex],
              bottomNavigationBar: CurvedNavigationBar(
                  backgroundColor: HexColor('#23b2ff'),
                  key: _bottomNavigationKey,
                  index: mainCubit.currentIndex,
                  height: 55,
                  items: <Widget>[
                    Icon(Icons.home_outlined, size: 25),
                    Icon(Icons.schedule, size: 25),
                    Icon(Icons.chat_sharp, size: 25),
                    Icon(Icons.person, size: 25),
                  ],
                  onTap: (index){
                    mainCubit.changeIndex(index);
                  }
              ),
            );
          },
        ),
      );
  }
}

