program LinkedListMinMax;
  
type
  PNode = ^TNode;
  TNode = record
    data: integer;
    next: PNode;
  end;
  
var
  head, temp, newNode: PNode;
  n, i: integer;
  minVal, maxVal: integer;
  
begin
  head := nil;
  writeln('Введите количество элементов списка: ');
  readln(n);
  
  for i := 1 to n do
  begin
    new(newNode);
    write('Введите элемент ', i, ': ');
    readln(newNode^.data);
    newNode^.next := nil;
    if head = nil then
      head := newNode
    else
    begin
      temp := head;
      while temp^.next <> nil do
        temp := temp^.next;
      temp^.next := newNode;
    end;
  end;
  
  if head = nil then
  begin
    writeln('Список пуст');
    exit;
  end;
  
  minVal := head^.data;
  maxVal := head^.data;
  temp := head;
  while temp <> nil do
  begin
    if temp^.data < minVal then
      minVal := temp^.data;
    if temp^.data > maxVal then
      maxVal := temp^.data;
    temp := temp^.next;
  end;
  
  writeln('Минимальный элемент: ', minVal);
  writeln('Максимальный элемент: ', maxVal);
end.
