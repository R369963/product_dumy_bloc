class Prductlistmodel {
  int? id;
  String? title;
  String? price;
  String? description;
  String? category;
  String? image;
 Rating? rating;
  Prductlistmodel(
      {this.id,
        this.title,
  this.price,
        this.description,
        this.category,
        this.image,
 this.rating      });

  Prductlistmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
     price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
rating=json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
   data['rating'] = this.rating;
    return data;
  }
}

class Rating {
  String? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
