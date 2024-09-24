import 'package:design_test/src/models/project_model.dart';
import 'package:design_test/src/utils/dummy_data.dart';

class ProjectController {
  List<Project> getProjects() {
    return dummyData;
  }

  List<Project> searchProjects(String query) {
    return dummyData
        .where((project) =>
            project.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
