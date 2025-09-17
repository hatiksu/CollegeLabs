program SimpleLinkedList;

const
  MAX = 100; // Максимальный размер списка

type
  TNode = record // Структура элемента списка
    value: integer; // Значение элемента
    next: integer;  // Индекс следующего элемента (-1 = конец)
  end;

  TList = record // Структура списка
    nodes: array[0..MAX-1] of TNode; // Массив элементов
    head, free, size: integer; // Голова, свободный элемент, размер
  end;

// Инициализация списка
procedure Init(var L: TList);
var i: integer;
begin
  for i := 0 to MAX-2 do L.nodes[i].next := i+1; // Связываем элементы
  L.nodes[MAX-1].next := -1; // Последний элемент без следующего
  L.head := -1; // Пустой список
  L.free := 0;  // Первый свободный
  L.size := 0;   // Размер 0
end;

// Проверка пустоты
function Empty(var L: TList): boolean;
begin
  Empty := L.head = -1; // Если голова -1, список пуст
end;

// Добавление в начало
procedure Push(var L: TList; v: integer);
var idx: integer;
begin
  if L.free = -1 then exit; // Если нет свободных мест - выход
  idx := L.free; // Берем первый свободный индекс
  L.free := L.nodes[idx].next; // Обновляем свободный список
  L.nodes[idx].value := v; // Записываем значение
  L.nodes[idx].next := L.head; // Новый элемент указывает на старую голову
  L.head := idx; // Обновляем голову
  inc(L.size); // Увеличиваем размер
end;

// Удаление из начала
function Pop(var L: TList): integer;
var idx: integer;
begin
  if Empty(L) then 
  begin
    Pop := -1; // Возвращаем -1 при пустом списке
    exit;
  end;
  idx := L.head; // Запоминаем индекс головы
  Pop := L.nodes[idx].value; // Возвращаемое значение
  L.head := L.nodes[idx].next; // Новая голова - следующий элемент
  L.nodes[idx].next := L.free; // Освобождаемый элемент в свободный список
  L.free := idx; // Обновляем указатель на свободный список
  dec(L.size); // Уменьшаем размер
end;

// Печать списка
procedure Print(var L: TList);
var curr: integer;
begin
  if Empty(L) then 
  begin 
    writeln('Пусто'); 
    exit; 
  end;
  curr := L.head; // Начинаем с головы
  while curr <> -1 do // Пока не конец списка
  begin
    write(L.nodes[curr].value, ' '); // Печатаем значение
    curr := L.nodes[curr].next; // Переходим к следующему
  end;
  writeln;
end;

// Основная программа
var
  L: TList;
  cmd, val: integer;
begin
  Init(L); // Инициализация списка
  repeat
    writeln('1-Добавить');
    writeln('2-Удалить');
    writeln('3-Показать');
    writeln('4-Выход');
    readln(cmd); // Чтение команды
    case cmd of
      1: begin 
           readln(val); // Чтение значения
           Push(L, val); // Добавление
         end;
      2: writeln('Удалено: ', Pop(L)); // Удаление элемента
      3: Print(L); // Вывод списка
      4: writeln('Завершение работы...'); // Выход из программы
      else writeln('Ошибка: неверная команда'); // Неверная команда
    end;
  until cmd = 4; // Выход по команде 4
end.