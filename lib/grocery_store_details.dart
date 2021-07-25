import 'package:flutter/material.dart';
import 'package:grocery_app/product.dart';
class GroceryStoreDetails extends StatefulWidget{
  final GroceryProduct product;
  final VoidCallback onProductAdded;

  const GroceryStoreDetails({
    Key key,
    @required this.product,
    this.onProductAdded,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {

    return GroceryStoreDetailsState();
  }
}
class GroceryStoreDetailsState extends State<GroceryStoreDetails> {



  // String heroTag='';
  void _addToCart(BuildContext context) {

    widget.onProductAdded();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            widget.product.name,
            style: TextStyle(color: Colors.black),
          )),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Hero(
                          tag: 'list_${widget.product.name}',
                          child: Image.asset(
                            widget.product.image,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 0.36,
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.product.name,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.product.weight,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Text(
                          '\$${widget.product.price}',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'About the product',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.product.description,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: IconButton(
                      onPressed: () => null, icon: Icon(Icons.favorite_border)),
                ),
                Expanded(
                    flex: 4,
                    child: RaisedButton(
                      color: Color(0xFFF4C459),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'add to cart',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      onPressed:()=> _addToCart(context),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
