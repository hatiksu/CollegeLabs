program TriangleExistence;

var
  a, b, c: Real;
  T: Boolean;

begin
  Write('Введите длины сторон a, b, c: ');
  ReadLn(a, b, c);

  T := not ((a + b > c) and (a + c > b) and (b + c > a));  { Проверка условия несуществования треугольника }

  if T then
    WriteLn('Треугольник не существует')
  else
    WriteLn('Треугольник существует');
end.
