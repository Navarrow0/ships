

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Utils {
  String urlApi = dotenv.env['API_BASE']!;
}