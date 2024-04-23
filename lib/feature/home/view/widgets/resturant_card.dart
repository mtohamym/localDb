import 'package:flutter/material.dart';

import '../../model/resturant_model.dart';
import '../../view_model/home_cubit.dart';
import '../resturant_details.dart';


class ResturantCard extends StatelessWidget {
  const ResturantCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    HomeCubit myCubit = HomeCubit().get(context);
    Data data = myCubit.resturantModel!.data![index];
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResturantDetails(data: data),
          )),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color(0x125A6CEA), blurRadius: 15, spreadRadius: 8)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "https://images.deliveryhero.io/image/talabat/restaurants/Logo_637027837344237066.jpg",
              width: 90,
              height: 90,
            ),
            Text(
              data.name!,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            Text(
              data.deliveryTime!,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
