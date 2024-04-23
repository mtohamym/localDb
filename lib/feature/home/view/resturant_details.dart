import 'package:flutter/material.dart';

import '../model/resturant_model.dart';

class ResturantDetails extends StatelessWidget {
  const ResturantDetails({Key? key , required this.data}) : super(key: key);
  final Data data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.network("https://images.deliveryhero.io/image/talabat/restaurants/Logo_637027837344237066.jpg"),
            Text(data.name!),


          ],
        ),
      ),
    );
  }
}
