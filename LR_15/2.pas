program StudentAnketa;

type
  Anketa = record
    fio: string;
    birth: string;
    kurs: 1..5;
  end;

var
  students: array[1..3] of Anketa;
  i: integer;

begin
  { Запрос данных у пользователя для нескольких студентов }
  for i := 1 to 3 do
  begin
    writeln('Введите данные для студента ', i, ':');
    write('Ф.И.О.: ');
    readln(students[i].fio);
    
    write('Дата рождения (дд.мм.гггг): ');
    readln(students[i].birth);
    
    write('Курс (1-5): ');
    readln(students[i].kurs);
    writeln;
  end;
  
  { Вывод данных на экран }
  writeln('Анкетные данные студентов:');
  for i := 1 to 3 do
  begin
    writeln('Студент ', i, ':');
    writeln('Ф.И.О.: ', students[i].fio);
    writeln('Дата рождения: ', students[i].birth);
    writeln('Курс: ', students[i].kurs);
    writeln;
  end;
end.
