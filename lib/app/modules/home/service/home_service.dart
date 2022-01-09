class HomeService {
  int contador;

  HomeService({required this.contador});

  int incrementador() {
    return contador++;
  }
}