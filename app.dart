void main() {
  List<Vehiculo> vehiculos = [];

  Carro carro = Carro(
    "Mazda",
    "3",
    numeroPuertas: 4,
    anio: 2014,
    estado: "activo",
  );

  Motocicleta moto = Motocicleta(
    "Suzuki",
    "GN",
    cilindraje: 125,
    anio: 2018,
    estado: "activo",
  );

  vehiculos.add(carro);
  vehiculos.add(moto);

  for (Vehiculo v in vehiculos) {
    v.mostrarInfo();
    print("Costo servicio: ${v.calcularCostoServicio()}");
    print("---------------");
  }
}
class Vehiculo {
  String marca;
  String modelo;
  int anio;
  String _estado;

  Vehiculo(
    this.marca,
    this.modelo, {
    required this.anio,
    required String estado,
  }) : _estado = estado;

  String get estado => _estado;

  set estado(String nuevoEstado) {
    _estado = nuevoEstado;
  }

  void mostrarInfo() {
    print("Marca: $marca");
    print("Modelo: $modelo");
    print("Año: $anio");
    print("Estado: $_estado");
  }

  double calcularCostoServicio() {
    return 0;
  }
}
class Carro extends Vehiculo {
  int numeroPuertas;

  Carro(
    String marca,
    String modelo, {
    required this.numeroPuertas,
    required int anio,
    required String estado,
  }) : super(marca, modelo, anio: anio, estado: estado);

  @override
  double calcularCostoServicio() {
    if (estado == "inactivo") {
      print("Vehículo no disponible para servicio");
      return 0;
    }

    double costo = 50000;

    if (numeroPuertas > 4) {
      costo += 20000;
    } else {
      costo += 10000;
    }

    if ((DateTime.now().year - anio) > 10) {
      costo += 15000;
    }

    return costo;
  }

  bool esFamiliar() {
    return numeroPuertas > 4;
  }
}
class Motocicleta extends Vehiculo {
  int cilindraje;

  Motocicleta(
    String marca,
    String modelo, {
    required this.cilindraje,
    required int anio,
    required String estado,
  }) : super(marca, modelo, anio: anio, estado: estado);

  @override
  double calcularCostoServicio() {
    if (estado == "inactivo") {
      print("Motocicleta no disponible para servicio");
      return 0;
    }

    double costo = 30000;

    if (cilindraje > 200) {
      costo += 25000;
    } else {
      costo += 10000;
    }

    if ((DateTime.now().year - anio) > 5) {
      costo += 10000;
    }

    return costo;
  }

  bool esAltaCilindraje() {
    return cilindraje > 200;
  }
}
