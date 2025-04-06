import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tour_de_france/core/errors/exceptions.dart';
import 'package:tour_de_france/features/etapes/data/models/etape_model.dart';

abstract interface class EtapesRemoteDatasource {
  Future<List<EtapeModel>> getAllEtapes();
}

class EtapesRemoteDatasourceImpl implements EtapesRemoteDatasource {
  final SupabaseClient supabaseClient;
  EtapesRemoteDatasourceImpl(this.supabaseClient);

  @override
  Future<List<EtapeModel>> getAllEtapes() async {
    try {
      final etapes = await supabaseClient
          .from('etapes')
          .select(
            '*, vd:ville_depart(nom), va:ville_arrivee(nom)',
          )
          .order('numero', ascending: true);
      return etapes.map((etape) => EtapeModel.fromJson(etape)).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
