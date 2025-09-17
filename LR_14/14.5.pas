function GCD(a, b: integer): integer;
begin
  if b = 0 then
    GCD := a
  else
    GCD := GCD(b, a mod b);
end;

var
  result: integer;
begin
  result := GCD(3430, 1365);
  writeln('НОД: ', result);
end.
