class Product {
  final String? id;
  final String? title;
  final String? price;
  final String? description;
  final String? image;
  final String? category;
  final Rating? rate;

  Product({this.id, this.title, this.price, this.description, this.image,
    this.category , this.rate});

  factory Product.fromJson(json)
  {
    return Product(
         id: json["id"],
        title : json["title"],
        price:json["price"],
        description:json["description"],
        image:json["image"],
        category:json["category"],
      rate: Rating.fromJson(json["rating"]),

    );
  }
}

class Rating{
  final String? rate;
  final String? count;
  Rating({this.rate , this.count});
  factory Rating.fromJson(json){
    return Rating(
      rate: json["rate"],
      count:json["count"],
    );
  }
}
