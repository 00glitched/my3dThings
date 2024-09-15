// Parámetros
R = 50; // Radio
H = 10; // Ancho
A = 5; // Amplitud
n = 2; // Coeficiente de frecuencia
F = n * R; // Frecuencia
pi = 3.14159265359;

// Generar función seno en 2D
module seno2D() {
  for (x = [-R : R]) {
    y = A * sin(2 * pi * F * x / R);
    translate([x, y, 0]) {
      circle(r = 0.5);
    }
  }
}

// Extruir a 180°
module extrusion() {
  rotate_extrude(angle=180,convexity = 10){
    seno2D();
  }
}

// Llamar al módulo de extrusión
extrusion();