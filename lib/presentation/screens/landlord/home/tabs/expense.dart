import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:renttas/application/fetch_expense/fetchexpense_bloc.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_expense/expense.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/widgets/floating_button.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class HomeExpenseTab extends StatelessWidget {
  const HomeExpenseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomTabsFloatingButton(
        text: 'Expense',
        onTap: () => customNavPush(context, AddExpenseScreen()),
      ),
      body: BlocBuilder<FetchexpenseBloc, FetchexpenseState>(
        builder: (context, state) {
          if (state is FetchExpenseSuccessState) {
            return Expanded(
              child: ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    DateTime dateTime =
                        DateTime.parse(state.list[index].createdAt.toString());
                    DateFormat formatter = DateFormat('dd MMM');
                    String formattedDate = formatter.format(dateTime);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black87),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                              height: 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 35,
                                child: Text(
                                  '$formattedDate',
                                  // state.list[index].createdAt,
                                  style: GoogleFonts.inter(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                    state.list[index].name,
                                    style: GoogleFonts.inter(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Expense date:",
                                      style: GoogleFonts.inter(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      state.list[index].expensesDate.month
                                          .toString(),
                                      style: GoogleFonts.inter(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '/',
                                      style: GoogleFonts.inter(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      state.list[index].expensesDate.day
                                          .toString(),
                                      style: GoogleFonts.poppins(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 11,
                            ),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(color: Colors.red[100]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 80,
                                  child: Text(
                                    ' ${state.list[index].category}',
                                    style: GoogleFonts.urbanist(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Container(
                            //   decoration: BoxDecoration(color: Colors.green[50]),
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(8.0),
                            //     child: Text(
                            //       " ₹ ${state.list[index].totalAmount.toString()}",
                            //       style: GoogleFonts.urbanist(
                            //         fontSize: 15,
                            //         fontWeight: FontWeight.w700,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 30,
                            ),
                            Spacer()
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }
          return Center(
            child: Text('Expense Not found!'),
          );
        },
      ),
    );
  }
}
