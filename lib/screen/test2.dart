import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_resources_application/model/positions.dart';

class UserModel {
  final String id;
  final DateTime? createdAt;
  final String name;
  final String? avatar;

  UserModel(
      {required this.id, this.createdAt, required this.name, this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      createdAt:
          json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
      name: json["name"],
      avatar: json["avatar"],
    );
  }

  static List<UserModel> fromJsonList(List list) {
    return list.map((item) => UserModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.name}';
  }

  ///this method will prevent the override of toString
  bool? userFilterByCreationDate(String filter) {
    return this.createdAt?.toString().contains(filter);
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(UserModel? model) {
    return this.id == model?.id;
  }

  @override
  String toString() => name;
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<UserModel>(
      showSelectedItems: true,
      compareFn: (i, s) => i?.isEqual(s) ?? false,
      dropdownSearchDecoration: InputDecoration(
        labelText: "Person",
        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
        border: OutlineInputBorder(),
      ),
      onFind: (String? filter) => getData(filter),
      onChanged: (data) {
        print(data);
      },
      dropdownBuilder: _customDropDownExample,
      popupItemBuilder: _customPopupItemBuilderExample2,
    );
    //  FutureBuilder(
    //     future: getPositions(),
    //     builder: (context, AsyncSnapshot<List<JobPositions>> snapshot) {
    //       if (snapshot.hasError) {
    //         return Scaffold(
    //           appBar: AppBar(
    //             title: Text('Error'),
    //           ),
    //           body: Center(
    //             child: Text("${snapshot.error}"),
    //           ),
    //         );
    //       }
    //       if (snapshot.connectionState == ConnectionState.done) {
    //         print(snapshot.data![1].positions);

    //       }
    //       return Scaffold(
    //         body: Center(
    //           child: Center(child: CircularProgressIndicator()),
    //         ),
    //       );
    //     });
    //
  }
}

Widget _customDropDownExample(BuildContext context, UserModel? item) {
  if (item == null) {
    return Container();
  }

  return Container(
    child: (item.avatar == null)
        ? ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: CircleAvatar(),
            title: Text("No item selected"),
          )
        : ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: CircleAvatar(
                // this does not work - throws 404 error
                // backgroundImage: NetworkImage(item.avatar ?? ''),
                ),
            title: Text(item.name),
            subtitle: Text(
              item.createdAt.toString(),
            ),
          ),
  );
}

Widget _customPopupItemBuilderExample(
    BuildContext context, UserModel? item, bool isSelected) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8),
    decoration: !isSelected
        ? null
        : BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
    child: ListTile(
      selected: isSelected,
      title: Text(item?.name ?? ''),
      subtitle: Text(item?.createdAt?.toString() ?? ''),
      leading: CircleAvatar(
          // this does not work - throws 404 error
          // backgroundImage: NetworkImage(item.avatar ?? ''),
          ),
    ),
  );
}

Widget _customPopupItemBuilderExample2(
    BuildContext context, UserModel? item, bool isSelected) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8),
    decoration: !isSelected
        ? null
        : BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
    child: ListTile(
      selected: isSelected,
      title: Text(item?.name ?? ''),
      subtitle: Text(item?.createdAt?.toString() ?? ''),
      leading: CircleAvatar(
          // this does not work - throws 404 error
          // backgroundImage: NetworkImage(item.avatar ?? ''),
          ),
    ),
  );
}

Future<List<UserModel>> getData(filter) async {
  var response = await Dio().get(
    "https://5d85ccfb1e61af001471bf60.mockapi.io/user",
    queryParameters: {"filter": filter},
  );

  final data = response.data;
  if (data != null) {
    return UserModel.fromJsonList(data);
  }

  return [];
}
