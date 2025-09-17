uses  graphabc, FractalModule;
var (m,wx,wy,g) := (150, 370,300,15);
  
procedure KeyDown(k: integer);
begin
 case k of
    VK_Down: wy += 10; // вниз
    VK_Up: wy -= 10; // вверх
    VK_Left: wx -= 10; // влево 
    VK_Right: wx += 10; // вправо
    VK_Escape: halt(1); // выход
    VK_A: if m < 500 then m+=10; // увеличение масштаба
    VK_Z: if m > 20 then m-=10; // уменьшение масштаба
    VK_S: if g < 15 then g+=1; // увеличение глубины рекурсии
    VK_X: if g > 2 then g -=1; // уменьшение глубины рекурсии
   end;
 Window.Clear; 
 ris(wx-m,wy,wx+m,wy,g); // начальный вызов рекурсивной процедуры
 Redraw;
end; 
 
begin
     SetWindowCaption('Фрактал "Кривая Хартера-Хайтвея"');
     SetWindowSize(700,512);
     LockDrawing;
     KeyDown(0);
     OnkeyDown += KeyDown;
end.