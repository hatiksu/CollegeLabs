procedure LoopFor(i, n: integer);
begin
  if i > n then
    exit;
  writeln('привет ', i);
  LoopFor(i + 1, n);
end;

begin
  LoopFor(1, 10);
end.
