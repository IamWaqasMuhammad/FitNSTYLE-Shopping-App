import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/core/common_widgets/custom_snack_bar.dart';

class WishlistController extends GetxController {
  static const String _storageKey = 'fitnstyle_wishlist';

  final RxList<Map<String, dynamic>> products = <Map<String, dynamic>>[].obs;
  final RxBool isLoading = true.obs;
  final RxnString loadError = RxnString();
  final RxnString saveError = RxnString();

  late final Future<void> _loadFuture;

  @override
  void onInit() {
    super.onInit();
    _loadFuture = loadWishlist();
  }

  Future<void> get wishlistLoaded => _loadFuture;

  bool isWishlisted(Map<String, dynamic> product) {
    final productId = product['id']?.toString();
    return productId != null &&
        products.any((saved) => saved['id']?.toString() == productId);
  }

  Future<void> toggleProduct(Map<String, dynamic> product) async {
    await wishlistLoaded;
    final productId = product['id']?.toString();
    final title = product['title'];
    final price = product['price'];
    if (productId == null ||
        productId.isEmpty ||
        title is! String ||
        title.trim().isEmpty ||
        (price is! String && price is! num)) {
      CustomSnackBar.showError(
        message: 'Unable to update wishlist',
        title: 'Update wishlist',
      );
      return;
    }

    if (isWishlisted(product)) {
      products.removeWhere((saved) => saved['id']?.toString() == productId);
      await _saveWishlist();
      CustomSnackBar.showInfo(
        message: '${title.trim()} removed successfully!',
        title: 'Remove from wishlist',
      );
      return;
    }

    // CHANGED: Keep one saved product per stable product ID in the profile wishlist.
    products.add(Map<String, dynamic>.from(product));
    await _saveWishlist();
    CustomSnackBar.showSuccess(
      message: '${title.trim()} added successfully!',
      title: 'Added to wishlist',
    );
  }

  Future<void> removeProduct(String productId) async {
    await wishlistLoaded;
    products.removeWhere((product) => product['id']?.toString() == productId);
    await _saveWishlist();
  }

  Future<void> loadWishlist() async {
    isLoading.value = true;
    loadError.value = null;
    try {
      final preferences = await SharedPreferences.getInstance();
      final storedWishlist = preferences.getString(_storageKey);
      if (storedWishlist == null) {
        products.clear();
        return;
      }

      final decoded = jsonDecode(storedWishlist);
      if (decoded is! List) {
        throw const FormatException('Saved wishlist must be a list.');
      }
      final restoredProducts = decoded.map((entry) {
        if (entry is! Map<String, dynamic> ||
            entry['id'] == null ||
            entry['title'] is! String ||
            (entry['price'] is! String && entry['price'] is! num)) {
          throw const FormatException('Saved wishlist product is invalid.');
        }
        return Map<String, dynamic>.from(entry);
      }).toList();
      products.assignAll(restoredProducts);
    } catch (error, stackTrace) {
      loadError.value = 'Wishlist could not be loaded.';
      debugPrint('Wishlist load failed: $error\n$stackTrace');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _saveWishlist() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final saved = await preferences.setString(
        _storageKey,
        jsonEncode(products.toList()),
      );
      if (!saved) {
        throw StateError('Wishlist could not be saved to local storage.');
      }
      saveError.value = null;
    } catch (error, stackTrace) {
      saveError.value = 'Wishlist changes could not be saved.';
      debugPrint('Wishlist save failed: $error\n$stackTrace');

      CustomSnackBar.showInfo(
        title: 'Wishlist not saved',
        message:
            'Your current items are visible but may not be available next time.',
      );
    }
  }
}
