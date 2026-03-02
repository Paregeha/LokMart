import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/widgets/cart/custom_item_cart_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/products/blocs/products_bloc.dart';
import '../../features/products/blocs/products_state.dart';
import '../../features/products/models/products.dart';
import '../../features/wishlist/blocs/wishlist_bloc.dart';
import '../../features/wishlist/blocs/wishlist_state.dart';
import '../../resources/app_fonts.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Wishlists',
          style: TextStyle(fontWeight: AppFonts.w800extraBold),
        ),
        centerTitle: false,
        scrolledUnderElevation: 0,
        titleSpacing: 32.0,
        backgroundColor: AppColors.white,
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, wState) {
          final favIds = wState.when(
            initial: () => const <int>{},
            loading: (_, ids) => ids,
            ready: (ids) => ids,
            failure: (_, ids) => ids,
          );

          return BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, pState) {
              return pState.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading:
                    (_) => const Center(child: CircularProgressIndicator()),
                failure: (m) => Center(child: Text('Error: $m')),
                loadingMore: (products, _) => _WishlistList(products, favIds),
                success: (products) => _WishlistList(products, favIds),
              );
            },
          );
        },
      ),
    );
  }
}

class _WishlistList extends StatelessWidget {
  const _WishlistList(this.products, this.favIds);

  final List<Products> products;
  final Set<int> favIds;

  @override
  Widget build(BuildContext context) {
    final favProducts = products.where((p) => favIds.contains(p.id)).toList();

    if (favProducts.isEmpty) {
      return const Center(
        child: Text(
          'Wishlist is empty',
          style: TextStyle(color: AppColors.softGray),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
      itemCount: favProducts.length,
      separatorBuilder: (_, __) => const SizedBox(height: 25),
      itemBuilder: (_, i) => CustomItemCartWidget(products: favProducts[i]),
    );
  }
}
