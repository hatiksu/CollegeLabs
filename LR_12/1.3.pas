var
   filetext: text;
   S: string;
begin
   write('Введите строку S: ');
   readln(S);
   assign(filetext, '2.txt');
   append(filetext);
   writeln(filetext, S);  
   close(filetext);
end.