class Etape {
  final int annee;
  final int numero;
  final String type;
  final DateTime date;
  final double distance;
  final String? villeDepart;
  final String? villeArrivee;

  Etape({
    required this.annee,
    required this.numero,
    required this.type,
    required this.date,
    required this.distance,
    required this.villeDepart,
    required this.villeArrivee,
  });
}
