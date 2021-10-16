// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'recovery_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecoveryModel _$RecoveryModelFromJson(Map<String, dynamic> json) {
  return _RecoveryModel.fromJson(json);
}

/// @nodoc
class _$RecoveryModelTearOff {
  const _$RecoveryModelTearOff();

  _RecoveryModel call(
      {String? id,
      required String muscleGroup,
      required String muscleName,
      required String path,
      required Color color,
      required bool selectable}) {
    return _RecoveryModel(
      id: id,
      muscleGroup: muscleGroup,
      muscleName: muscleName,
      path: path,
      color: color,
      selectable: selectable,
    );
  }

  RecoveryModel fromJson(Map<String, Object> json) {
    return RecoveryModel.fromJson(json);
  }
}

/// @nodoc
const $RecoveryModel = _$RecoveryModelTearOff();

/// @nodoc
mixin _$RecoveryModel {
  String? get id => throw _privateConstructorUsedError;
  String get muscleGroup => throw _privateConstructorUsedError;
  String get muscleName => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  bool get selectable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecoveryModelCopyWith<RecoveryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecoveryModelCopyWith<$Res> {
  factory $RecoveryModelCopyWith(
          RecoveryModel value, $Res Function(RecoveryModel) then) =
      _$RecoveryModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String muscleGroup,
      String muscleName,
      String path,
      Color color,
      bool selectable});
}

/// @nodoc
class _$RecoveryModelCopyWithImpl<$Res>
    implements $RecoveryModelCopyWith<$Res> {
  _$RecoveryModelCopyWithImpl(this._value, this._then);

  final RecoveryModel _value;
  // ignore: unused_field
  final $Res Function(RecoveryModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? muscleGroup = freezed,
    Object? muscleName = freezed,
    Object? path = freezed,
    Object? color = freezed,
    Object? selectable = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      muscleGroup: muscleGroup == freezed
          ? _value.muscleGroup
          : muscleGroup // ignore: cast_nullable_to_non_nullable
              as String,
      muscleName: muscleName == freezed
          ? _value.muscleName
          : muscleName // ignore: cast_nullable_to_non_nullable
              as String,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      selectable: selectable == freezed
          ? _value.selectable
          : selectable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$RecoveryModelCopyWith<$Res>
    implements $RecoveryModelCopyWith<$Res> {
  factory _$RecoveryModelCopyWith(
          _RecoveryModel value, $Res Function(_RecoveryModel) then) =
      __$RecoveryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String muscleGroup,
      String muscleName,
      String path,
      Color color,
      bool selectable});
}

/// @nodoc
class __$RecoveryModelCopyWithImpl<$Res>
    extends _$RecoveryModelCopyWithImpl<$Res>
    implements _$RecoveryModelCopyWith<$Res> {
  __$RecoveryModelCopyWithImpl(
      _RecoveryModel _value, $Res Function(_RecoveryModel) _then)
      : super(_value, (v) => _then(v as _RecoveryModel));

  @override
  _RecoveryModel get _value => super._value as _RecoveryModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? muscleGroup = freezed,
    Object? muscleName = freezed,
    Object? path = freezed,
    Object? color = freezed,
    Object? selectable = freezed,
  }) {
    return _then(_RecoveryModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      muscleGroup: muscleGroup == freezed
          ? _value.muscleGroup
          : muscleGroup // ignore: cast_nullable_to_non_nullable
              as String,
      muscleName: muscleName == freezed
          ? _value.muscleName
          : muscleName // ignore: cast_nullable_to_non_nullable
              as String,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      selectable: selectable == freezed
          ? _value.selectable
          : selectable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecoveryModel extends _RecoveryModel with DiagnosticableTreeMixin {
  _$_RecoveryModel(
      {this.id,
      required this.muscleGroup,
      required this.muscleName,
      required this.path,
      required this.color,
      required this.selectable})
      : super._();

  factory _$_RecoveryModel.fromJson(Map<String, dynamic> json) =>
      _$_$_RecoveryModelFromJson(json);

  @override
  final String? id;
  @override
  final String muscleGroup;
  @override
  final String muscleName;
  @override
  final String path;
  @override
  final Color color;
  @override
  final bool selectable;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecoveryModel(id: $id, muscleGroup: $muscleGroup, muscleName: $muscleName, path: $path, color: $color, selectable: $selectable)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecoveryModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('muscleGroup', muscleGroup))
      ..add(DiagnosticsProperty('muscleName', muscleName))
      ..add(DiagnosticsProperty('path', path))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('selectable', selectable));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RecoveryModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.muscleGroup, muscleGroup) ||
                const DeepCollectionEquality()
                    .equals(other.muscleGroup, muscleGroup)) &&
            (identical(other.muscleName, muscleName) ||
                const DeepCollectionEquality()
                    .equals(other.muscleName, muscleName)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.selectable, selectable) ||
                const DeepCollectionEquality()
                    .equals(other.selectable, selectable)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(muscleGroup) ^
      const DeepCollectionEquality().hash(muscleName) ^
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(selectable);

  @JsonKey(ignore: true)
  @override
  _$RecoveryModelCopyWith<_RecoveryModel> get copyWith =>
      __$RecoveryModelCopyWithImpl<_RecoveryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RecoveryModelToJson(this);
  }
}

abstract class _RecoveryModel extends RecoveryModel {
  factory _RecoveryModel(
      {String? id,
      required String muscleGroup,
      required String muscleName,
      required String path,
      required Color color,
      required bool selectable}) = _$_RecoveryModel;
  _RecoveryModel._() : super._();

  factory _RecoveryModel.fromJson(Map<String, dynamic> json) =
      _$_RecoveryModel.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get muscleGroup => throw _privateConstructorUsedError;
  @override
  String get muscleName => throw _privateConstructorUsedError;
  @override
  String get path => throw _privateConstructorUsedError;
  @override
  Color get color => throw _privateConstructorUsedError;
  @override
  bool get selectable => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RecoveryModelCopyWith<_RecoveryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
