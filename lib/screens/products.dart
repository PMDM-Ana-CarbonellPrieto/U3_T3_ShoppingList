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
        title: const Text('List of Products'),
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
            icon: const Icon(Icons.shopping_cart)
          )
        ],
      ),
      body: FutureBuilder(
          future: ProductsData.loadJson(context, 'assets/json/products.json'),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              // TODO Act1: Guarda la lista de productos
              productsData = ProductsData.fromJson(snapshot.data!);
              // TODO Act1: Reutiliza el Widget de la lista, pasándole los productos, el color del precio y el Widget con el botón
              return ProductsListView(productsData!, priceColor: Colors.grey, trailingWidget: _shoppingBagButton,);
            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          }
      ),
    );
  }

  // TODO Act1: Devuelve el Widget con el botón de selección
  Widget _shoppingBagButton(Product product) {
    return _ShoppingBagButton(product);
  }
}

// TODO Act1: Botón para seleccionar producto y gestionar el estado del mismo
class _ShoppingBagButton extends StatefulWidget {
  final Product _product;

  const _ShoppingBagButton(this._product, {super.key});

  @override
  State<_ShoppingBagButton> createState() => _ShoppingBagButtonState();
}

class _ShoppingBagButtonState extends State<_ShoppingBagButton> {

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => setState(() {
        // TODO Act1: Cambia estado de selección y reinicia uniades
        widget._product.isSelected = !widget._product.isSelected;
        widget._product.units = 1;
      }),
      icon: Icon(
        Icons.shopping_bag,
        // TODO Act1: Dependiendo de si está seleccionado o no recibe un color
        color: widget._product.isSelected ? Colors.green : Colors.grey,
      ),
    );
  }
}