import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/model/history_water.dart';
import 'package:water_resources_application/provider/user_provider.dart';

class WaitApproval extends StatelessWidget {
  final List<String> _names = [
    'Liam',
    'Noah',
    'Oliver',
    'William',
    'Elijah',
    'James',
    'Benjamin',
    'Lucas',
    'Mason',
    'Ethan',
    'Alexander'
  ];

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return FutureBuilder(
        future: getHistoryWater(userProvider.userProfile.uid.toString(), false),
        builder:
            (BuildContext context, AsyncSnapshot<List<HistoryWater>> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text('Error , Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (_, i) {
                var name = snapshot.data![i];
                return ListTile(
                  title: Text(name.typeWater.toString()),
                  subtitle: Text(
                      "${name.nameProvince} ${name.nameDistrict} ${name.nameSubdistrict}"),
                  // <Add>
                  trailing: PopupMenuButton(
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: 'edit',
                          child: Text('Edit'),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: Text('Delete'),
                        )
                      ];
                    },
                    onSelected: (String value) {
                      print('You Click on po up menu item');
                    },
                  ),
                  // </Add>
                );
              },
              itemCount: snapshot.data!.length,
            );
          }

          return Center(
            child: CircularProgressIndicator(
              color: Colors.indigo[900],
              strokeWidth: 5,
            ),
          );
        });
  }
}
