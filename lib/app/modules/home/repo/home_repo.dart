class HomeRepo{

  int valorInicialDoContador = 0;

  int get_HttpRequest_BackEnd (){
    return valorInicialDoContador;
  }

  void post_HttpRequest_BackEnd(int novoValor){
    valorInicialDoContador = novoValor;
  }

}