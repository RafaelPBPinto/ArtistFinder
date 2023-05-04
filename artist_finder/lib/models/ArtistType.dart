class ArtistType {
  String artistType;
  String style;

  ArtistType(
      {required this.artistType,
      required this.style
      });

  @override
  String toString() {
    return "Type of artist: $artistType , style: $style ";
  }
}