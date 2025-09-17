var
  x: integer;
  y: integer;

function stepen(a: integer; b: integer): real;
begin
  if b = 0 then
    stepen := 1
  else if b < 0 then
    stepen := 1 / stepen(a, -b)
  else
    stepen := a * stepen(a, b - 1);
end;

begin
  writeln('число?');
  readln(x);
  writeln('степень?');
  readln(y);
  writeln(stepen(x, y):0:2);
end.

