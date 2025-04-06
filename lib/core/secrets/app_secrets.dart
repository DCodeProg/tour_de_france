import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppSecrets {
  static final String supabaseUrl = dotenv.env['SUPABASE_URL']!;
  static final String supabaseAnonKey = dotenv.env['SUPABASE_ANNON_KEY']!;
}