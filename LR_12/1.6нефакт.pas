var
  inputFile, outputFile: Text;
  line: string;
begin
  Assign(inputFile, '6.txt');
  Reset(inputFile);
  Assign(outputFile, '6-1.txt');
  Rewrite(outputFile);
  while not Eof(inputFile) do
  begin
    ReadLn(inputFile, line); 
    if line <> '' then
      WriteLn(outputFile, line);
  end;
  Close(inputFile);
  Close(outputFile);
end.