program SumToExample;

function CalculateSumTo(n: Integer): Integer;
begin
    if n = 0 then
    CalculateSumTo := 00
  else
    CalculateSumTo := n + CalculateSumTo(n - 1);
end;  

var
  n: Integer;

begin
  Write('Введите число n: ');
  ReadLn(n);
  WriteLn('Сумма от 1 до ', n, ' = ', CalculateSumTo(n)); // Вывод результата
end.