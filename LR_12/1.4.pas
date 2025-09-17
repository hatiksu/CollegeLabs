var
   inputFile, tempFile: text;
   line: string;
   K,str: integer;
begin
   write('Введите номер строки');
   readln(K);
   assign(inputFile, 'input.txt');
   assign(tempFile, 'temp.txt');
   reset(inputFile);
   rewrite(tempFile);
   str:= 0; 
   while not eof(inputFile) do
   begin
      inc(str);         
      readln(inputFile, line);
      if str = K then
         writeln(tempFile, '');
         writeln(tempFile, line);
   end;
   close(inputFile);
   close(tempFile);
   erase(inputFile);
   rename(tempFile, 'input.txt');
end.