program dkr3;

function func(x: real): real;
begin
    func := 1 * x * x * x + (- 2) * x * x + (- 2) * x + (12);
end;

function levimetod(a, b: real; n: integer): real;
var
    dx, y, x: real;
    i: integer;
begin
    dx := (b - a) / n;
    y := 0;
    x := a; 
    while x < b do
    begin
        y := y + func (x);
        x := x + dx;
    end;
    y:= y * dx;
    levimetod := y;
end;
function pogreshnost(truerazmer, approxrazmer: real): real;
begin
  pogreshnost := abs((truerazmer - approxrazmer) / truerazmer) * 100
end;

var
    a, b: real;
    n: integer;
    wrongp, truep, error: real;
    choice: integer;

begin
  repeat
  writeln('Выберите действие для вычисления площади фигуры: ');
  writeln('1. Ввести значения интегрирования фигуры');
  writeln('2. Произвести вычисления по заданным значениям +  вычисление погрешности');
  writeln('3. Вывод полученных результатов');
  readln(choice);
  case choice of
    1 : begin
        writeln('Введите левую границу интегрирования (a): ');
        readln(a);
        writeln('Введите правую границу интегрирования (b): ');
        readln(b);
        writeln('Введите количество прямоугольников (n): ');
        readln(n);
        end;
    2 : begin
        wrongp := levimetod(a, b, n);               
        truep := levimetod(a, b, n * 2);
        error := pogreshnost(truep, wrongp );
        end;
    3 : begin
        writeln('Приближенная площадь фигуры: ', wrongp:0:4);
        writeln('Более правдивая площадь фигуры: ', truep:0:4);
        writeln('Примерная погрешность: ', error:0:2, '%');
        end;
  end;
     until choice = 3;            
end.
