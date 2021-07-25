import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/StaggeredDualView.dart';
import 'package:grocery_app/grocery_provider.dart';
import 'package:grocery_app/grocery_store_details.dart';
import 'package:grocery_app/grocery_store_home.dart';
import 'package:grocery_app/product.dart';

class GroceryStoreList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc=GroceryProvider.of(context).bloc;

    return Container(
        color: backgroundColor,
      padding: EdgeInsets.only(top: cartBarHeight,left: 10,right: 10),
      child: StaggeredDualView(
        aspectRatio: 0.7,
        offsetPercent: 0.3,
        spacing: 10,
        itemCount: bloc.catalog.length,
        itemBuilder:(context,index){
            final product=bloc.catalog[index];
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context,animation,_){
                  return FadeTransition(
                      opacity: animation,
                      child: GroceryStoreDetails(product: product,
                      onProductAdded:(){
                        bloc.addProduct(product);
                      }
                      )
                  );
                }));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          child: Hero(
                            tag: 'list_${product.name}',
                              child: Image.asset(product.image,fit: BoxFit.contain))),
                      Text('\$${product.price}',
                        style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20) ,),
                     SizedBox(height: 15,),
                      Text('${product.name}',
                        style:TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14) ,),
                      Text('${product.weight}',
                        style:TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 14) ,),
                      SizedBox(height: 5,),

                    ],
                  ),
                ),
              ),
            );
          },

      ),
    );

    /*return ListView.builder(
        padding: EdgeInsets.only(top: cartBarHeight),
        itemCount: bloc.catalog.length,
        itemBuilder: (context,index){
        return Container(
          height: 100,
          width: 100,
          color:Colors.primaries[index % Colors.primaries.length],
        );
        });*/
  }
}
