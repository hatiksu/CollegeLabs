program IsPerfectSquare;

var
  N, sqrtN: Integer;

begin
  Write('Введите натуральное число N: ');
  ReadLn(N);

  sqrtN := Trunc(Sqrt(N));  { Вычисляем целую часть квадратного корня }

  if (sqrtN * sqrtN = N) then
    WriteLn('true')  { Если квадрат корня равен числу N, то N - точный квадрат }
  else
    WriteLn('false'); { Иначе N не является точным квадратом }
end.
