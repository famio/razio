import 'package:xml/xml.dart';

class Program {
  Program._(this.id, this.startTime, this.endTime, this.title, this.img);

  factory Program.fromElement(XmlElement programElement) {
    return Program._(
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
