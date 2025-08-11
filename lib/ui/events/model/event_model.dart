class MonthEvents {
  MonthEvents({required this.month, required this.events});

  factory MonthEvents.fromJson(final Map<String, dynamic> json) => MonthEvents(
    month: json['month'],
    events:
        (json['events'] as List)
            .map((final event) => EventModel.fromJson(event))
            .toList(),
  );
  final String month;
  final List<EventModel> events;

  Map<String, dynamic> toJson() => {
    'month': month,
    'events': events.map((final e) => e.toJson()).toList(),
  };
}

class EventModel {
  EventModel({
    required this.eventName,
    required this.location,
    required this.dateTime,
    required this.organizerName,
    required this.eventImgUrl,
    required this.isSaved,
    this.daysToGo,
  });

  factory EventModel.fromJson(final Map<String, dynamic> json) => EventModel(
    eventName: json['eventName'],
    location: json['location'],
    dateTime: json['dateTime'],
    organizerName: json['organizerName'],
    eventImgUrl: json['eventImgUrl'],
    isSaved: json['isSaved'],
    daysToGo: json['daysToGo'],
  );
  final String eventName;
  final String location;
  final int dateTime; // epoch in ms
  final String organizerName;
  final String eventImgUrl;
  final bool isSaved;
  final int? daysToGo;

  String get date => _formatDate(dateTime);
  String get time => _formatTime(dateTime);

  Map<String, dynamic> toJson() => {
    'eventName': eventName,
    'location': location,
    'dateTime': dateTime,
    'organizerName': organizerName,
    'eventImgUrl': eventImgUrl,
    'isSaved': isSaved,
    if (daysToGo != null) 'daysToGo': daysToGo,
  };

  static String _formatDate(final int epochMs) {
    final date = DateTime.fromMillisecondsSinceEpoch(epochMs);
    return '${_weekday(date.weekday)}, ${date.day} ${_month(date.month)}';
  }

  static String _formatTime(final int epochMs) {
    final date = DateTime.fromMillisecondsSinceEpoch(epochMs);
    final hour = date.hour > 12 ? date.hour - 12 : date.hour;
    final amPm = date.hour >= 12 ? 'PM' : 'AM';
    return "${hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')} $amPm";
  }

  static String _weekday(final int day) {
    const weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return weekdays[day - 1];
  }

  static String _month(final int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }
}
