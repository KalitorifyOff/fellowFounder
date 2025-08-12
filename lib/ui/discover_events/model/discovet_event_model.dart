import 'package:intl/intl.dart';

class Domain {
  Domain({required this.id, required this.domainName, required this.events});

  factory Domain.fromJson(final Map<String, dynamic> json) => Domain(
    id: json['id'] as int,
    domainName: json['domainName'] as String,
    events:
        (json['events'] as List)
            .map((final e) => Event.fromJson(e as Map<String, dynamic>))
            .toList(),
  );
  final int id;
  final String domainName;
  final List<Event> events;

  Map<String, dynamic> toJson() => {
    'id': id,
    'domainName': domainName,
    'events': events.map((final e) => e.toJson()).toList(),
  };
}

class Event {
  Event({
    required this.id,
    required this.name,
    required this.profession,
    required this.dateTime,
    required this.date,
    required this.time,
    required this.address,
    required this.eventDetails,
    required this.organizerName,
    required this.organizedBy,
    required this.isJoined,
    required this.isSaved,
    required this.organizerPic,
  });

  factory Event.fromJson(final Map<String, dynamic> json) {
    final dateTimeValue = json['dateTime'] as int;
    final converted = _convertEpsonDate(dateTimeValue);

    return Event(
      id: json['id'] as int,
      name: json['name'] as String,
      profession: json['profession'] as String,
      dateTime: dateTimeValue,
      date: converted['date']!,
      time: converted['time']!,
      address: json['address'] as String,
      eventDetails: json['eventDetails'] as String,
      organizerName: json['organizerName'] as String,
      organizedBy: json['organizedBy'] as String,
      isJoined: json['isJoined'] as bool,
      isSaved: json['isSaved'] as bool,
      organizerPic: json['organizerImage'] as String,
    );
  }
  final int id;
  final String name;
  final String profession;
  final int dateTime; // Epoch format
  final String date; // "Sunday, 29 Jun, 2025"
  final String time; // "07:00 PM"
  final String address;
  final String eventDetails;
  final String organizerName;
  final String organizedBy;
  final bool isJoined;
  final bool isSaved;
  final String organizerPic;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'profession': profession,
    'dateTime': dateTime,
    'date': date,
    'time': time,
    'address': address,
    'eventDetails': eventDetails,
    'organizerName': organizerName,
    'organizedBy': organizedBy,
    'isJoined': isJoined,
    'isSaved': isSaved,
    'organizerImage': organizerPic,
  };

  /// Converts Epoch to date and time strings
  static Map<String, String> _convertEpsonDate(final int epsonEpoch) {
    // If Epoch is in seconds, multiply by 1000
    final dateTime = DateTime.fromMillisecondsSinceEpoch(epsonEpoch);
    final dateFormat = DateFormat('EEEE, dd MMM, yyyy');
    final timeFormat = DateFormat('hh:mm a');
    return {
      'date': dateFormat.format(dateTime),
      'time': timeFormat.format(dateTime),
    };
  }
}
