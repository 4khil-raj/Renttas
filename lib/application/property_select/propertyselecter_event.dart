part of 'propertyselecter_bloc.dart';

@immutable
sealed class PropertyselecterEvent {}

final class PropertySelectEvent extends PropertyselecterEvent {
  final String property;
  final String id;
  final String subpropertyId;

  PropertySelectEvent(
      {required this.subpropertyId, required this.id, required this.property});
}
