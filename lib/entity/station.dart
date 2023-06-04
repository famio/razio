// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xml/xml.dart';

// part 'station.freezed.dart';

class Station {
  Station._(this.id, this.name);

  factory Station.fromElement(XmlElement stationElement) {
    return Station._(
      stationElement.findElements('id').first.innerText,
      stationElement.findElements('name').first.innerText,
    );
  }
  String id;
  String name;
}
