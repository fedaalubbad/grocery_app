class GroceryProduct {
  final double price;
  final String description;
  final String name;
  final String image;
  final String weight;

  const GroceryProduct({
        this.price,
        this.description,
        this.name,
        this.image,
        this.weight
      });
}
const groceryProduct =<GroceryProduct>[
      GroceryProduct(
          price:8.30,
          description:'this avocado is fleshy exotic fruit obtained from the tropical tree of the same name',
          name:'avocado',
          image:'assets/avocado.png',
          weight:'1000g'),

      GroceryProduct(
          price:11.0,
          description:'apple',
          name:'apple',
          image:'assets/apple.png',
          weight:'1500g'),

      GroceryProduct(
          price:15.40,
          description:'green lemon',
          name:'green lemon',
          image:'assets/green_lemon.png',
          weight:'400g'),

      GroceryProduct(
          price:15.40,
          description:'pomegranate',
          name:'pomegranate',
          image:'assets/pomegranate.png',
          weight:'400g'),

      GroceryProduct(
          price:15.40,
          description:'fruit',
          name:'fruit',
          image:'assets/fruit.png',
          weight:'400g'),

      GroceryProduct(
          price:15.40,
          description:'orange',
          name:'orange',
          image:'assets/orange.png',
          weight:'400g'),

        GroceryProduct(
          price:15.40,
          description:'strawberry',
          name:'strawberry',
          image:'assets/strawberry.png',
          weight:'400g'),


      ];