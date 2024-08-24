part of 'get_tenant_bill_bloc.dart';

@immutable
sealed class GetTenantBillEvent {}

final class FetchRequest extends GetTenantBillEvent {}
