import 'package:domato/data/dummy_data.dart';
import'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final MealsProvider = Provider((ref){
  return dummyMeals;

 });
