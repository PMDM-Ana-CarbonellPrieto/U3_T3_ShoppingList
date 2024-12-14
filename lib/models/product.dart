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
  // TODO Act2: Variables para más información del producto
  String measureUnit;
  int discount;
  int iva;
  double calories;
  String recipe;

  // TODO Act2: Se recogen las nuevas variables en ambos constructores
  Product(this.id, this.name, this.price, this.category, this.image, this.description, this.measureUnit, this.discount, this.iva, this.calories, this.recipe);

  factory Product.fromMap(Map<String, dynamic> map) => Product(
      map['id'],
      map['name'],
      map['price'],
      map['category'],
      map['image'],
      map['description'],
      map['measureUnit'],
      map['discount'],
      map['iva'],
      map['calories'],
      map['recipe']);

  // TODO Act2: Getter que devuelve el precio después de aplicar el descuento y el iva
  double get finalPrice => price * (1 - discount / 100) * (1 + iva / 100);
}
