class FlightInfo {
  final String title;
  final String flightNumber;
  final String status;

  FlightInfo({required this.title, required this.flightNumber, required this.status});

  factory FlightInfo.fromJson(Map<String, dynamic> json) {
    return FlightInfo(
      title: json['title'] as String,
      flightNumber: json['flightNumber'] as String,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'flightNumber': flightNumber,
      'status': status,
    };
  }
}
