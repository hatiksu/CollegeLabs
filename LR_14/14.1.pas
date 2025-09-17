program vsegdaperviy;

procedure PrintNumbers(n: Integer);
begin
  if n < 0 then
    Exit;
  Write(n, ' ');
  PrintNumbers(n - 2);
end;

begin
  PrintNumbers(25);
end.
