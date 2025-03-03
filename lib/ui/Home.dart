import 'package:assessment_project/data/network/model/UserModel.dart';
import 'package:assessment_project/ui/HomeViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: StreamBuilder<List<UserModel>>(
        stream: viewModel.users,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No users found');
          }

          final users = snapshot.data ?? [];

          return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) => ListTile(
            title: Text(users[index].name ?? ""),
            subtitle: Text(users[index].email ?? ""),
            leading: Checkbox(value: users[index].favorite, onChanged: (bool? value) {
              viewModel.toggleFavorite(users[index]);
            })
          )
          );
        })
    );
  }
}
