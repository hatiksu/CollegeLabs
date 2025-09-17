procedure InsertSort(var data: array of Integer; comparator: function(a, b: Integer): Integer);
var
  i, j, key: Integer;
begin
  for i := 1 to High(data) do
  begin
    key := data[i];
    j := i - 1;
    while (j >= 0) and (comparator(key, data[j]) < 0) do
    begin
      data[j + 1] := data[j];
      j := j - 1;
    end;
    data[j + 1] := key; 
  end;
end;

procedure Merge(var data: array of Integer; left, mid, right: Integer; comparator: function(a, b: Integer): Integer);
var
  i, j, k: Integer;
  temp: array of Integer;
begin
  SetLength(temp, right - left + 1);
  i := left; 
  j := mid + 1; 
  k := 0;

  while (i <= mid) and (j <= right) do
  begin
    if comparator(data[i], data[j]) <= 0 then
    begin
      temp[k] := data[i];
      i := i + 1;
    end
    else
    begin
      temp[k] := data[j];
      j := j + 1;
    end;
    k := k + 1;
  end;
  while i <= mid do
  begin
    temp[k] := data[i];
    i := i + 1;
    k := k + 1;
  end;
  while j <= right do
  begin
    temp[k] := data[j];
    j := j + 1;
    k := k + 1;
  end;
  for i := left to right do
    data[i] := temp[i - left];
end;

procedure MergeSort(var data: array of Integer; left, right: Integer; comparator: function(a, b: Integer): Integer);
var
  mid: Integer;
begin
  if left < right then
  begin
    mid := (left + right) div 2;
    MergeSort(data, left, mid, comparator);
    MergeSort(data, mid + 1, right, comparator);
    Merge(data, left, mid, right, comparator);
  end;
end;

function CompareAsc(a, b: integer): integer;
begin
  Result := a - b; // сравнение по возрастанию
end;

procedure RDF(const filename: string; var data: array of integer; var count: integer);
var
  f: TextFile;
  num: integer;
begin
  AssignFile(f, filename);
  Reset(f); 
  count := 0;  
  while not Eof(f) do
  begin
    Read(f, num);
    data[count] := num;
    Inc(count);
  end;
  CloseFile(f);
end;

procedure WDF(const filename: string; const data: array of integer; count: integer);
var
  f: TextFile;
  i: integer;
begin
  AssignFile(f, filename);
    Rewrite(f);
  for i := 0 to count - 1 do
    WriteLn(f, data[i]);
  CloseFile(f);
end;

var
  inputData: array of integer; 
  InsertData: array of integer; 
  MergeData: array of integer; 
  count, i, time1, time2, time3, time4, InsertTime, MergeTime: integer;
begin
  SetLength(inputData, 1000); 
  RDF('C:\Users\PC\Desktop\College\Materials\OAIP\DKR5\data.txt', inputData, count);
  
  // Сортировка вставкой
  time1 := Milliseconds; // Milliseconds возвращает текущее время в миллисекундах
  SetLength(InsertData, count); // размер для вставочной сортировки
  for i := 0 to count - 1 do
    InsertData[i] := inputData[i];  
  
  InsertSort(InsertData, CompareAsc);  
  WDF('C:\Users\PC\Desktop\College\Materials\OAIP\DKR5\datainsert.txt', InsertData, count); 
  time2 := Milliseconds;

  // Сортировка слиянием 
  time3 := Milliseconds;
  
  SetLength(MergeData, count); // размер для сортировки слиянием
  for i := 0 to count - 1 do
    MergeData[i] := inputData[i];  
  
  MergeSort(MergeData, Low(MergeData), High(MergeData), CompareAsc);  
  WDF('C:\Users\PC\Desktop\College\Materials\OAIP\DKR5\datamerge.txt', MergeData, count);
  
  time4 := Milliseconds; 
  
  InsertTime := time2 - time1; 
  MergeTime := time4 - time3;  
  
  WriteLn('Для сортировки вставкой потребовалось: ', InsertTime, ' мс , а для сортировки слиянием: ', MergeTime, ' мс.');
end.

