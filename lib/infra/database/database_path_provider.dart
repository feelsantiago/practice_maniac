import 'package:path_provider/path_provider.dart' as path_provider;

class DatabasePathProvider {
  late final String path;

  Future<String> find() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    path = appDocumentDir.path;

    return path;
  }
}
