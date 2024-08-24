part of 'get_tenant_bill_bloc.dart';

@immutable
sealed class GetTenantBillState {}

final class GetTenantBillInitial extends GetTenantBillState {}

final class FetchedTenantBillState extends GetTenantBillState {
  final List<FetchTenantBills> list;

  FetchedTenantBillState({required this.list});
}
