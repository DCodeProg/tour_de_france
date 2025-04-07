import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tour_de_france/core/errors/exceptions.dart';
import 'package:tour_de_france/features/equipes/data/models/equipe_model.dart';

abstract interface class EquipesRemoteDataSource {
  Future<List<EquipeModel>> getAllEquipes();
}

class EquipesRemoteDataSourceImpl implements EquipesRemoteDataSource {
  final SupabaseClient supabaseClient;
  EquipesRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<List<EquipeModel>> getAllEquipes() async {
    try {
      final equipes = await supabaseClient
          .from('equipes')
          .select()
          .order('nom', ascending: true);
      return equipes.map((equipe) => EquipeModel.fromJson(equipe)).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}