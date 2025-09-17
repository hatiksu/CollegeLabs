uses GraphABC;
var
  W, H, x, y, x0, y0, n, x2, y2:integer;
  x1, y1, a, b, k, sh:real;
procedure mash(key: integer);
begin
  case key of    
  GraphABC.VK_X:
    begin      
    GraphABC.ClearWindow;
      k += 2;    
    end;
    GraphABC.VK_Z:     
    begin
      GraphABC.ClearWindow;      
      k -= 2;
    end;    
   end;
end;
function func(x: Real): Real;
begin
func:= x * x * x - 2 * x * x - 2 * x + 12
end;
begin  
  SetFontSize(20);
  textout(30, 100, 'Вычисление интеграла и его');
  textout(30, 130, 'графическая визуализация');
  SetFontSize(10);
  textout(30, 200, 'Введите границы кривой: ');  
  readln(a, b);
  textout(30, 250, 'Введите масштаб: ');
  readln(k);
  textout(30, 300, 'Введите количество промежутков: ');
  readln(n);
  clearwindow;
  while 1 = 1 do    
    begin
    GraphABC.OnKeyDown:= mash;
  textout(405, 5, 'Y');
  textout(780, 300, 'X');
  W:=800;
  H:=600;
  SetWindowSize(W,H);
  x0:=W div 2;
  y0:=H div 2;
  line(x0,10,x0,H-10);
  line(10,y0,W-10,y0);
  
  x1 := a;
while x1 <= b do begin
  y1 := func(x1);
  x := x0 + round(x1 * k);
  y := y0 - round(y1 * k);
  setpixel(x, y, clRed);
  x1 += 0.001;
 end;

  sh := abs((b - a) / n);
  x1 := a;
while x1 <= b do begin
  y1 := func(x1);
  x := x0 + round(x1 * k);
  y := y0 - round(y1 * k);
  line(x, y, x, y0);
  x2 := x0 + round((x1 + sh) * k);
  y2 := y0 - round(func(x1 + sh) * k);
  line(x, y, x2, y2);
  x1 += sh; 
 end;
 end;
end.
