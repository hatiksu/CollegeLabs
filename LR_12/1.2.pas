var
   filetext: text;
   i, j, N, K: integer;
   line: string;
begin
   write('Введите количество строк k: ');
   readln(N);
   write('Введите количество звездочек в строке k: ');
   readln(K);
   line := '';
   for j := 1 to K do
      line := line + '*';
   assign(filetext, '1.txt');
   rewrite(filetext);
   for i := 1 to N do
      writeln(filetext, line);
   close(filetext);
end.