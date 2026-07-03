import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Home/home_screen.dart';
import '../../Tournaments/tournaments_screen.dart';
import '../../Results/results_screen.dart';
import '../../Camps/camps_screen.dart';
import '../../Profile/profile_screen.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> screens = [
    const HomeScreen(),
    const TournamentsScreen(),
    const ResultsScreen(),
    const CampsScreen(),
    const ProfileScreen(),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
