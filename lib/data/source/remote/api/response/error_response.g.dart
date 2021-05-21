// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ErrorResponse _$_$_ErrorResponseFromJson(Map<String, dynamic> json) {
  return _$_ErrorResponse(
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_ErrorResponseToJson(_$_ErrorResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };

_$_Error _$_$_ErrorFromJson(Map<String, dynamic> json) {
  return _$_Error(
    code: json['code'] as int?,
    message: json['message'] as String?,
    field: json['field'] as String?,
  );
}

Map<String, dynamic> _$_$_ErrorToJson(_$_Error instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'field': instance.field,
    };
