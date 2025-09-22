import 'package:flutter/material.dart';
import 'package:t3_shopping_list/providers/products_data.dart';

import '../models/product.dart';
import '../components/products_list.dart';
import 'cart.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO Act1: Variable que guardará la lista de productos obtenida
    ProductsData? productsData;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List of Products',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 5.0,
        shadowColor: Colors.black,
        backgroundColor: Colors.deepPurple,
        actions: [
          // TODO Act1: Crea el botón del carrito
          IconButton(
            onPressed: () {
              ProductsData? selectedProducts = productsData?.getSelectedProducts();

              // TODO Act1: Se asegura que la lista de productos no es nula y hay productos seleccionados para navegar a la siguiente pantalla
              if (selectedProducts != null && selectedProducts.getSize() > 0) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(selectedProducts)));
              } else {
                // TODO Act1: Muestra un mensaje por pantalla
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Carrito vacio'),
                      content: const Text('Debes seleccionar un producto primero.'),
                      actions: [
                        // TODO Act1: Botón para cerrar el mensaje
                        TextButton(
                          child: const Text('Ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            )
          )
        ],
      ),
      backgroundColor: Colors.deepPurple.shade50,
      body: FutureBuilder(
          future: ProductsData.loadJson(context, 'assets/json/products.json'),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              // TODO Act1: Guarda la lista de productos
              productsData = ProductsData.fromJson(snapshot.data!);
              // TODO Act2: Devuelve el Widget con la lista de productos y la barra de orden
              return _OrderedProductList(productsData!);
            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          }
      ),
    );
  }
}

// TODO Act2: Crea la barra con los atributos a ordenar y la lista de productos
class _OrderedProductList extends StatefulWidget {
  final ProductsData _productsData;

  const _OrderedProductList(this._productsData, {super.key});

  @override
  State<_OrderedProductList> createState() => _OrderedProductListState();
}

class _OrderedProductListState extends State<_OrderedProductList> {
  // TODO Act2: Guarda el item seleccionado
  OrderBy selected = OrderBy.name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TODO Act2: Crea la barra con los items a ordenar
        Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 5.0),
                blurRadius: 10.0,
              )
            ],
            color: Colors.deepPurple.shade200,
          ),
          height: 55,
          child: ListView.builder(
            padding: const EdgeInsets.all(5.0),
            scrollDirection: Axis.horizontal,
            itemCount: OrderBy.values.length,
            itemBuilder: (context, index) => _listItem(OrderBy.values[index]),
          ),
        ),
        // TODO Act1: Reutiliza el Widget de la lista, pasándole los productos, el color del precio y el Widget con el botón
        // TODO Act2: Le indica que ocupe el espacio restante
        Expanded(child: ProductsListView(widget._productsData, priceColor: Colors.grey, trailingWidget: _shoppingBagButton,)),
      ],
    );
  }

  // TODO Act2: Crea cada item con el nombre del atributo a ordenar
  Widget _listItem(OrderBy value) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextButton(
        onPressed: () => setState(() {
          // TODO Act2: Si se pulsa guarda el item seleccionado y ordena la lista e productos
          selected = value;
          widget._productsData.orderBy(value);
        }),
        style: ButtonStyle(
          shape: const WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0),),),),
          // TODO Act2: Coloca un color al item dependiendo de si es el seleccionado o no
          backgroundColor: WidgetStatePropertyAll(
            value == selected ? Colors.deepPurple : Colors.white,
          ),
        ),
        child: Text(
          value == OrderBy.measureUnit ? 'measure unit' : value.name,
          style: TextStyle(
            color: value == selected ? Colors.white : Colors.deepPurple,
          ),
        ),
      )
    );
  }

  // TODO Act1: Botón para seleccionar producto y gestionar el estado del mismo
  Widget _shoppingBagButton(Product product) {
    return IconButton(
      onPressed: () => setState(() {
        // TODO Act1: Cambia estado de selección y reinicia uniades
        product.isSelected = !product.isSelected;
        product.units = 1;
      }),
      icon: Icon(
        Icons.shopping_bag,
        // TODO Act1: Dependiendo de si está seleccionado o no recibe un color
        color: product.isSelected ? Colors.deepPurple : Colors.deepPurple.shade100,
      ),
    );
  }
}