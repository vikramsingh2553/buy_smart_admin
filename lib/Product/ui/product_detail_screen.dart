import 'package:flutter/material.dart';
import 'package:buy_smart_admin/Product/model/product_model.dart';
import 'package:buy_smart_admin/Product/service/product_service.dart';

class UpdateProductScreen extends StatefulWidget {
  final ProductModel product;

  const UpdateProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  _UpdateProductScreenState createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _categoryController;
  final ProductService _productService = ProductService();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product.name);
    _descriptionController = TextEditingController(text: widget.product.description);
    _priceController = TextEditingController(text: widget.product.price.toString());
    _categoryController = TextEditingController(text: widget.product.category);
  }

  Future<void> _updateProduct() async {
    if (!_formKey.currentState!.validate()) return;

    final updatedProduct = ProductModel(
      id: widget.product.id,
      name: _nameController.text,
      description: _descriptionController.text,
      price: int.parse(_priceController.text),
      category: _categoryController.text,
    );

    try {
      final updatedProductFromServer = await _productService.updateProduct(widget.product.id, updatedProduct);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product updated successfully!')),
      );
      Navigator.pop(context, updatedProductFromServer);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update product: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _updateProduct,
                child: Text('Update Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
