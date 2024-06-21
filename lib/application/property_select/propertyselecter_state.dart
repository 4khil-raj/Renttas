part of 'propertyselecter_bloc.dart';

@immutable
sealed class PropertyselecterState {}

final class PropertyselecterInitial extends PropertyselecterState {}

final class PropertySelectedState extends PropertyselecterState {
  final String selectedProperty;
  final String id;
  PropertySelectedState({required this.id, required this.selectedProperty});
}
