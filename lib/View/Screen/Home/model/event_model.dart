class EventModel {
  final String? id;
  final String? imageUrl;
  final String? title;
  final String? date;
  final String? location;
  final String? fee;
  final String? prize;
  final bool? isOpen;
  final String? category;
  final bool? isFeatured;

  EventModel({
    this.id,
    this.imageUrl,
    this.title,
    this.date,
    this.location,
    this.fee,
    this.prize,
    this.isOpen,
    this.category,
    this.isFeatured,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] as String?,
      imageUrl: json['imageUrl'] as String?,
      title: json['title'] as String?,
      date: json['date'] as String?,
      location: json['location'] as String?,
      fee: json['fee'] as String?,
      prize: json['prize'] as String?,
      isOpen: json['isOpen'] as bool?,
      category: json['category'] as String?,
      isFeatured: json['isFeatured'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'date': date,
      'location': location,
      'fee': fee,
      'prize': prize,
      'isOpen': isOpen,
      'category': category,
      'isFeatured': isFeatured,
    };
  }
}
