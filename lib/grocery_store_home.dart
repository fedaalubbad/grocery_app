import 'package:flutter/material.dart';
import 'package:grocery_app/grocery_provider.dart';
import 'package:grocery_app/grocery_store_block.dart';

import 'grocery_store_list.dart';

const backgroundColor = Color(0xFFF6F5F2);
const _kToolBarHeight = 70.0;
const cartBarHeight = 100.0;
const _panelTransition = Duration(milliseconds: 500);

class GroceryStoreHome extends StatefulWidget {
  @override
  GroceryStoreHomeState createState() => GroceryStoreHomeState();
}

class GroceryStoreHomeState extends State<GroceryStoreHome> {
  final bloc = GroceryStoreBloc();

  void _onVerticalGesture(DragUpdateDetails details) {
    print(details.primaryDelta);
    if (details.primaryDelta < -7.0) {
      bloc.changeToCart();
    } else if (details.primaryDelta > 12) {
      bloc.changeToNormal();
    }
  }

  double _getTopForWhitePanel(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return -cartBarHeight + _kToolBarHeight;
    } else if (state == GroceryState.cart) {
      return -(size.height - _kToolBarHeight - cartBarHeight / 2);
    }
    return 0.0;
  }

  double _getTopForBlcakPanel(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return size.height - cartBarHeight;
    } else if (state == GroceryState.cart) {
      return cartBarHeight / 2;
    }
    return 0.0;
  }

  double _getTopForAppBar(GroceryState state) {
    if (state == GroceryState.normal) {
      return 0.0;
    } else if (state == GroceryState.cart) {
      return -cartBarHeight;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GroceryProvider(
      bloc: bloc,
      child: AnimatedBuilder(
          animation: bloc,
          builder: (context, snapshot) {
            return Scaffold(
                backgroundColor: Colors.black,
                body: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: _panelTransition,
                      curve: Curves.decelerate,
                      left: 0,
                      top: _getTopForWhitePanel(bloc.groceryState, size),
                      right: 0,
                      height: size.height - _kToolBarHeight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                          ),
                          child: GroceryStoreList(),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                        duration: _panelTransition,
                        curve: Curves.decelerate,
                        left: 0,
                        top: _getTopForBlcakPanel(bloc.groceryState, size),
                        right: 0,
                        height: size.height,
                        child: GestureDetector(
                          onVerticalDragUpdate: _onVerticalGesture,
                          child: Container(
                            color: Colors.black,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Cart',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: List.generate(
                                                bloc.cart.length,
                                                (index) => CircleAvatar(
                                                      backgroundImage:
                                                          AssetImage(
                                                        bloc.cart[index].product
                                                            .image,
                                                          ),
                                                    backgroundColor:Colors.white
                                                )),
                                          ),
                                        ),
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.amber,
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Placeholder()
                              ],
                            ),
                          ),
                        )),
                    AnimatedPositioned(
                        duration: _panelTransition,
                        curve: Curves.decelerate,
                        left: 0,
                        right: 0,
                        top: _getTopForAppBar(bloc.groceryState),
                        child: _AppbarGrocery()),
                  ],
                ));
          }),
    );
  }
}

class _AppbarGrocery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: _kToolBarHeight,
        color: backgroundColor,
        child: Row(
          children: [
            BackButton(
              color: Colors.black,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(
              'fruits and vegetable',
              style: TextStyle(color: Colors.black),
            )),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings))
          ],
        ));
  }
}
