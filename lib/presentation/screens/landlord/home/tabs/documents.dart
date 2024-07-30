import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renttas/application/get_document/getdocument_bloc.dart';
import 'package:renttas/infrastructure/repository/delete_document/repo.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/add_docs/add_docs.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/viewdoc.dart';
import 'package:renttas/presentation/screens/landlord/home/tabs/widgets/floating_button.dart';
import 'package:renttas/presentation/widgets/alerts/alerts.dart';
import 'package:renttas/presentation/widgets/navigators/navs.dart';

class HomeDocumentsTab extends StatelessWidget {
  const HomeDocumentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomTabsFloatingButton(
        text: 'Doucments',
        onTap: () => customNavPush(context, const AddDocumentsScreen()),
      ),
      body: BlocBuilder<GetdocumentBloc, GetdocumentState>(
        builder: (context, state) {
          if (state is DocFetchDone) {
            return GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio:
                    0.90, // Adjust the child aspect ratio as needed
              ),
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => customNavPush(
                      context,
                      ViewDocumentScreen(
                        docDes: state.list[index].description ?? "description",
                        docimage: state.list[index].imageName,
                        docname: state.list[index].docname,
                      )),
                  child: Card(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                            child: Image.asset('assets/images/onboarding2.png'),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.list[index].docname,
                                    style: GoogleFonts.rubik(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 110,
                                    child: Text(
                                      state.list[index].description ??
                                          'description',
                                      style: GoogleFonts.rubik(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  alertsWithButtons(
                                      context, "Do you want to delete..?", () {
                                    DeleteDocumentRepo.delete(
                                        state.list[index].id, context);
                                    Navigator.pop(context);
                                  }, "Detele");
                                },
                                icon: Icon(
                                  CupertinoIcons.delete_simple,
                                  color: Colors
                                      .red, // Replace with your defined color
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is ErrorState) {
            return Text('Doucments Not found!');
          }
          return Center(
            child: Text('Doucments Not found!'),
          );
        },
      ),
    );
  }
}
