import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_architecture/features/products/blocs/products_bloc.dart';
import 'package:flutter_base_architecture/features/products/blocs/products_event.dart';
import 'package:flutter_base_architecture/features/products/blocs/products_state.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/resources/app_fonts.dart';
import 'package:flutter_base_architecture/widgets/cart/custom_item_cart_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/products/models/products_filter.dart';
import '../../gen/assets.gen.dart';
import '../../routes/app_routes.dart';
import '../../widgets/buttons/custom_filter_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, this.initialFilter = const ProductsFilter()});

  final ProductsFilter initialFilter;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  String _currentQuery = '';
  String? _lastSavedTerm;

  static const _prefsKey = 'recent_searches';
  List<String> _recentSearches = [];

  late ProductsFilter _filter;

  @override
  void initState() {
    super.initState();
    _filter = widget.initialFilter;
    _loadRecentSearches();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadRecentSearches() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final fromPrefs = prefs.getStringList(_prefsKey) ?? [];
      setState(() {
        _recentSearches = fromPrefs;
      });
    } on PlatformException catch (e) {
      debugPrint('SharedPreferences PlatformException: $e');
      setState(() => _recentSearches = []);
    } catch (e) {
      debugPrint('SharedPreferences unknown error: $e');
      setState(() => _recentSearches = []);
    }
  }

  Future<void> _saveRecentTerm(String term) async {
    final trimmed = term.trim();
    if (trimmed.isEmpty) return;
    if (trimmed.length < 2) return;
    if (trimmed == _lastSavedTerm) return;

    _lastSavedTerm = trimmed;

    try {
      final prefs = await SharedPreferences.getInstance();
      final current = prefs.getStringList(_prefsKey) ?? [];

      current.remove(trimmed);
      current.insert(0, trimmed);

      final limited = current.length > 10 ? current.sublist(0, 10) : current;

      await prefs.setStringList(_prefsKey, limited);
      setState(() {
        _recentSearches = limited;
      });
    } catch (e) {
      debugPrint('Failed to save recent search: $e');
    }
  }

  Future<void> _clearRecent() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_prefsKey);
    } catch (e) {
      debugPrint('Failed to clear recent searches: $e');
    }
    setState(() {
      _recentSearches = [];
      _lastSavedTerm = null;
    });
  }

  void _runSearch(String value) {
    setState(() => _currentQuery = value);

    context.read<ProductsBloc>().add(
      ProductsEvent.fetchFirst(
        search: value.isEmpty ? null : value,
        filter: _filter,
      ),
    );
  }

  void _onChanged(String value) => _runSearch(value);

  void _onSubmitted(String value) {
    _runSearch(value);
    _saveRecentTerm(value);
  }

  void _onTapRecent(String term) {
    _controller.text = term;
    _onSubmitted(term);
  }

  Future<void> _openFilter() async {
    final newFilter = await context.push<ProductsFilter?>(
      AppRoutes.filterOptionsPage,
      extra: _filter,
    );

    if (newFilter != null) {
      setState(() => _filter = newFilter);
      _runSearch(_currentQuery);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => context.go(AppRoutes.home),
          icon: SvgPicture.asset(
            Assets.icons.icClose.path,
            width: 24,
            height: 24,
          ),
        ),
        title: const Text(
          'Search',
          style: TextStyle(
            fontFamily: AppFonts.fontFamily,
            fontWeight: AppFonts.w700bold,
            fontSize: 20,
            color: AppColors.dark,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onChanged: _onChanged,
                      onSubmitted: _onSubmitted,
                      decoration: InputDecoration(
                        hintText: 'Fresh',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            Assets.icons.icSearch.path,
                            width: 20,
                            height: 20,
                          ),
                        ),
                        filled: true,
                        fillColor: AppColors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 12,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.gray1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.orange),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  CustomFilterWidget(onPressed: _openFilter),
                ],
              ),
            ),
            const SizedBox(height: 24),

            if (_recentSearches.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recent Search',
                      style: TextStyle(
                        fontFamily: AppFonts.fontFamily,
                        fontWeight: AppFonts.w700bold,
                        fontSize: 16,
                        color: AppColors.dark,
                      ),
                    ),
                    TextButton(
                      onPressed: _clearRecent,
                      child: const Text(
                        'Clear All',
                        style: TextStyle(
                          fontFamily: AppFonts.fontFamily,
                          fontWeight: AppFonts.w600semiBold,
                          fontSize: 14,
                          color: AppColors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              ..._recentSearches.map(
                (term) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: InkWell(
                    onTap: () => _onTapRecent(term),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              term,
                              style: const TextStyle(
                                fontFamily: AppFonts.fontFamily,
                                fontSize: 14,
                                color: AppColors.dark,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SvgPicture.asset(
                            Assets.icons.arrow.path,
                            width: 24,
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Divider(
                color: AppColors.gray1,
                thickness: 4.0,
                height: 4.0,
              ),
              const SizedBox(height: 16),
            ],

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Search Result',
                style: TextStyle(
                  fontFamily: AppFonts.fontFamily,
                  fontWeight: AppFonts.w600semiBold,
                  fontSize: 16,
                  color: AppColors.dark,
                ),
              ),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: BlocBuilder<ProductsBloc, ProductsState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading:
                          (_) =>
                              const Center(child: CircularProgressIndicator()),
                      failure:
                          (message) => Center(
                            child: Text(
                              'Failed to load products.\n$message',
                              textAlign: TextAlign.center,
                            ),
                          ),
                      success: (products) {
                        if (_currentQuery.isNotEmpty && products.isEmpty) {
                          return const Center(
                            child: Text(
                              'No results found',
                              style: TextStyle(color: AppColors.softGray),
                            ),
                          );
                        }
                        return ListView.separated(
                          padding: const EdgeInsets.only(top: 8),
                          itemCount: products.length,
                          separatorBuilder:
                              (_, _) => const SizedBox(height: 16),
                          itemBuilder:
                              (_, i) =>
                                  CustomItemCartWidget(products: products[i]),
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
