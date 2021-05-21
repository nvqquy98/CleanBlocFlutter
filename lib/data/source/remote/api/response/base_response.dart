import 'package:freezed_annotation/freezed_annotation.dart';
import '../error/parse_json_exception.dart';

part 'base_response.freezed.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final T data;
  final Meta? meta;

  BaseResponse({@JsonKey(name: 'data') required this.data, @JsonKey(name: 'meta') this.meta});

  factory BaseResponse._fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);

  // parse response and handle exception
  static Future<BaseResponse<T>> parseResponse<T>(
      response, T Function(Map<String, dynamic>) parse) async {
    try {
      return BaseResponse._fromJson(response, (Object? json) {
        return parse.call(json as Map<String, dynamic>);
      });
    } catch (e) {
      throw ParseJsonException('Unable to parse response as JSON', e);
    }
  }
}

@freezed
class Meta with _$Meta {
  factory Meta({@JsonKey(name: 'pagy_info') PageInfo? pageInfo}) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
class PageInfo with _$PageInfo {
  factory PageInfo({@JsonKey(name: 'next') int? next}) = _PageInfo;

  factory PageInfo.fromJson(Map<String, dynamic> json) =>
      _$PageInfoFromJson(json);
}
