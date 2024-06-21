part of 'propertyselecter_bloc.dart';

@immutable
sealed class PropertyselecterEvent {}

final class PropertySelectEvent extends PropertyselecterEvent {
  final String property;
  final String id;

  PropertySelectEvent({required this.id, required this.property});
}
