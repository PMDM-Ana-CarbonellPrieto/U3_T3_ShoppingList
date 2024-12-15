import 'package:flutter/material.dart';

import '../models/product.dart';
import '../providers/products_data.dart';
import '../screens/product_detail.dart';

// TODO Act1: Crea el Widget de lista y recibe los productos a mostrar, el color del precio y el Widget adecuado para el trailing, pudiendo así reutilizarlo en ambas pantallas
class ProductsListView extends StatelessWidget {
  final ProductsData _productsData;
  final Color _priceColor;
  final Widget Function(Product) _trailingWidget;

  const ProductsListView(this._productsData, {required Color priceColor, required Widget Function(Product) trailingWidget, super.key}) :
        _priceColor = priceColor, _trailingWidget = trailingWidget;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _productsData.getSize(),
      itemBuilder: (context, index) =>
          _listItem(context, _productsData.getProduct(index)),
    );
  }

  Widget _listItem(BuildContext context, Product product) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        // TODO Act4: Cuando se pulsa abre la pantalla de detalle y le pasa el producto
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>
                ProductDetail(product),
          ),
        ),
        leading: Image.asset(product.image, width: 100.0, height: 100.0, fit: BoxFit.contain, alignment: Alignment.bottomCenter,),
        trailing: _trailingWidget(product),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO Act1: Muestra el nombre y el precio del producto
            Text(product.name),
            Text(
              // TODO Act2: Se añade la unidad de medida al precio
              '${product.finalPrice.toStringAsFixed(2)} €/${product.measureUnit}',
              style: TextStyle(fontSize: 14, color: _priceColor),
            )
          ],
        ),
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.indigo),
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}