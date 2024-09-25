import 'dart:math';

import '../models/project_model.dart';

final dummyData = List.generate(
  10,
  (index) => Project(
    title: "Kemampuan Merangkum Tulisan",
    author: "Oleh Al-Baiqi Samaan",
    language: "BAHASA SUNDA",
    image: "assets/images/${Random().nextInt(5) + 1}.jpeg",
  ),
);
