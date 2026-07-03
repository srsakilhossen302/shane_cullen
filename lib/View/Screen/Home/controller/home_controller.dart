import 'package:get/get.dart';
import '../model/event_model.dart';

class HomeController extends GetxController {
  var selectedCategory = 'Tournaments'.obs;
  var searchQuery = ''.obs;

  // Mock list of events that can easily be loaded from an API later
  final RxList<EventModel> events = <EventModel>[
    EventModel(
      id: '1',
      title: 'National Championship 2026',
      imageUrl: 'assets/images/martial_arts_sunset.png',
      date: 'April 20-22, 2026',
      location: 'Dhaka, Bangladesh',
      fee: 'USD 2000',
      prize: 'USD 50,000',
      isOpen: false,
      category: 'Tournaments',
      isFeatured: true,
    ),
    EventModel(
      id: '2',
      title: 'City Open',
      imageUrl: 'assets/images/soccer_balls.png',
      date: 'April 25-26, 2026',
      location: 'Chittagong, Bangladesh',
      fee: 'USD 1500',
      prize: 'USD 25,000',
      isOpen: true,
      category: 'Tournaments',
      isFeatured: false,
    ),
    EventModel(
      id: '3',
      title: 'Inter-University',
      imageUrl: 'assets/images/swimmer.png',
      date: 'May 5-7, 2026',
      location: 'Sylhet, Bangladesh',
      fee: 'USD 1000',
      prize: 'USD 30,000',
      isOpen: true,
      category: 'Tournaments',
      isFeatured: false,
    ),
    EventModel(
      id: '4',
      title: 'Elite Martial Arts Camp',
      imageUrl: 'assets/images/martial_arts_sunset.png',
      date: 'June 10-15, 2026',
      location: 'Cox\'s Bazar, Bangladesh',
      fee: 'USD 500',
      prize: 'USD 5,000',
      isOpen: true,
      category: 'Camps',
      isFeatured: true,
    ),
    EventModel(
      id: '5',
      title: 'Youth Soccer Camp',
      imageUrl: 'assets/images/soccer_balls.png',
      date: 'June 20-25, 2026',
      location: 'Dhaka, Bangladesh',
      fee: 'USD 300',
      prize: 'N/A',
      isOpen: true,
      category: 'Camps',
      isFeatured: false,
    ),
    EventModel(
      id: '6',
      title: 'Advanced Swimmer Camp',
      imageUrl: 'assets/images/swimmer.png',
      date: 'July 1-5, 2026',
      location: 'Sylhet, Bangladesh',
      fee: 'USD 400',
      prize: 'N/A',
      isOpen: false,
      category: 'Camps',
      isFeatured: false,
    ),
    EventModel(
      id: '7',
      title: 'Sports Medicine Seminar',
      imageUrl: 'assets/images/swimmer.png',
      date: 'July 15, 2026',
      location: 'Dhaka, Bangladesh',
      fee: 'Free',
      prize: 'N/A',
      isOpen: true,
      category: 'Seminars',
      isFeatured: true,
    ),
    EventModel(
      id: '8',
      title: 'Tactical Coaching Seminar',
      imageUrl: 'assets/images/soccer_balls.png',
      date: 'August 10, 2026',
      location: 'Chittagong, Bangladesh',
      fee: 'USD 100',
      prize: 'N/A',
      isOpen: true,
      category: 'Seminars',
      isFeatured: false,
    ),
  ].obs;

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  // Gets the featured event for the currently selected category
  EventModel? get featuredEvent {
    final categoryEvents = events.where((e) => e.category == selectedCategory.value).toList();
    if (categoryEvents.isEmpty) return null;
    return categoryEvents.firstWhere(
      (e) => e.isFeatured == true,
      orElse: () => categoryEvents.first,
    );
  }

  // Gets the list of events filtered by category and search query
  List<EventModel> get filteredEvents {
    return events.where((event) {
      final matchesCategory = event.category == selectedCategory.value;
      final query = searchQuery.value.toLowerCase().trim();
      final matchesSearch = query.isEmpty ||
          (event.title?.toLowerCase().contains(query) ?? false) ||
          (event.location?.toLowerCase().contains(query) ?? false);
      return matchesCategory && matchesSearch;
    }).toList();
  }
}

