program CheckString;

type 
  t_chs = set of Char;

const
  lett: t_chs = ['a'..'z', 'A'..'Z', '_'];
  num: t_chs = ['0'..'9'];

var
  str: string;
  i: byte;
  flag: boolean;

begin
  write('Введите строку: ');
  readln(str);
  
  flag := (length(str) > 0) and (str[1] in lett);
  
  if flag then
  begin
    for i := 2 to length(str) do
    begin
      if not (str[i] in lett + num) then
      begin
        flag := false;
        break;
      end;
    end;
  end;
  
  writeln('Строка корректна: ', flag);
end.
