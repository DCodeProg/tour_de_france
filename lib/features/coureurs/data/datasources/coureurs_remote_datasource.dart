import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tour_de_france/core/errors/exceptions.dart';
import 'package:tour_de_france/features/coureurs/data/models/coureur_model.dart';

abstract interface class CoureursRemoteDatasource {
  Future<List<CoureurModel>> getAllCoureurs();
}

class CoureursRemoteDatasourceImpl implements CoureursRemoteDatasource {
  final SupabaseClient supabaseClient;
  CoureursRemoteDatasourceImpl(this.supabaseClient);

  @override
  Future<List<CoureurModel>> getAllCoureurs() async {
    try {
      final coureurs = await supabaseClient
          .from('coureurs')
          .select()
          .order('nom', ascending: true);
      return coureurs.map((coureur) => CoureurModel.fromJson(coureur)).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}