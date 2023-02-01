import 'package:xml/xml.dart';

class Program {
  Program._(
    this.stationId,
    this.stationName,
    this.id,
    this.startTime,
    this.endTime,
    this.title,
    this.img,
  );

  factory Program.from({
    required String stationId,
    required String stationName,
    required XmlElement programElement,
  }) {
    return Program._(
      stationId,
      stationName,
      programElement.attributes
          .firstWhere((p0) => p0.name == XmlName('id'))
          .value,
      programElement.attributes
          .firstWhere((p0) => p0.name == XmlName('ft'))
          .value,
      programElement.attributes
          .firstWhere((p0) => p0.name == XmlName('to'))
          .value,
      programElement.findElements('title').first.text,
      programElement.findElements('img').first.text,
    );
  }

  String stationId;
  String stationName;
  String id;
  String startTime;
  String endTime;
  String title;
  String img;

  late String startTimeWithT =
      '${startTime.substring(0, 8)}T${startTime.substring(8)}';
  late String endTimeWithT =
      '${endTime.substring(0, 8)}T${endTime.substring(8)}';
  late final startDate = DateTime.parse(startTimeWithT);
  late final endDate = DateTime.parse(endTimeWithT);
}
