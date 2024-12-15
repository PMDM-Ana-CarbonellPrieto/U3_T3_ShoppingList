import 'package:flutter/material.dart';

import '../models/product.dart';

// TODO Act4: Recibe el producto como parámetro
class ProductDetail extends StatelessWidget {
  final Product _product;

  // TODO Act4: Se disminuye el tamaño de la fuente
  final _myTextStyle1 = const TextStyle(color: Colors.blue, fontSize: 25.0);
  final _myTextStyle2 = const TextStyle(color: Colors.indigo, fontSize: 25.0);
  final _myTextStyle3 = const TextStyle(color: Colors.indigo, fontSize: 20.0);

  const ProductDetail(this._product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product detail'),),
      body: SafeArea(
        // TODO Act4: Muestra la información del producto dependiendo de la orientación
        child: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait ? portraitLayout() : landscapeLayout();
          }
        ),
      ),
    );
  }

  // TODO Act4: Layout para la vista en vertical
  Widget portraitLayout() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.grey.shade100, Colors.green.shade100])
      ),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO Act4: La imagen, el id y el nombre del producto
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(_product.image, width: 100.0, height: 100.0, fit: BoxFit.contain, alignment: Alignment.bottomCenter,),
              const SizedBox(width: 10,),
              Text('Id:', style: _myTextStyle1,),
              Text(' ${_product.id} ', style: _myTextStyle2,),
              Text('Name: ', style: _myTextStyle1,),
              Text(_product.name, style: _myTextStyle2,),
            ],
          ),
          const Divider(color: Colors.grey, thickness: 1,),
          // TODO Act4: La categoría del producto
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(_product.categoryImage, width: 50.0, height: 50.0, fit: BoxFit.contain, alignment: Alignment.bottomCenter,),
              const SizedBox(width: 5,),
              Text('Category:', style: _myTextStyle1,),
              Text(' ${_product.category} ', style: _myTextStyle2,),
            ],
          ),
          Expanded(child: Container()),
          // TODO Act4: Descripción y receta del producto
          Text('Description ', style: _myTextStyle1,),
          Text(_product.description, style: _myTextStyle3, textAlign: TextAlign.justify,),
          const Divider(color: Colors.grey, thickness: 1,),
          Text('Recipe ', style: _myTextStyle1,),
          Text(_product.recipe, style: _myTextStyle3, textAlign: TextAlign.justify,),
          const Divider(color: Colors.grey, thickness: 1,),
          // TODO Act4: Calorias y precio el producto
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Calories:', style: _myTextStyle1,),
              Text(' ${_product.calories} ', style: _myTextStyle2,),
              Expanded(child: Container()),
              Text('Price: ', style: _myTextStyle1,),
              Text('${_product.price} €/${_product.measureUnit}', style: _myTextStyle2,),
            ],
          ),
          Expanded(child: Container()),
          // TODO Act4: Precio final del producto con todo aplicado
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Discount:', style: _myTextStyle1,),
                Text(' ${_product.discount}% ', style: _myTextStyle2,),
                Text('IVA: ', style: _myTextStyle1,),
                Text('${_product.iva}% ', style: _myTextStyle2,),
                Text('Final Price: ', style: _myTextStyle1,),
                Text('${_product.finalPrice.toStringAsFixed(2)} €/${_product.measureUnit}', style: _myTextStyle2,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // TODO Act4: Layout para la vista en horizontal
  Widget landscapeLayout() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.grey.shade100, Colors.green.shade100])
      ),
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                // TODO Act4: La imagen, el id y el nombre del producto
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(_product.image, width: 100.0, height: 100.0, fit: BoxFit.contain, alignment: Alignment.bottomCenter,),
                    const SizedBox(width: 10,),
                    Text('Id:', style: _myTextStyle1,),
                    Text(' ${_product.id} ', style: _myTextStyle2,),
                    Text('Name: ', style: _myTextStyle1,),
                    Text(_product.name, style: _myTextStyle2,),
                  ],
                ),
                const Divider(color: Colors.grey, thickness: 1,),
                // TODO Act4: La categoría del producto
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(_product.categoryImage, width: 50.0, height: 50.0, fit: BoxFit.contain, alignment: Alignment.bottomCenter,),
                    const SizedBox(width: 5,),
                    Text('Category:', style: _myTextStyle1,),
                    Text(' ${_product.category} ', style: _myTextStyle2,),
                  ],
                ),
                Expanded(child: Container()),
                // TODO Act4: Calorias y precio el producto
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Calories:', style: _myTextStyle1,),
                    Text(' ${_product.calories} ', style: _myTextStyle2,),
                    Text('Price: ', style: _myTextStyle1,),
                    Text('${_product.price} €/${_product.measureUnit}', style: _myTextStyle2,),
                  ],
                ),
                // TODO Act4: Precio final del producto con todo aplicado
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Discount:', style: _myTextStyle1,),
                    Text(' ${_product.discount}% ', style: _myTextStyle2,),
                    Text('IVA: ', style: _myTextStyle1,),
                    Text('${_product.iva}% ', style: _myTextStyle2,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Final Price: ', style: _myTextStyle1,),
                    Text('${_product.finalPrice.toStringAsFixed(2)} €/${_product.measureUnit}', style: _myTextStyle2,),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 20,),
          // TODO Act4: Descripción y receta del producto
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Description ', style: _myTextStyle1,),
                  Text(_product.description, style: _myTextStyle3, textAlign: TextAlign.justify,),
                  const Divider(color: Colors.grey, thickness: 1,),
                  Text('Recipe ', style: _myTextStyle1,),
                  Text(_product.recipe, style: _myTextStyle3, textAlign: TextAlign.justify,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}