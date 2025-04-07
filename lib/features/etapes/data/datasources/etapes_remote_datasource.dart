import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tour_de_france/core/errors/exceptions.dart';
import 'package:tour_de_france/features/etapes/data/models/etape_model.dart';

abstract interface class EtapesRemoteDatasource {
  Future<EtapeModel> addEtape(EtapeModel etape);
  Future<EtapeModel> removeEtape(EtapeModel etape);
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
          .select('*, vd:ville_depart(nom), va:ville_arrivee(nom)')
          .order('numero', ascending: true);
      return etapes.map((etape) => EtapeModel.fromJson(etape)).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<EtapeModel> addEtape(EtapeModel etape) async {
    try {
      await supabaseClient
          .from('etapes')
          .insert(etape.toJson())
          .select()
          .single();
      return etape;
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<EtapeModel> removeEtape(EtapeModel etape) async {
    try {
      await supabaseClient
          .from('etapes')
          .delete()
          .eq('annee_edition', etape.annee)
          .eq('numero', etape.numero)
          .select()
          .single();
      return etape;
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
