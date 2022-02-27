import 'package:flutter/material.dart';

class Paging{
  int? totalNumber;
  int currentPage;
  int pageSize;

  Paging({
    required this.currentPage,
    required this.pageSize
  });
}