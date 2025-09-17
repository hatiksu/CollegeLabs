program YearsSuffix;

uses crt;

var
  n: integer;

function GetYearSuffix(num: integer): string;
begin
  if (num mod 100 >= 11) and (num mod 100 <= 14) then
    GetYearSuffix := 'лет'
  else case num mod 10 of
    1: GetYearSuffix := 'год';
    2, 3, 4: GetYearSuffix := 'года';
  else
    GetYearSuffix := 'лет';
  end;
end;

begin
  clrscr;
  write('Введите количество лет: ');
  readln(n);
  writeln(n, ' ', GetYearSuffix(n));
end.
