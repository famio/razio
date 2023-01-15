// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Search _$$_SearchFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_Search',
      json,
      ($checkedConvert) {
        final val = _$_Search(
          data: $checkedConvert(
              'data',
              (v) => (v as List<dynamic>)
                  .map((e) => SearchProgram.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_SearchToJson(_$_Search instance) => <String, dynamic>{
      'data': instance.data,
    };

_$_SearchProgram _$$_SearchProgramFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_SearchProgram',
      json,
      ($checkedConvert) {
        final val = _$_SearchProgram(
          tsInNg: $checkedConvert('ts_in_ng', (v) => v as int),
          metas: $checkedConvert(
              'metas',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      SearchProgramMeta.fromJson(e as Map<String, dynamic>))
                  .toList()),
          tsOutNg: $checkedConvert('ts_out_ng', (v) => v as int),
          stationId: $checkedConvert('station_id', (v) => v as String),
          programUrl:
              $checkedConvert('program_url', (v) => Uri.parse(v as String)),
          status: $checkedConvert('status', (v) => v as String),
          startTimeS: $checkedConvert('start_time_s', (v) => v as String),
          genre: $checkedConvert('genre',
              (v) => SearchProgramGenre.fromJson(v as Map<String, dynamic>)),
          title: $checkedConvert('title', (v) => v as String),
          endTimeS: $checkedConvert('end_time_s', (v) => v as String),
          performer: $checkedConvert('performer', (v) => v as String),
          startTime:
              $checkedConvert('start_time', (v) => DateTime.parse(v as String)),
          endTime:
              $checkedConvert('end_time', (v) => DateTime.parse(v as String)),
          programDate: $checkedConvert('program_date', (v) => v as String),
          info: $checkedConvert('info', (v) => v as String),
          img: $checkedConvert('img', (v) => Uri.parse(v as String)),
          description: $checkedConvert('description', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'tsInNg': 'ts_in_ng',
        'tsOutNg': 'ts_out_ng',
        'stationId': 'station_id',
        'programUrl': 'program_url',
        'startTimeS': 'start_time_s',
        'endTimeS': 'end_time_s',
        'startTime': 'start_time',
        'endTime': 'end_time',
        'programDate': 'program_date'
      },
    );

Map<String, dynamic> _$$_SearchProgramToJson(_$_SearchProgram instance) =>
    <String, dynamic>{
      'ts_in_ng': instance.tsInNg,
      'metas': instance.metas,
      'ts_out_ng': instance.tsOutNg,
      'station_id': instance.stationId,
      'program_url': instance.programUrl.toString(),
      'status': instance.status,
      'start_time_s': instance.startTimeS,
      'genre': instance.genre,
      'title': instance.title,
      'end_time_s': instance.endTimeS,
      'performer': instance.performer,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      'program_date': instance.programDate,
      'info': instance.info,
      'img': instance.img.toString(),
      'description': instance.description,
    };

_$_SearchProgramMeta _$$_SearchProgramMetaFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_SearchProgramMeta',
      json,
      ($checkedConvert) {
        final val = _$_SearchProgramMeta(
          name: $checkedConvert('name', (v) => v as String),
          value: $checkedConvert('value', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_SearchProgramMetaToJson(
        _$_SearchProgramMeta instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

_$_SearchProgramGenre _$$_SearchProgramGenreFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_SearchProgramGenre',
      json,
      ($checkedConvert) {
        final val = _$_SearchProgramGenre(
          personality: $checkedConvert(
              'personality',
              (v) => v == null
                  ? null
                  : SearchProgramGenreData.fromJson(v as Map<String, dynamic>)),
          program: $checkedConvert(
              'program',
              (v) => v == null
                  ? null
                  : SearchProgramGenreData.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_SearchProgramGenreToJson(
        _$_SearchProgramGenre instance) =>
    <String, dynamic>{
      'personality': instance.personality,
      'program': instance.program,
    };

_$_SearchProgramGenreData _$$_SearchProgramGenreDataFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_SearchProgramGenreData',
      json,
      ($checkedConvert) {
        final val = _$_SearchProgramGenreData(
          id: $checkedConvert('id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_SearchProgramGenreDataToJson(
        _$_SearchProgramGenreData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
