import 'package:flutter/material.dart';

import '../models/product.dart';

// TODO Act4: Recibe el producto como parámetro
class ProductDetail extends StatelessWidget {
  final Product _product;

  // TODO Act4: Se disminuye el tamaño de la fuente
  final _myTextStyle1 = const TextStyle(color: Colors.deepPurple, fontSize: 25.0);
  final _myTextStyle2 = const TextStyle(fontSize: 25.0);
  final _myTextStyle3 = const TextStyle(fontSize: 20.0);

  const ProductDetail(this._product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product detail',

          style: TextStyle(color: Colors.white),
        ),
        elevation: 5.0,
        shadowColor: Colors.black,
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        // TODO Act4: Muestra la información del producto dependiendo de la orientación
        child: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait ? portraitLayout() : landscapeLayout();
          }
        ),
      ),
      backgroundColor: Colors.deepPurple.shade50,
    );
  }

  // TODO Act4: Layout para la vista en vertical
  Widget portraitLayout() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              // TODO Act4: La imagen, el id, el nombre y las calorías del producto
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // TODO Act5: Añade la animación de la imagen
                  Hero(
                    tag: _product.name,
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 5.0)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10.0),),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(_product.image, width: 100.0, height: 100.0, fit: BoxFit.cover, alignment: Alignment.bottomCenter,),
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Id:', style: _myTextStyle1,),
                          Text(' ${_product.id} ', style: _myTextStyle2,),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Name: ', style: _myTextStyle1,),
                          Text(_product.name, style: _myTextStyle2,),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Calories:', style: _myTextStyle1,),
                          Text(' ${_product.calories} ', style: _myTextStyle2,),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(color: Colors.grey, thickness: 1,),
              // TODO Act4: La categoría del producto
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 5.0)
                      ],
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(_product.categoryImage, width: 50.0, height: 50.0, fit: BoxFit.cover, alignment: Alignment.bottomCenter,),
                  ),
                  const SizedBox(width: 5,),
                  Text('Category:', style: _myTextStyle1,),
                  Text(' ${_product.category} ', style: _myTextStyle2,),
                ],
              ),
            ],
          ),
          // TODO Act4: Descripción y receta del producto
          Column(
            children: [
              Text('Description ', style: _myTextStyle1,),
              Text(_product.description, style: _myTextStyle3, textAlign: TextAlign.justify,),
              const Divider(color: Colors.grey, thickness: 1,),
              Text('Recipe ', style: _myTextStyle1,),
              Text(_product.recipe, style: _myTextStyle3, textAlign: TextAlign.justify,),
              const Divider(color: Colors.grey, thickness: 1,),
            ],
          ),
          // TODO Act4: Precio final del producto con todo aplicado
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Final Price: ', style: _myTextStyle1,),
                  Text('${_product.finalPrice.toStringAsFixed(2)} €/${_product.measureUnit}', style: _myTextStyle2,),
                ],
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Discount:', style: _myTextStyle1,),
                    Text(' ${_product.discount}% ', style: _myTextStyle2,),
                    Text('IVA: ', style: _myTextStyle1,),
                    Text('${_product.iva}% ', style: _myTextStyle2,),
                    Text('Price: ', style: _myTextStyle1,),
                    Text('${_product.price} €/${_product.measureUnit}', style: _myTextStyle2,),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // TODO Act4: Layout para la vista en horizontal
  Widget landscapeLayout() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // TODO Act4: La imagen, el id, el nombre y las calorías del producto
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // TODO Act5: Añade la animación de la imagen
                        Hero(
                          tag: _product.name,
                          child: Container(
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 5.0)
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(10.0),),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(_product.image, width: 100.0, height: 100.0, fit: BoxFit.cover, alignment: Alignment.bottomCenter,),
                          ),
                        ),
                        const SizedBox(width: 10.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Id:', style: _myTextStyle1,),
                                Text(' ${_product.id} ', style: _myTextStyle2,),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Name: ', style: _myTextStyle1,),
                                Text(_product.name, style: _myTextStyle2,),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Calories:', style: _myTextStyle1,),
                                Text(' ${_product.calories} ', style: _myTextStyle2,),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(color: Colors.grey, thickness: 1,),
                    // TODO Act4: La categoría del producto
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 5.0)
                            ],
                            shape: BoxShape.circle,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(_product.categoryImage, width: 50.0, height: 50.0, fit: BoxFit.cover, alignment: Alignment.bottomCenter,),
                        ),
                        const SizedBox(width: 5,),
                        Text('Category:', style: _myTextStyle1,),
                        Text(' ${_product.category} ', style: _myTextStyle2,),
                      ],
                    ),
                  ],
                ),
                // TODO Act4: Precio final del producto con todo aplicado
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Final Price: ', style: _myTextStyle1,),
                        Text('${_product.finalPrice.toStringAsFixed(2)} €/${_product.measureUnit}', style: _myTextStyle2,),
                      ],
                    ),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Discount:', style: _myTextStyle1,),
                          Text(' ${_product.discount}% ', style: _myTextStyle2,),
                          Text('IVA: ', style: _myTextStyle1,),
                          Text('${_product.iva}% ', style: _myTextStyle2,),
                          Text('Price: ', style: _myTextStyle1,),
                          Text('${_product.price} €/${_product.measureUnit}', style: _myTextStyle2,),
                        ],
                      ),
                    ),
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