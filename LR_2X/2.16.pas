program ConvertToMeters;

var
  unitNumber: Integer;
  length: Real;
  lengthInMeters: Real;

begin
  Write('Введите номер единицы измерения (1 – дециметр, 2 – километры, 3 – метры, 4 – миллиметры, 5 – сантиметры): ');
  ReadLn(unitNumber);
  
  Write('Введите длину отрезка: ');
  ReadLn(length);
  
  case unitNumber of
    1: lengthInMeters := length / 10;
    2: lengthInMeters := length * 1000;
    3: lengthInMeters := length;
    4: lengthInMeters := length / 1000;
    5: lengthInMeters := length / 100;
  else
    begin
      WriteLn('Ошибка: некорректный номер единицы измерения.');
      Exit;
    end;
  end;
  
  // Вывод результата
  WriteLn('Длина отрезка в метрах: ', lengthInMeters:0:2);
end.
