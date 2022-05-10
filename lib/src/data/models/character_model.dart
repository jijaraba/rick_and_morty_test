import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_riverpod/src/data/models/location_model.dart';
import 'package:rick_and_morty_riverpod/src/data/models/origin_model.dart';

part 'character_model.g.dart';

@JsonSerializable(createToJson: false)
class CharacterModel {
  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final OriginModel origin;
  final LocationModel location;
  final String image;
  final List<String> episode;
  final String url;
}


