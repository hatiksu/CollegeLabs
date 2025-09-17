program ToyStoreFile;

uses crt;

type
  Toy = record
    name: string[50];
    price: real;
    age: string[20];
  end;

var
  toys: array[1..3] of Toy;
  toys_from_file: array[1..3] of Toy;
  f: file of Toy;
  i: integer;

begin
  clrscr;
  { Заполнение данных о товарах }
  with toys[1] do
  begin
    name := 'Кукла Барби';
    price := 1500.50;
    age := '3-7 лет';
  end;

  with toys[2] do
  begin
    name := 'Конструктор LEGO';
    price := 3200.75;
    age := '6-12 лет';
  end;

  with toys[3] do
  begin
    name := 'Машинка Hot Wheels';
    price := 750.99;
    age := '4-10 лет';
  end;

  { Запись данных в файл }
  assign(f, 'toys.dat');
  rewrite(f);
  for i := 1 to 3 do
    write(f, toys[i]);
  close(f);

  { Чтение данных из файла }
  assign(f, 'toys.dat');
  reset(f);
  for i := 1 to 3 do
    read(f, toys_from_file[i]);
  close(f);

  { Вывод данных на экран }
  writeln('Игрушки в продаже (из файла):');
  for i := 1 to 3 do
  begin
    with toys_from_file[i] do
    begin
      writeln('Название: ', name);
      writeln('Цена: ', price:0:2, ' руб.');
      writeln('Возрастной диапазон: ', age);
      writeln;
    end;
  end;
end.  