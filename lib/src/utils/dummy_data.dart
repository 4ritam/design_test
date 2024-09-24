import 'dart:math';

import '../models/project_model.dart';

final dummyData = List.generate(
  10,
  (index) => Project(
    title: "Kemampuan Merangkum Tulisan",
    description: "Oleh Al-Baiqi Samaan",
    author: "BAHASA SUNDA",
    image: "assets/images/${Random().nextInt(5) + 1}.jpeg",
  ),
);
