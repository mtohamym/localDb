import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session/core/local_storage/cache_helper/cache_helper.dart';
import 'package:session/feature/auth/view/login_screen.dart';
import 'package:session/feature/home/view/favotare.dart';
import 'package:session/feature/home/view/widgets/food_card.dart';
import 'package:session/feature/home/view/widgets/resturant_card.dart';

import '../view_model/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..loadData(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            actions: [
              IconButton(
                onPressed: () async {
                  await CacheHelper.removeData(key: "token");
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      (route) => false);
                },
                icon: const Icon(Icons.logout),
              )
            ],
          ),
          body: SafeArea(
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      state is ReasturantDataLoading ||
                              HomeCubit().get(context).resturantModel == null
                          ? const Center(child: CupertinoActivityIndicator())
                          : Container(
                              height: 224,
                              child: ListView.builder(
                                itemBuilder: (context, index) =>
                                    ResturantCard(index: index),
                                itemCount: 3,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                      state is FoodDataLoading ||
                              HomeCubit().get(context).foodModel == null
                          ? const Center(child: CupertinoActivityIndicator())
                          : Container(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    FoodCard(index: index),
                                itemCount: HomeCubit()
                                    .get(context)
                                    .foodModel!
                                    .data!
                                    .length,
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                            )
                    ],
                  ),
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Favorite(),
                  ));
            },
            child: const Icon(Icons.favorite),
          )),
    );
  }
}
