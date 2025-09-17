program ToyStore;

type
  Toy = record
    name: string;
    price: real;
    age: string;
  end;

var
  toys: array[1..3] of Toy;
  i: integer;

begin
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

  { Вывод данных на экран }
  writeln('Игрушки в продаже:');
  for i := 1 to 3 do
  begin
    with toys[i] do
    begin
      writeln('Название: ', name);
      writeln('Цена: ', price:0:2, ' руб.');
      writeln('Возрастной диапазон: ', age);
      writeln;
    end;
  end;
end.
