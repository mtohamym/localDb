import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                            itemCount:  HomeCubit().get(context).foodModel!.data!.length,
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                        )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
