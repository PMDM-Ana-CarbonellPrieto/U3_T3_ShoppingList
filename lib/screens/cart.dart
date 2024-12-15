import 'package:flutter/material.dart';
import 'package:t3_shopping_list/providers/products_data.dart';

import '../models/product.dart';
import '../components/products_list.dart';

// TODO Act1: Nueva pantalla para el carrito, recibe un ProductsData con los productos seleccionados
class CartScreen extends StatefulWidget {
  final ProductsData _productsData;

  const CartScreen(this._productsData, {super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();

}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shopping Cart'),
        actions: [
          // TODO Act1: Calcula el precio total de los productos seleccionados y lo muestra en la AppBar
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '${widget._productsData.getTotalPrice().toStringAsFixed(2)} €',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ),
        ],
      ),
      // TODO Act1: Reutiliza el Widget de la lista de productos, pasándole los productos seleccionados, el color del precio y el Widget con el contador de unidades
      body: ProductsListView(widget._productsData, priceColor: Colors.indigo, trailingWidget: _productCounter,)
    );
  }

  // TODO Act1: Crea los botones y el texto que se encargan del estado de las unidadeds seleccionadas
  Widget _productCounter(Product product) {
    return FittedBox(
      child: Row(
        children: [
          IconButton(
            onPressed: () => setState(() {
              // TODO Act1: Las unidades no pueden bajar de 1
              if (product.units > 1) product.units--;
            }),
            icon: const Icon(
              Icons.remove_circle_outline,
              color: Colors.red,
            ),
          ),
          Text('${product.units}', style: const TextStyle(fontSize: 20, color: Colors.indigo,),),
          IconButton(
            onPressed: () => setState(() => product.units++),
            icon: const Icon(
              Icons.add_circle_outline,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}