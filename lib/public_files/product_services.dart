// // services/product_service.dart
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:io';
// import 'package:http_parser/http_parser.dart';
// import 'package:path/path.dart';
// import 'package:patron_dashboard/confing/confing.dart';
//
// import '../../confing/set_header.dart';
// import 'confing.dart';
//
// class ProductService extends GetxService {
//
//   Future<List<dynamic>> getAllProducts() async {
//     final response = await http.get(Uri.parse(ServerConfing.domainNameServer+ServerConfing.createProduct));
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }
//
//   Future<Map<String, dynamic>> getProductDetails(int id) async {
//     final response = await http.get(Uri.parse(ServerConfing.domainNameServer+ServerConfing.showProductDetailes));
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load product details');
//     }
//   }
//
//
//   Future<Map<String, dynamic>> createProduct(
//       {
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
//   }) async
//   {
//     var request = http.MultipartRequest('POST', Uri.parse(ServerConfing.domainNameServer+ServerConfing.createProduct));
//     request.fields['name'] = name;
//     request.fields['description'] = description;
//     request.fields['code'] = code;
//     request.fields['details[0][color_id]'] = colorId.toString();
//     request.fields['details[0][size_id]'] = sizeId.toString();
//     request.fields['shapes[0]'] = shapeId.toString();
//     request.fields['fabrics[0]'] = fabricId.toString();
//     request.fields['categories[0]'] = categoryId.toString();
//
//     request.files.add(await http.MultipartFile.fromPath(
//       'basic_image',
//       basicImage.path,
//       contentType: MediaType('image', 'jpeg'),
//     ));
//
//     request.files.add(await http.MultipartFile.fromPath(
//       'images[0]',
//       additionalImage.path,
//       contentType: MediaType('image', 'jpeg'),
//     ));
//
//     var response = await request.send();
//
//     if (response.statusCode == 201) {
//       var responseData = await response.stream.bytesToString();
//       return json.decode(responseData);
//     } else {
//       throw Exception('Failed to create product');
//     }
//   }
//
//   Future<void> deleteProduct(int id) async {
//     final response = await http.delete(Uri.parse(ServerConfing.domainNameServer+ServerConfing.deleteProduct));
//     if (response.statusCode != 204) {
//       throw Exception('Failed to delete product');
//     }
//   }
//
//   Future<List<dynamic>> getTopProducts() async {
//     final response = await http.get(Uri.parse(ServerConfing.domainNameServer+ServerConfing.topProduct));
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load top products');
//     }
//   }
//
//   Future<List<dynamic>> getColors() async {
//     final response = await http.get(Uri.parse(ServerConfing.domainNameServer+ServerConfing.getColors),
//       headers: setHeaders(),
//     );
//     if (response.statusCode == 200) {
//       return json.decode(response.body)['data'];
//     } else {
//       throw Exception('Failed to load colors');
//     }
//   }
//
//   Future<List<dynamic>> getSizes() async {
//     final response = await http.get(Uri.parse(ServerConfing.domainNameServer+ServerConfing.getSizes),
//       headers: setHeaders(),
//     );
//     if (response.statusCode == 200) {
//       return json.decode(response.body)['data'];
//     } else {
//       throw Exception('Failed to load sizes');
//     }
//   }
//
//   Future<List<dynamic>> getShapes() async {
//     final response = await http.get(Uri.parse(ServerConfing.domainNameServer+ServerConfing.getShapes),      headers: setHeaders(),
//     );
//     if (response.statusCode == 200) {
//       return json.decode(response.body)['data'];
//     } else {
//       throw Exception('Failed to load shapes');
//     }
//   }
//
//   Future<List<dynamic>> getCategories() async {
//     final response = await http.get(Uri.parse(ServerConfing.domainNameServer+ServerConfing.getAllCategories),       headers: setHeaders(),
//     );
//     if (response.statusCode == 200) {
//       return json.decode(response.body)['data'];
//     } else {
//       throw Exception('Failed to load categories');
//     }
//   }
//
//   Future<List<dynamic>> getFabrics() async {
//     final response = await http.get(Uri.parse(ServerConfing.domainNameServer+ServerConfing.getAllFabrics),       headers: setHeaders(),
//     );
//     if (response.statusCode == 200) {
//       return json.decode(response.body)['data'];
//     } else {
//       throw Exception('Failed to load fabrics');
//     }
//   }
//
// }
