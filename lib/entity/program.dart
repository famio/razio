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
}
