import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/resources/app_fonts.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_circle_radio_button_widget.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_square_check_box_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../features/products/models/products_filter.dart';
import '../../gen/assets.gen.dart';

class FilterOptionsPage extends StatefulWidget {
  final ProductsFilter initialFilter;

  const FilterOptionsPage({super.key, required this.initialFilter});

  @override
  State<FilterOptionsPage> createState() => _FilterOptionsPageState();
}

class _FilterOptionsPageState extends State<FilterOptionsPage> {
  late RangeValues _price;

  int? _selectedRatingRange;
  int? _selectedDiscountRange;

  // ✅ це НЕ categoryId з бекенду. Це просто індекс 1..4 для UI
  int? _selectedCategoryIndex;

  bool _discount = false;
  bool _freeShipping = false;
  bool _voucher = false;
  bool _sameDay = false;

  @override
  void initState() {
    super.initState();

    final f = widget.initialFilter;

    _price = RangeValues(f.minPrice, f.maxPrice);

    _selectedRatingRange = _ratingGroupFromFilter(f);
    _selectedDiscountRange = _discountGroupFromFilter(f);

    // ✅ тепер категорія береться з title, а не з id
    _selectedCategoryIndex = _indexFromCategoryTitle(f.categoryTitle);

    _discount = f.onlyDiscount;
    _freeShipping = f.onlyFreeShipping;
    _voucher = f.onlyVoucher;
    _sameDay = f.onlySameDayDelivery;
  }

  // -------------------- MAPPINGS --------------------

  int? _ratingGroupFromFilter(ProductsFilter f) {
    if (f.minRating == null || f.maxRating == null) return null;
    if (f.minRating == 1 && f.maxRating == 2) return 1;
    if (f.minRating == 2 && f.maxRating == 3) return 2;
    if (f.minRating == 3 && f.maxRating == 4) return 3;
    if (f.minRating == 4 && f.maxRating == 5) return 4;
    return null;
  }

  ({double min, double max})? _ratingRangeFromGroup(int? g) {
    switch (g) {
      case 1:
        return (min: 1, max: 2);
      case 2:
        return (min: 2, max: 3);
      case 3:
        return (min: 3, max: 4);
      case 4:
        return (min: 4, max: 5);
      default:
        return null;
    }
  }

  int? _discountGroupFromFilter(ProductsFilter f) {
    if (f.minDiscountPercent == null || f.maxDiscountPercent == null)
      return null;
    if (f.minDiscountPercent == 10 && f.maxDiscountPercent == 20) return 1;
    if (f.minDiscountPercent == 25 && f.maxDiscountPercent == 50) return 2;
    if (f.minDiscountPercent == 50 && f.maxDiscountPercent == 70) return 3;
    if (f.minDiscountPercent == 70 && f.maxDiscountPercent == 100) return 4;
    return null;
  }

  ({double min, double max})? _discountRangeFromGroup(int? g) {
    switch (g) {
      case 1:
        return (min: 10, max: 20);
      case 2:
        return (min: 25, max: 50);
      case 3:
        return (min: 50, max: 70);
      case 4:
        return (min: 70, max: 100);
      default:
        return null;
    }
  }

  int? _indexFromCategoryTitle(String? t) {
    switch (t) {
      case 'Fresh Fruits':
        return 1;
      case 'Chicken':
        return 2;
      case 'Fresh Fish':
        return 3;
      case 'Fresh Dairy':
        return 4;
      default:
        return null;
    }
  }

  String? _categoryTitleFromIndex(int? idx) {
    switch (idx) {
      case 1:
        return 'Fresh Fruits';
      case 2:
        return 'Chicken';
      case 3:
        return 'Fresh Fish';
      case 4:
        return 'Fresh Dairy';
      default:
        return null;
    }
  }

  // -------------------- ACTIONS --------------------

  void _reset() {
    setState(() {
      const def = ProductsFilter();
      _price = RangeValues(def.minPrice, def.maxPrice);

      _selectedRatingRange = null;
      _selectedDiscountRange = null;
      _selectedCategoryIndex = null;

      _discount = false;
      _freeShipping = false;
      _voucher = false;
      _sameDay = false;
    });
  }

  void _apply() {
    final rating = _ratingRangeFromGroup(_selectedRatingRange);
    final disc = _discountRangeFromGroup(_selectedDiscountRange);
    final categoryTitle = _categoryTitleFromIndex(_selectedCategoryIndex);

    final result = ProductsFilter(
      minPrice: _price.start,
      maxPrice: _price.end,

      minRating: rating?.min,
      maxRating: rating?.max,

      minDiscountPercent: disc?.min,
      maxDiscountPercent: disc?.max,

      onlyDiscount: _discount,
      onlyFreeShipping: _freeShipping,
      onlyVoucher: _voucher,
      onlySameDayDelivery: _sameDay,

      // ✅ тут ми НЕ знаємо id, тому залишаємо null
      categoryId: null,

      // ✅ передаємо title для фільтрації в Strapi
      categoryTitle: categoryTitle,
    );

    context.pop(result);
  }

  // -------------------- UI --------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: SvgPicture.asset(
            Assets.icons.icClose.path,
            width: 24,
            height: 24,
          ),
        ),
        title: const Text(
          'Filter Options',
          style: TextStyle(
            fontFamily: AppFonts.fontFamily,
            fontWeight: AppFonts.w700bold,
            fontSize: 20,
            color: AppColors.dark,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _reset,
            child: const Text(
              'Reset',
              style: TextStyle(
                color: AppColors.orange,
                fontFamily: AppFonts.fontFamily,
                fontWeight: AppFonts.w600semiBold,
              ),
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    const Text(
                      'SORT BY PRICE RANGE',
                      style: TextStyle(
                        fontFamily: AppFonts.fontFamily,
                        fontWeight: AppFonts.w600semiBold,
                        fontSize: 14,
                        color: AppColors.dark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${_price.start.toInt()}',
                          style: const TextStyle(
                            fontFamily: AppFonts.fontFamily,
                            fontSize: 13,
                            color: AppColors.orange,
                          ),
                        ),
                        Text(
                          '\$${_price.end.toInt()}',
                          style: const TextStyle(
                            fontFamily: AppFonts.fontFamily,
                            fontSize: 13,
                            color: AppColors.orange,
                          ),
                        ),
                      ],
                    ),
                    RangeSlider(
                      values: _price,
                      min: 0,
                      max: 300,
                      activeColor: AppColors.orange,
                      onChanged: (values) => setState(() => _price = values),
                    ),

                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),

                    const Text(
                      'SORT BY RATING',
                      style: TextStyle(
                        fontFamily: AppFonts.fontFamily,
                        fontWeight: AppFonts.w600semiBold,
                        fontSize: 14,
                        color: AppColors.dark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildRatingOption(1, '1 - 2 Stars'),
                    const SizedBox(height: 20),
                    _buildRatingOption(2, '2 - 3 Stars'),
                    const SizedBox(height: 20),
                    _buildRatingOption(3, '3 - 4 Stars'),
                    const SizedBox(height: 20),
                    _buildRatingOption(4, '4 - 5 Stars'),
                    const SizedBox(height: 24),

                    const Divider(),
                    const SizedBox(height: 16),

                    const Text(
                      'SORT BY DISCOUNTS',
                      style: TextStyle(
                        fontFamily: AppFonts.fontFamily,
                        fontWeight: AppFonts.w600semiBold,
                        fontSize: 14,
                        color: AppColors.dark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildDiscountOption(1, '10 - 20%'),
                    const SizedBox(height: 20),
                    _buildDiscountOption(2, '25 - 50%'),
                    const SizedBox(height: 20),
                    _buildDiscountOption(3, '50 - 70%'),
                    const SizedBox(height: 20),
                    _buildDiscountOption(4, '70% above'),
                    const SizedBox(height: 24),

                    const Divider(),
                    const SizedBox(height: 16),

                    const Text(
                      'SORT BY OTHERS',
                      style: TextStyle(
                        fontFamily: AppFonts.fontFamily,
                        fontWeight: AppFonts.w600semiBold,
                        fontSize: 14,
                        color: AppColors.dark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCheckBoxOption(
                          label: 'Discount',
                          selected: _discount,
                          onTap: () => setState(() => _discount = !_discount),
                        ),
                        _buildCheckBoxOption(
                          label: 'Free Shipping',
                          selected: _freeShipping,
                          onTap:
                              () => setState(
                                () => _freeShipping = !_freeShipping,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCheckBoxOption(
                          label: 'Voucher',
                          selected: _voucher,
                          onTap: () => setState(() => _voucher = !_voucher),
                        ),
                        _buildCheckBoxOption(
                          label: 'Same Day Deli',
                          selected: _sameDay,
                          onTap: () => setState(() => _sameDay = !_sameDay),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),

                    const Text(
                      'SORT BY CATEGORIES',
                      style: TextStyle(
                        fontFamily: AppFonts.fontFamily,
                        fontWeight: AppFonts.w600semiBold,
                        fontSize: 14,
                        color: AppColors.dark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildCategoryOption(1, 'Fresh Fruits'),
                    const SizedBox(height: 20),
                    _buildCategoryOption(2, 'Chicken'),
                    const SizedBox(height: 20),
                    _buildCategoryOption(3, 'Fresh Fish'),
                    const SizedBox(height: 20),
                    _buildCategoryOption(4, 'Fresh Dairy'),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _apply,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'APPLY FILTER',
                    style: TextStyle(
                      fontFamily: AppFonts.fontFamily,
                      fontWeight: AppFonts.w700bold,
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingOption(int value, String label) {
    final selected = _selectedRatingRange == value;
    return InkWell(
      onTap:
          () => setState(() => _selectedRatingRange = selected ? null : value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: AppFonts.fontFamily,
              fontSize: 14,
              color: AppColors.dark,
            ),
          ),
          CustomCircleRadioButtonWidget(isSelected: selected),
        ],
      ),
    );
  }

  Widget _buildDiscountOption(int value, String label) {
    final selected = _selectedDiscountRange == value;
    return InkWell(
      onTap:
          () =>
              setState(() => _selectedDiscountRange = selected ? null : value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: AppFonts.fontFamily,
              fontSize: 14,
              color: AppColors.dark,
            ),
          ),
          CustomCircleRadioButtonWidget(isSelected: selected),
        ],
      ),
    );
  }

  Widget _buildCategoryOption(int index, String label) {
    final selected = _selectedCategoryIndex == index;
    return InkWell(
      onTap:
          () =>
              setState(() => _selectedCategoryIndex = selected ? null : index),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: AppFonts.fontFamily,
              fontSize: 14,
              color: AppColors.dark,
            ),
          ),
          CustomCircleRadioButtonWidget(isSelected: selected),
        ],
      ),
    );
  }

  Widget _buildCheckBoxOption({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CustomCheckBoxWidget(isSelected: selected, onPressed: onTap),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontFamily: AppFonts.fontFamily,
              fontSize: 14,
              color: AppColors.dark,
            ),
          ),
        ],
      ),
    );
  }
}
