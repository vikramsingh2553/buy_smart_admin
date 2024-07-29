import 'package:buy_smart_admin/Product/ui/product_detail_screen.dart';
import 'package:buy_smart_admin/shared/string_const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buy_smart_admin/Product/provider/product_provider.dart';
import 'package:buy_smart_admin/Product/model/product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchProducts();
    });
  }

  Future<void> _fetchProducts() async {
    await Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  Future<void> deleteProduct(BuildContext context, String productId) async {
    try {
      await Provider.of<ProductProvider>(context, listen: false).deleteProduct(productId);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(StringConst.productDeletedSuccess)),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(StringConst.productDeletedFail)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).products;

    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConst.productsHeader),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 1,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final ProductModel product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product),
                ),
              );
            },
            onLongPress: () => _confirmDeleteProduct(context, product),
            child: Card(
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.description,
                      style: const TextStyle(fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Price: ${product.price}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Category: ${product.category}',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _confirmDeleteProduct(BuildContext context, ProductModel product) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(StringConst.deleteProductTitle),
          content: const Text(StringConst.deleteProductDialog),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(StringConst.cancel),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await deleteProduct(context, product.id);
              },
              child: const Text(StringConst.delete),
            ),
          ],
        );
      },
    );
  }
}
