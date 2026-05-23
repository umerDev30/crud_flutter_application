import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_theme.dart';
import '../../../models/product.dart';
import '../../../providers/product_provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.onEdit});

  final Product product;
  final VoidCallback onEdit;

  Future<void> _confirmDelete(BuildContext context) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Delete product?'),
          content: Text(
            'This will permanently remove "${product.name}" from the catalog.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              style: TextButton.styleFrom(foregroundColor: AppTheme.danger),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (shouldDelete != true || !context.mounted || product.id == null) {
      return;
    }

    await context.read<ProductProvider>().deleteProduct(product.id!);
    if (!context.mounted) {
      return;
    }

    final error = context.read<ProductProvider>().errorMessage;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error ?? '"${product.name}" deleted successfully.'),
        backgroundColor: error == null ? AppTheme.success : AppTheme.danger,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppTheme.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 16),
            const Divider(height: 1, color: AppTheme.border),
            const SizedBox(height: 12),
            Row(
              children: [
                TextButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit_outlined, size: 16),
                  label: const Text('EDIT'),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () => _confirmDelete(context),
                  style: TextButton.styleFrom(foregroundColor: AppTheme.danger),
                  icon: const Icon(Icons.delete_outline, size: 16),
                  label: const Text('DELETE'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
