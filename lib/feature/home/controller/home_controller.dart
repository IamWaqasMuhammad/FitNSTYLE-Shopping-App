import 'package:get/get.dart';
import 'package:shopping_app/core/common_widgets/loading_overlay.dart';

class HomeController extends GetxController {

  // ==================== POPUP MENU ====================

  final selectedMenuCategory = 'Men'.obs;
  final List<String> menuCategoryList = [
    'Men',
    'Women',
    'Kids',
    'Foot Wear',
  ];

  void changeMenuCategory(String category) {
    selectedMenuCategory.value = category;
  }

  final isMenuOpen = false.obs;

  void onMenuOpened() {
    isMenuOpen.value = true;
  }

  void onMenuClosed() {
    isMenuOpen.value = false;
  }


  // ==================== HOME CATEGORIES ====================
  final List<Map<String, String>> categories = [
    {
      'name': 'T-Shirts',
      'image':
      'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab',
    },
    {
      'name': 'Jeans',
      'image':
      'https://images.unsplash.com/photo-1542272604-787c3835535d',
    },
    {
      'name': 'Shirts',
      'image':
      'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf',
    },
    {
      'name': 'Hoodies',
      'image':
      'https://images.unsplash.com/photo-1556821840-3a63f95609a7',
    },
    {
      'name': 'Bags',
      'image':
      'https://images.unsplash.com/photo-1553062407-98eeb64c6a62',
    },
    {
      'name': 'Jackets',
      'image':
      'https://images.unsplash.com/photo-1551028719-00167b16eac5',
    },
    {
      'name': 'Shoes',
      'image':
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
    },
    {
      'name': 'Accessories',
      'image':
      'https://images.unsplash.com/photo-1523779917675-b6ed3a42a561',
    },
  ];

  // 🟢 CHANGED: Filter change hone par overlay loader chalane ki async logic
  void changeMenu(String? category) async {
    if (category == null) return;

    // 1. GetX Overlay Trigger: Is se screen block ho jayegi aur loader show hoga
    Get.showOverlay(
      asyncFunction: () async {
        // Mock network delay (E.g., 1.5 seconds tak load hoga data)
        await Future.delayed(const Duration(milliseconds: 1500));

        // Data update jo background filter list ko trigger karega
        selectedMenuCategory.value = category;
      },
      loadingWidget: const LoadingOverlay(), // Humara custom loading indicator widget
    );
  }



  // Dummy product List of top selling
  final List<Map<String, dynamic>> dummyProducts = [
    {
      "id": 1,
      "title": "Classic Oxford Shirt",
      "description": "Timeless oxford shirt crafted from premium cotton with a button-down collar and tailored fit.",
      "price": "\$59.00",
      "rating": 4.6,
      "genderCategory": "men",
      "productType": "shirt",
      "sizes": ["S", "M", "L", "XL"],
      "inStock": true,
      "image": "https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=800&q=80",
      "isFavorite": false,
    },
    {
      "id": 2,
      "title": "Slim Fit Chinos",
      "description": "Modern slim-fit chinos in stretch cotton twill for all-day comfort and style.",
      "price": "\$69.00",
      "rating": 4.4,
      "genderCategory": "men",
      "productType": "pant",
      "sizes": ["30", "32", "34", "36"],
      "inStock": true,
      "image": "https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=800&q=80",
      "isFavorite": false,
    },
    {
      "id": 3,
      "title": "Floral Summer Dress",
      "description": "Lightweight floral midi dress with a flattering A-line silhouette and breathable fabric.",
      "price": "\$89.00",
      "rating": 4.8,
      "genderCategory": "women",
      "productType": "dress",
      "sizes": ["XS", "S", "M", "L"],
      "inStock": true,
      "image": "https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=800&q=80",
      "isFavorite": false,
    },
    {
      "id": 4,
      "title": "Leather Belt",
      "description": "Full-grain leather belt with a brushed metal buckle, a versatile everyday accessory.",
      "price": "\$45.00",
      "rating": 4.5,
      "genderCategory": "men",
      "productType": "accessories",
      "sizes": ["M", "L", "XL"],
      "inStock": true,
      "image": "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=800&q=80",
      "isFavorite": false,
    },
    {
      "id": 5,
      "title": "White Sneakers",
      "description": "Minimalist white leather sneakers with cushioned insoles for everyday wear.",
      "price": "\$99.00",
      "rating": 4.7,
      "genderCategory": "women",
      "productType": "footwear",
      "sizes": ["36", "37", "38", "39", "40"],
      "inStock": true,
      "image": "https://images.unsplash.com/photo-1549298916-b41d501d3772?w=800&q=80",
      "isFavorite": false,
    },
    {
      "id": 6,
      "title": "Kids Dinosaur Tee",
      "description": "Fun dinosaur graphic t-shirt made from soft organic cotton for kids.",
      "price": "\$25.00",
      "rating": 4.9,
      "genderCategory": "kids",
      "productType": "shirt",
      "sizes": ["2T", "3T", "4T", "5T"],
      "inStock": true,
      "image": "https://images.unsplash.com/photo-1519238263530-99bdd11df2ea?w=800&q=80",
      "isFavorite": false,
    },
    {
      "id": 7,
      "title": "Denim Jacket",
      "description": "Classic denim jacket with a vintage wash and comfortable relaxed fit.",
      "price": "\$119.00",
      "rating": 4.6,
      "genderCategory": "men",
      "productType": "shirt",
      "sizes": ["S", "M", "L", "XL"],
      "inStock": true,
      "image": "https://images.unsplash.com/photo-1551537482-f2075a1d41f2?w=800&q=80",
      "isFavorite": false,
    },
    {
      "id": 8,
      "title": "High-Waist Jeans",
      "description": "Flattering high-waist skinny jeans with premium stretch denim.",
      "price": "\$79.00",
      "rating": 4.5,
      "genderCategory": "women",
      "productType": "pant",
      "sizes": ["24", "26", "28", "30"],
      "inStock": true,
      "image": "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?w=800&q=80",
      "isFavorite": false,
    },
    {
      "id": 9,
      "title": "Silk Scarf",
      "description": "Luxurious silk scarf with a hand-rolled edge and vibrant artistic print.",
      "price": "\$55.00",
      "rating": 4.7,
      "genderCategory": "women",
      "productType": "accessories",
      "sizes": ["One Size"],
      "inStock": true,
      "image": "https://images.unsplash.com/photo-1601924994987-69e26d50dc26?w=800&q=80",
      "isFavorite": false,
    },
    {
      "id": 10,
      "title": "Running Shoes",
      "description": "Lightweight performance running shoes with responsive cushioning and breathable mesh.",
      "price": "\$129.00",
      "rating": 4.8,
      "genderCategory": "men",
      "productType": "footwear",
      "sizes": ["40", "41", "42", "43", "44"],
      "inStock": true,
      "image": "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800&q=80",
      "isFavorite": false,
    },
    {
      "id": 11,
      "title": "Kids Denim Overalls",
      "description": "Durable denim overalls with adjustable straps and multiple pockets for play.",
      "price": "\$45.00",
      "rating": 4.6,
      "genderCategory": "kids",
      "productType": "pant",
      "sizes": ["2T", "3T", "4T", "5T"],
      "inStock": true,
      "image": "https://images.unsplash.com/photo-1522771930-78848d9293e8?w=800&q=80",
      "isFavorite": false,
    },
    {
      "id": 12,
      "title": "Linen Button-Up",
      "description": "Breathable linen button-up shirt perfect for warm weather and casual occasions.",
      "price": "\$75.00",
      "rating": 4.4,
      "genderCategory": "men",
      "productType": "shirt",
      "sizes": ["S", "M", "L", "XL"],
      "inStock": true,
      "image": "https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=800&q=80",
      "isFavorite": false,
    },
    {
      "id": 13,
      "title": "Wrap Midi Dress",
      "description": "Elegant wrap midi dress with a V-neckline and tie waist in flowing fabric.",
      "price": "\$95.00",
      "rating": 4.7,
      "genderCategory": "women",
      "productType": "dress",
      "sizes": ["XS", "S", "M", "L"],
      "inStock": true,
      "image": "https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?w=800&q=80",
      "isFavorite": false,
    },
    {
      "id": 14,
      "title": "Aviator Sunglasses",
      "description": "Classic aviator sunglasses with polarized lenses and lightweight metal frame.",
      "price": "\$85.00",
      "rating": 4.5,
      "genderCategory": "men",
      "productType": "accessories",
      "sizes": ["One Size"],
      "inStock": true,
      "image": "https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=800&q=80",
      "isFavorite": false,
    },
    {
      "id": 15,
      "title": "Ballet Flats",
      "description": "Soft leather ballet flats with a cushioned footbed and elegant bow detail.",
      "price": "\$79.00",
      "rating": 4.6,
      "genderCategory": "women",
      "productType": "footwear",
      "sizes": ["36", "37", "38", "39", "40"],
      "inStock": true,
      "image": "https://images.unsplash.com/photo-1560769629-975ec94e6a86?w=800&q=80",
      "isFavorite": false,
    },
    {
      "id": 16,
      "title": "Kids Striped Hoodie",
      "description": "Cozy striped hoodie in soft fleece with kangaroo pocket for everyday warmth.",
      "price": "\$35.00",
      "rating": 4.7,
      "genderCategory": "kids",
      "productType": "shirt",
      "sizes": ["4T", "5T", "6", "7"],
      "inStock": true,
      "image": "https://images.unsplash.com/photo-1503919545889-aef636e10ad4?w=800&q=80",
      "isFavorite": false,
    },
    {
      "id": 17,
      "title": "Cargo Pants",
      "description": "Utility cargo pants with multiple pockets and a relaxed tapered fit.",
      "price": "\$89.00",
      "rating": 4.3,
      "genderCategory": "men",
      "productType": "pant",
      "sizes": ["30", "32", "34", "36"],
      "inStock": true,
      "image": "https://images.unsplash.com/photo-1517438476312-10d79c077509?w=800&q=80",
      "isFavorite": false,
    },
    {
      "id": 18,
      "title": "Cashmere Sweater",
      "description": "Ultra-soft cashmere sweater with a relaxed fit and ribbed trims.",
      "price": "\$189.00",
      "rating": 4.9,
      "genderCategory": "women",
      "productType": "shirt",
      "sizes": ["XS", "S", "M", "L"],
      "inStock": true,
      "image": "https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=800&q=80",
      "isFavorite": false,
    },
    {
      "id": 19,
      "title": "Leather Crossbody Bag",
      "description": "Compact leather crossbody bag with adjustable strap and gold-tone hardware.",
      "price": "\$149.00",
      "rating": 4.8,
      "genderCategory": "women",
      "productType": "accessories",
      "sizes": ["One Size"],
      "inStock": true,
      "image": "https://images.unsplash.com/photo-1548036328-c9fa89d128fa?w=800&q=80",
      "isFavorite": false,
    },
    {
      "id": 20,
      "title": "Chelsea Boots",
      "description": "Classic Chelsea boots in premium suede with elastic side panels and pull tabs.",
      "price": "\$159.00",
      "rating": 4.7,
      "genderCategory": "men",
      "productType": "footwear",
      "sizes": ["40", "41", "42", "43", "44"],
      "inStock": true,
      "image": "https://images.unsplash.com/photo-1638247025967-b4e38f787b76?w=800&q=80",
      "isFavorite": false,
    },
  ];


}