import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:restaurantappflutter/models/models.dart';
part 'user_services.dart';
part 'food_services.dart';
part 'transaction_services.dart';

String baseUrl = 'http://foodmartketbackend.lintangprayogo.xyz/api/';
