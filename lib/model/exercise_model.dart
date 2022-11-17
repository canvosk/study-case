import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ExerciseModel {
  String? name;
  String? type;
  String? muscle;
  String? equipment;
  String? diffuculty;
  String? instructions;
  ExerciseModel({
    this.name,
    this.type,
    this.muscle,
    this.equipment,
    this.diffuculty,
    this.instructions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'type': type,
      'muscle': muscle,
      'equipment': equipment,
      'diffuculty': diffuculty,
      'instructions': instructions,
    };
  }

  factory ExerciseModel.fromMap(Map<String, dynamic> map) {
    return ExerciseModel(
      name: map['name'] != null ? map['name'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      muscle: map['muscle'] != null ? map['muscle'] as String : null,
      equipment: map['equipment'] != null ? map['equipment'] as String : null,
      diffuculty:
          map['diffuculty'] != null ? map['diffuculty'] as String : null,
      instructions:
          map['instructions'] != null ? map['instructions'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciseModel.fromJson(String source) =>
      ExerciseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
