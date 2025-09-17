program ZnakocheryaduyushchiesyaMassiv;

var
  arr: array of integer;
  n, i: integer;
  isAlternating: boolean;

begin
  write('Введите количество элементов массива: ');
  readln(n);
  
  setlength(arr, n);
  
  write('Введите элементы массива: ');
  for i := 0 to n - 1 do
    read(arr[i]);

  isAlternating := true;

  // Проверяем на знакочередование
  for i := 1 to n - 1 do
  begin
    if (arr[i] * arr[i - 1] >= 0) then
    begin
      isAlternating := false;
      break;
    end;
  end;

  if isAlternating then
    writeln('Массив является знакочередующимся.')
  else
    writeln('Массив не является знакочередующимся.');
end.
