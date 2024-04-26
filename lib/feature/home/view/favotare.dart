import 'package:flutter/material.dart';
import 'package:session/feature/home/view_model/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit()..getFoodsFromDB(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return HomeCubit().get(context).foods.isEmpty
                ? const Center(
                    child: Text('No Favorite Yet'),
                  )
                : ListView.builder(
                    itemCount: HomeCubit().get(context).foods.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          HomeCubit().get(context).foods[index]['title'],
                        ),
                        subtitle: Text(
                          HomeCubit().get(context).foods[index]['description'],
                        ),
                        leading: Image.network(
                          "https://images.deliveryhero.io/image/talabat/restaurants/Logo_637027837344237066.jpg",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            HomeCubit().get(context).deleteFromFavorite(index);
                          },
                        ),
                      );
                    });
          },
        ),
      ),
    );
  }
}
