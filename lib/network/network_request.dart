

import 'dart:convert';
import 'package:advisorylawyer/model/post.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

class NetworkRequest{
  static List<Post> parsePost(String responseBody){
    var list = json.decode(responseBody) as List<dynamic>;
    List<Post> posts= list.map((model) => Post.fromJson(model)).toList();
    return posts;

  }

  static Future<List<Post>> fetachPosts({int page =1}) async{
    const String url = 'https://jsonplaceholder.typicode.com/posts';
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      print("connect ");
      return compute(parsePost, response.body);
    } else if(response.statusCode == 404){
      print("Not found ");
      throw Exception('Not Found');
    }else{
      print("Fail to connect");
      throw Exception('Failed to get post');
    }


  }

  /*Future<List<Post>> fetchProducts() async { 
   final response = await http.get('http://192.168.1.2:8000/products.json' as Uri); 
   if (response.statusCode == 200) { 
      return parseProducts(response.body); 
   } else { 
      throw Exception('Unable to fetch products from the REST API');
   } 
}*/




}