program ListEvenElements;
  
var
  arr: array[1..10] of integer;
  i: integer;
  
begin
  writeln('Введите 10 элементов списка:');
  for i := 1 to 10 do
  begin
    write('Элемент ', i, ': ');
    readln(arr[i]);
  end;
  
  writeln('Полный список:');
  for i := 1 to 10 do
    write(arr[i], ' ');
  writeln;
  
  writeln('Четные элементы списка:');
  for i := 1 to 10 do
    if arr[i] mod 2 = 0 then
      write(arr[i], ' ');
  writeln;
end.
