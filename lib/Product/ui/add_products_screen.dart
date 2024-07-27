import 'package:buy_smart_admin/Product/model/product_model.dart';
import 'package:buy_smart_admin/Product/provider/product_provider.dart';
import 'package:buy_smart_admin/Product/ui/product_screen.dart';
import 'package:buy_smart_admin/shared/string_const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductsScreen extends StatefulWidget {
  const AddProductsScreen({super.key});

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConst.addProductHeader),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  labelText: StringConst.categoryLabel,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return StringConst.categoryValidator;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText:  StringConst.productNameLabel,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return StringConst.productNameValidator;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: StringConst.priceLabel,
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return StringConst.priceValidator;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: StringConst.descriptionLabel,
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return StringConst.descriptionValidator;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    final product = ProductModel(
                      id: '',
                      name: _nameController.text,
                      description: _descriptionController.text,
                      price: int.parse(_priceController.text),
                      category: _categoryController.text,
                    );
                    await Provider.of<ProductProvider>(context, listen: false).addProduct(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text(StringConst.productAddedSuccess)),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductScreen(
                        ),
                      ),
                    );
                  }
                },
                child: const Text(StringConst.addProductButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
