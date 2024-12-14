class Product {
  int id;
  String name;
  double price;
  String category;
  String image;
  String description;
  // TODO Act1: Variables para guardar el estado de la selección y la cantidad de unidades
  bool isSelected = false;
  int units = 1;

  Product(this.id, this.name, this.price, this.category, this.image, this.description);

  factory Product.fromMap(Map<String, dynamic> map) => Product(
      map['id'],
      map['name'],
      map['price'],
      map['category'],
      map['image'],
      map['description']);
}
