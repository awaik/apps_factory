import 'package:apps_factory/app/domain/artist/image_size.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_image.g.dart';

//Todo move serialisation to Dto
@JsonSerializable(explicitToJson: true)
class ApiImage {
  @JsonKey(name: '#text')
  final String link;
  final ImageSize size;

  ApiImage({this.link = '', this.size = ImageSize.small});

  factory ApiImage.fromJson(Map<String, dynamic> json) => _$ApiImageFromJson(json);

  Map<String, dynamic> toJson() => _$ApiImageToJson(this);
}
