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
    return OrientationBuilder(
      builder: (context, orientation) {
        // TODO Act5: Asigna la cantidad de items en la fila dependiendo de la orientación
        int row =  orientation == Orientation.portrait ? 3 : 6;
        return ListView.builder(
          itemCount: _productsData.getSize(),
          itemBuilder: (context, index) =>
          // TODO Act5: Simula una vista en forma de grid
          index % row == 0 ?
            Container(
              // TODO Act5: Si es la primera fila deja espacio entre la barra y los productos
              padding: EdgeInsets.only(right: 5.0, left: 5.0, top: index == 0 ? 5.0 : 0.0,),
              child: Row(
                children: [
                  Expanded(child: _listItem(context, _productsData.getProduct(index))),
                  for (int i = 1; i < row; i++)
                  Expanded(child:
                    ++index < _productsData.getSize() ?
                      _listItem(context, _productsData.getProduct(index))
                    : Container()
                  ),
                ],
              ),
            )
          : Container()
        );
      }
    );
  }

  Widget _listItem(BuildContext context, Product product) {
    return Stack(
      children:  [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 5.0),
                  blurRadius: 5.0,
                )
              ],
              borderRadius: const BorderRadius.all(Radius.circular(10.0),),
              border: Border.all(color: Colors.deepPurple),
              color: Colors.white
            ),
            child: GestureDetector(
              // TODO Act4: Cuando se pulsa abre la pantalla de detalle y le pasa el producto
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  ProductDetail(product),
                ),
              ),
              child: Column(
                children: [
                  // TODO Act5: Añade la animación de la imagen
                  Hero(
                    tag: product.name,
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(product.image, width: 50.0, height: 50.0, fit: BoxFit.cover, alignment: Alignment.center,),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  // TODO Act1: Muestra el nombre y el precio del producto
                  Text(product.name, style: const TextStyle(fontSize: 15,),),
                  Text(
                    // TODO Act2: Se añade la unidad de medida al precio
                    '${product.finalPrice.toStringAsFixed(2)} €/${product.measureUnit}',
                    style: TextStyle(fontSize: 14, color: _priceColor),
                  ),
                  _trailingWidget(product),
                ],
              ),
            ),
          ),
        ),
        // TODO Act5: Añade el widget con el porcentaje si el producto tiene descuento
        product.discount > 0 ?
          _discountCircle(product.discount)
        : Container(),
      ]
    );
  }

  // TODO Act5: Crea un círculo con el porcentaje de descuento en su interior
  Widget _discountCircle(int discount) {
    return Container(
      height: 35,
      width: 35,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(2.0, 2.0),
              blurRadius: 5.0,
            )
          ],
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 240, 0, 0)
      ),
      child: Center(
        child: Text(
          '$discount%',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}