program AnketaStudenta;

type
  Anketa = record
    fio: string;
    birth: string;
    kurs: 1..5;
  end;

var
  student: Anketa;

begin
  { Запрос данных у пользователя }
  write('Введите Ф.И.О.: ');
  readln(student.fio);
  
  write('Введите дату рождения (дд.мм.гггг): ');
  readln(student.birth);
  
  write('Введите курс (1-5): ');
  readln(student.kurs);
  
  { Вывод данных на экран }
  writeln;
  writeln('Анкетные данные студента:');
  writeln('Ф.И.О.: ', student.fio);
  writeln('Дата рождения: ', student.birth);
  writeln('Курс: ', student.kurs);
end.
