import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:shopping_app/core/common_widgets/custom_snack_bar.dart';
import 'package:shopping_app/core/utils/routes/app_routes.dart';

class ShoppingCartController extends GetxController {
  final PersistentShoppingCart _cart = PersistentShoppingCart();
  final RxList<PersistentShoppingCartItem> items =
      <PersistentShoppingCartItem>[].obs;
  final RxBool isLoading = true.obs;
  final RxnString errorMessage = RxnString();

  late final Future<void> _initialLoad;
  Future<void> _pendingOperation = Future<void>.value();

  int get itemCount => items.fold(0, (total, item) => total + item.quantity);

  double get subtotal =>
      items.fold(0, (total, item) => total + item.totalPrice);

  @override
  void onInit() {
    super.onInit();
    _initialLoad = reloadCart();
  }

  Future<void> get cartLoaded => _initialLoad;

  Future<bool> addProduct(Map<String, dynamic> product) async {
    final productId = product['id']?.toString();
    final productName = product['title'];
    final unitPrice = _parsePrice(product['price']);
    if (productId == null ||
        productId.isEmpty ||
        productName is! String ||
        productName.trim().isEmpty ||
        unitPrice == null) {
      CustomSnackBar.showError(
        title: 'Unable to add product',
        message: 'The product details are incomplete or invalid.',
      );
      return false;
    }
    if (product['inStock'] == false) {
      CustomSnackBar.showError(
        title: 'Out of stock',
        message: 'This product is currently unavailable.',
      );
      return false;
    }

    return _serialize(() async {
      await cartLoaded;
      if (errorMessage.value != null) return false;

      // CHANGED: Package addToCart resets existing quantities, so duplicates use its increment API.
      final existingItem = _readCartItems().where(
        (item) => item.productId == productId,
      );
      if (existingItem.isNotEmpty) {
        await _cart.incrementCartItemQuantity(productId);
      } else {
        await _cart.addToCart(
          PersistentShoppingCartItem(
            productId: productId,
            productName: productName.trim(),
            productDescription: product['description'] is String
                ? product['description'] as String
                : null,
            productThumbnail: product['image'] is String
                ? product['image'] as String
                : null,
            unitPrice: unitPrice,
            quantity: 1,
          ),
        );
      }
      _refreshCart();
      CustomSnackBar.showSuccess(
        title: 'Added to cart',
        message: '${productName.trim()} add successfully!',
        actionLabel: 'Go to cart',
        onAction: () => Get.toNamed(AppRoutes.shoppingCart),
      );
      return true;
    }, onError: () => false);
  }

  Future<void> increaseQuantity(String productId) {
    return _serialize(() async {
      await cartLoaded;
      if (errorMessage.value != null) return;
      if (!_readCartItems().any((item) => item.productId == productId)) return;

      await _cart.incrementCartItemQuantity(productId);
      _refreshCart();
    }, onError: () {});
  }

  Future<void> decreaseQuantity(String productId) {
    return _serialize(() async {
      await cartLoaded;
      if (errorMessage.value != null) return;
      final item = _readCartItems().where(
        (item) => item.productId == productId,
      );
      if (item.isEmpty || item.first.quantity <= 1) return;

      await _cart.decrementCartItemQuantity(productId);
      _refreshCart();
    }, onError: () {});
  }

  Future<void> removeProduct(String productId) {
    return _serialize(() async {
      await cartLoaded;
      if (errorMessage.value != null) return;
      await _cart.removeFromCart(productId);
      _refreshCart();
      CustomSnackBar.showInfo(
        title: 'Removed from cart',
        message: 'The item has been removed.',
      );
    }, onError: () {});
  }

  Future<void> reloadCart() async {
    isLoading.value = true;
    errorMessage.value = null;
    try {
      _refreshCart();
    } catch (error, stackTrace) {
      errorMessage.value = 'Your cart could not be loaded.';
      debugPrint('Shopping cart load failed: $error\n$stackTrace');
      CustomSnackBar.showError(
        title: 'Cart unavailable',
        message: errorMessage.value!,
      );
    } finally {
      isLoading.value = false;
    }
  }

  List<PersistentShoppingCartItem> _readCartItems() {
    final cartItems = _cart.getCartData()['cartItems'];
    if (cartItems is! List ||
        cartItems.any((item) => item is! PersistentShoppingCartItem)) {
      throw const FormatException('Shopping cart data is invalid.');
    }
    return cartItems.cast<PersistentShoppingCartItem>();
  }

  void _refreshCart() {
    items.assignAll(_readCartItems());
    errorMessage.value = null;
  }

  Future<T> _serialize<T>(
    Future<T> Function() operation, {
    required T Function() onError,
  }) async {
    final previousOperation = _pendingOperation;
    final completed = Completer<void>();
    _pendingOperation = completed.future;
    await previousOperation;
    try {
      return await operation();
    } catch (error, stackTrace) {
      errorMessage.value = 'Your cart could not be updated.';
      debugPrint('Shopping cart update failed: $error\n$stackTrace');
      CustomSnackBar.showError(
        title: 'Cart update failed',
        message: errorMessage.value!,
      );
      return onError();
    } finally {
      completed.complete();
    }
  }

  double? _parsePrice(dynamic value) {
    if (value is num) {
      if (!value.isFinite || value < 0) return null;
      return value.toDouble();
    }
    if (value is! String) return null;
    final normalized = value.replaceAll(',', '').replaceAll(r'$', '').trim();
    final parsed = double.tryParse(normalized);
    if (parsed == null || !parsed.isFinite || parsed < 0) return null;
    return parsed;
  }
}
