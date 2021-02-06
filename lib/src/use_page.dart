part of katana_routing;

Map<String, dynamic> useArg() {
  final context = useContext();
  return ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
      const {};
}

String useName() {
  final context = useContext();
  return ModalRoute.of(context)?.settings.name ?? "";
}
