program AlphabetFrequencyDictionary;
  
type
  PNode = ^TNode;
  TNode = record
    word: string;
    freq: integer;
    next: PNode;
  end;
  
var
  head: PNode;
  
{ Процедура вставки слова в список. Если слово уже есть, увеличивает его частоту }
procedure InsertWord(var head: PNode; w: string);
var
  prev, curr, newNode: PNode;
begin
  prev := nil;
  curr := head;
  while (curr <> nil) and (curr^.word < w) do
  begin
    prev := curr;
    curr := curr^.next;
  end;
  if (curr <> nil) and (curr^.word = w) then
    curr^.freq := curr^.freq + 1
  else
  begin
    new(newNode);
    newNode^.word := w;
    newNode^.freq := 1;
    newNode^.next := curr;
    if prev = nil then
      head := newNode
    else
      prev^.next := newNode;
  end;
end;
  
{ Функция подсчёта узлов списка }
function CountNodes(head: PNode): integer;
var
  count: integer;
begin
  count := 0;
  while head <> nil do
  begin
    count := count + 1;
    head := head^.next;
  end;
  CountNodes := count;
end;
  
var
  textLine, w: string;
  i, start: integer;
begin
  head := nil;
  writeln('Введите строку текста:');
  readln(textLine);
  textLine := textLine + ' '; // добавляем пробел, чтобы обработать последнее слово
  start := 1;
  for i := 1 to length(textLine) do
  begin
    if textLine[i] = ' ' then
    begin
      if i > start then
      begin
        w := copy(textLine, start, i - start);
        InsertWord(head, w);
      end;
      start := i + 1;
    end;
  end;
  
  writeln('Количество различных слов: ', CountNodes(head));
  
  writeln('Алфавитно-частотный словарь:');
  while head <> nil do
  begin
    writeln(head^.word, ' - ', head^.freq);
    head := head^.next;
  end;
end.
