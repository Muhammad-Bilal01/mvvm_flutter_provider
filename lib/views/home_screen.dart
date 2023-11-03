import 'package:flutter/material.dart';
import 'package:mvvm_flutter_provider/utils/routes/routes_name.dart';
import 'package:mvvm_flutter_provider/utils/utils.dart';
import 'package:mvvm_flutter_provider/view_model/home_view_view_model.dart';
import 'package:mvvm_flutter_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewmodel homeViewModel = HomeViewViewmodel();
  @override
  void initState() {
    homeViewModel.fetchMovieList();
    print("Hello World");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: ChangeNotifierProvider<HomeViewViewmodel>(
        create: (context) => homeViewModel,
        child: Consumer<HomeViewViewmodel>(
          builder: (context, value, child) {
            switch (value.moviesList.status) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(
                    child:
                        Text(value.moviesList.message ?? "Some error occured"));
              case Status.COMPLETED:
                return ListView.builder(
                  itemCount: value.moviesList.data!.movies!.length,
                  itemBuilder: (context, index) {
                    var data = value.moviesList.data!.movies;
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          data![index].posterurl!,
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error, color: Colors.red);
                          },
                        ),
                        title: Text(data[index].title!),
                        subtitle: Text(data[index].year!),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                                "${Utils.averageRating(data[index].ratings!)}"),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
