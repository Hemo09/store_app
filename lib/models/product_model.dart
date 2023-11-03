class ProductModel {
  final String? id;
  final String? title;
  final String? price;
  final String? description;
  final String? image;
  final String? category;
  final Rating? rate;

  ProductModel({this.id, this.title, this.price, this.description, this.image,
    this.category , this.rate});

  factory ProductModel.fromJson(json)
  {
    return ProductModel(
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
