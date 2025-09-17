var
  f1,f2: Text;
  num, min, max: Integer;
  first: Boolean;
begin
  assign(f1, 'input1.txt'); 
  reset(f1);
  first := True;
  while not Eof(f1) do
   begin
    ReadLn(f1, num);
    if first then
     begin
      min := num;
      max := num;
      first:= False;
    end
    else
    begin
      if num <= min then
        min := num;
      if num >= max then
        max := num;
    end;
  end;
  close(f1);
  assign(f2, 'output.txt');
  rewrite(f2);
  WriteLn(f2 , 'минимальное число ', min);
  WriteLn(f2, 'максимальное число ', max);
  Close(f2);
end.