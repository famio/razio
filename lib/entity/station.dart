// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xml/xml.dart';

// part 'station.freezed.dart';

class Station {
  Station._(this.id, this.name);

  factory Station.fromElement(XmlElement stationElement) {
    return Station._(
      stationElement.findElements('id').first.text,
      stationElement.findElements('name').first.text,
    );
  }
  String id;
  String name;
}
