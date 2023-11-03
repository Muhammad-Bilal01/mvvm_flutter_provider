import 'package:flutter/material.dart';
import 'package:mvvm_flutter_provider/utils/routes/routes_name.dart';
import 'package:mvvm_flutter_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          InkWell(
            onTap: () {
              userPreferences.removeUser().then((value) {
                Navigator.pushNamedAndRemoveUntil(
                    context, RoutesName.loginScreen, (route) => false);
              });
            },
            child: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
