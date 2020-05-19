import 'package:json_annotation/json_annotation.dart';

part "meta.g.dart";

@JsonSerializable()
class Meta {
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "message")
  String message;

  Meta({this.status, this.message});

  factory Meta.fromJson(Map<String, dynamic> json) =>
      _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);

}