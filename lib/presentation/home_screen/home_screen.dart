import 'package:api_methods_bloc/presentation/add_product_screen/add_product_screen.dart';
import 'package:api_methods_bloc/presentation/login_screen/login_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => context.read<HomeBloc>().add(GetProductsEvent()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        surfaceTintColor: Colors.indigo,
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.4,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              final pref = await SharedPreferences.getInstance();
              pref.clear().then(
                (value) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (route) => false,
                  );
                },
              );
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(color: Colors.indigo),
            );
          }
          if (state is LoadedState) {
            return ListView.separated(
              itemCount: state.productlist.length,
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  height: 1.7,
                  thickness: 1.7,
                  color: Colors.indigo,
                ),
              ),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: state.productlist[index].image.toString(),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                      color: Colors.indigo,
                      value: downloadProgress.progress,
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.image,
                      color: Colors.indigo,
                    ),
                  ),
                  title: Text(
                    state.productlist[index].name.toString(),
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.3,
                    ),
                  ),
                  subtitle: Text(
                    state.productlist[index].description.toString(),
                    style: TextStyle(
                      color: Color(0xFF535353),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.07,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit, color: Colors.indigo),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete, color: Colors.indigo),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          if (state is HomeInitialState) {
            return Text("No data");
          }
          if (state is ErrorState) {
            return Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  state.errormsg.toString(),
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddProductScreen(),
            ),
          );
        },
      ),
    );
  }
}
