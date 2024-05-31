// // controllers/product_controller.dart
// import 'package:get/get.dart';
// import 'package:patron_dashboard/sceens/products/product_services.dart';
// import 'dart:io';
//
// class ProductController extends GetxController {
//   final ProductService productService = Get.put(ProductService());
//
//   var products = <dynamic>[].obs;
//   var productDetails = {}.obs;
//   var topProducts = <dynamic>[].obs;
//   var isLoading = false.obs;
//
//   var colors = <dynamic>[].obs;
//   var sizes = <dynamic>[].obs;
//   var shapes = <dynamic>[].obs;
//   var categories = <dynamic>[].obs;
//   var fabrics = <dynamic>[].obs;
//
//   @override
//   void onInit() {
//     fetchAllProducts();
//     fetchTopProducts();
//     super.onInit();
//   }
//
//   void fetchAllProducts() async {
//     isLoading(true);
//     try {
//       products.value = await productService.getAllProducts();
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   void fetchProductDetails(int id) async {
//     isLoading(true);
//     try {
//       productDetails.value = await productService.getProductDetails(id);
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   void createProduct({
//     required String name,
//     required String description,
//     required String code,
//     required File basicImage,
//     required int colorId,
//     required int sizeId,
//     required int shapeId,
//     required int fabricId,
//     required int categoryId,
//     required File additionalImage,
//   }) async {
//     isLoading(true);
//     try {
//       await productService.createProduct(
//         name: name,
//         description: description,
//         code: code,
//         basicImage: basicImage,
//         colorId: colorId,
//         sizeId: sizeId,
//         shapeId: shapeId,
//         fabricId: fabricId,
//         categoryId: categoryId,
//         additionalImage: additionalImage,
//       );
//       fetchAllProducts();
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   void deleteProduct(int id) async {
//     isLoading(true);
//     try {
//       await productService.deleteProduct(id);
//       fetchAllProducts();
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   void fetchTopProducts() async {
//     isLoading(true);
//     try {
//       topProducts.value = await productService.getTopProducts();
//     } finally {
//       isLoading(false);
//     }
//   }
//
//
//
//   void fetchData() async {
//     isLoading(true);
//     try {
//       colors.value = await productService.getColors();
//       sizes.value = await productService.getSizes();
//       shapes.value = await productService.getShapes();
//       categories.value = await productService.getCategories();
//       fabrics.value = await productService.getFabrics();
//     } finally {
//       isLoading(false);
//     }
//   }
//
// }
