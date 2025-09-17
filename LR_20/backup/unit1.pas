unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button0: TButton;
    Button5: TButton;
    Button6: TButton;
    ButtonUmnozh: TButton;
    Button1delX: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    ButtonDelenie: TButton;
    ButtonSquare: TButton;
    ButtonBackSpace: TButton;
    Button2: TButton;
    ButtonCE: TButton;
    ButtonC: TButton;
    ButtonSqrtlX: TButton;
    Button23PlusandMinus: TButton;
    Button3: TButton;
    ButtonMinus: TButton;
    ButtonZap: TButton;
    ButtonPlus: TButton;
    ButtonRavno: TButton;
    Button1: TButton;
    Button4: TButton;
    Display: TEdit;
    procedure Button1delXClick(Sender: TObject);
    procedure ButtonSquareClick(Sender: TObject);
    procedure ButtonBackSpaceClick(Sender: TObject);
    procedure ButtonCEClick(Sender: TObject);
    procedure ButtonCClick(Sender: TObject);
    procedure ButtonSqrtlXClick(Sender: TObject);
    procedure Button23PlusandMinusClick(Sender: TObject);
    procedure ButtonRavnoClick(Sender: TObject);
    procedure ClickBut(Sender: TObject);
    procedure ClickZnak(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  a, b, c: real;
  znak: string;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ClickZnak(Sender: TObject); // арифметические операции
begin
  if (Display.Text = '') and (znak <> '') then
  begin
    znak := (Sender as TButton).Caption;
    Exit;
  end;
  if Display.Text = '' then
  begin
    a := 0;
    znak := (Sender as TButton).Caption;
    Exit;
  end;
  try
    a := StrToFloat(Display.Text);
    Display.Clear;
    znak := (Sender as TButton).Caption;
  except
    on E: Exception do
    begin
      Display.Clear;
      a := 0;
      znak := '';
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject); // отключение масштабирования
begin
  with Self, Constraints do
  begin
    MaxHeight:= Height;
    MinHeight:= Height;
    MaxWidth:= Width;
    MinWidth:= Width;
  end;
end;

procedure TForm1.ClickBut(Sender: TObject); // 0..9, включая запятую
begin
  Display.MaxLength := 18;

  // Обработка сообщений об ошибках
  if (Display.Text = 'Делить на 0 нельзя') or (Display.Text = 'Ошибка') then
    Display.Text := '';

  // Если текущее значение "0", очищаем поле (кроме случая, когда нажимаем запятую)
  if (Display.Text = '0') and ((Sender as TButton).Caption <> ',') then
    Display.Text := '';

  // Обработка запятой
  if (Sender as TButton).Caption = ',' then
  begin
    // Проверяем, нет ли уже запятой и не пустое ли поле
    if Pos(',', Display.Text) > 0 then
      Exit; // Запятая уже есть - ничего не делаем

    if Display.Text = '' then
    begin
      Display.Text := '0,'; // Добавляем ноль перед запятой, если поле пустое
      Exit;
    end;

    // Если дошли сюда - добавляем запятую
    Display.Text := Display.Text + ',';
    Exit;
  end;

  // Для цифр просто добавляем символ
  Display.Text := Display.Text + (Sender as TButton).Caption;
end;

procedure TForm1.ButtonBackSpaceClick(Sender: TObject); // удаление числа
var
  str: string;
begin
  // Проверяем, есть ли сообщение об ошибке
  if (Display.Text = 'Ошибка') or (Display.Text = 'Делить на 0 нельзя') then
  begin
    Display.Text := '0'; // Сбрасываем ошибку
    Exit;
  end;

  str := Display.Text;

  // Если строка не пустая, удаляем последний символ
  if str <> '' then
    Delete(str, Length(str), 1);

  // Если после удаления строка пустая, ставим '0'
  if str = '' then
    str := '0';

  Display.Text := str;
end;

procedure TForm1.ButtonSquareClick(Sender: TObject); // x^2
begin
  if (Display.Text = 'Ошибка') or (Display.Text = 'Делить на 0 нельзя') then
  Exit;
  // проверяем, пустое ли поле ввода
  if Display.Text = '' then
  begin
  Exit;
  end;
  a := strtofloat(Display.text);
  a := sqr(a);
  Display.text:=floattostr(a);
  a := 0;
end;

procedure TForm1.Button1delXClick(Sender: TObject); // 1/x
begin
  if (Display.Text = 'Ошибка') or (Display.Text = 'Делить на 0 нельзя') then
  Exit;
  if Display.Text = 'Делить на 0 нельзя' then
  begin
  Exit;
  end;
  // проверяем, пустое ли поле ввода
  if Display.Text = '' then
  begin
  Exit;
  end;
  a := strtofloat(Display.text);
  if a = 0 then
  begin
  Display.Text := 'Делить на 0 нельзя';
  Exit;
  end
  else
  a := 1/a;
  Display.text:=floattostr(a);
  a := 0;
end;

procedure TForm1.ButtonCEClick(Sender: TObject); // удаление последнего введенного числа (СЕ)
begin
  Display.Clear;
  if Display.text = ''then
  Display.text := '0'
end;

procedure TForm1.ButtonCClick(Sender: TObject); // полная отмена операции (С)
begin
  Display.Clear;
  a:=0;
  b:=0;
  c:=0;
  if Display.text = ''then
  Display.text := '0'
end;

procedure TForm1.ButtonSqrtlXClick(Sender: TObject); // извлечение квадратного корня (√x)
begin
  if (Display.Text = 'Ошибка') or (Display.Text = 'Делить на 0 нельзя') then
  Exit;
  // Проверяем, пустое ли поле ввода
  if Display.Text = '' then
    Exit;

  // Преобразуем текст в число (без обработки исключений)
  a := StrToFloat(Display.Text);

  // Проверяем, что число не отрицательное
  if a < 0 then
  begin
    Display.Text := 'Ошибка';
    a := 0;
    Exit;
  end;

  // Вычисляем квадратный корень
  a := Sqrt(a);

  // Форматируем вывод (убираем .0 для целых чисел)
  if Frac(a) = 0 then
    Display.Text := FloatToStr(Round(a))
  else
    Display.Text := FloatToStr(a);
end;

procedure TForm1.Button23PlusandMinusClick(Sender: TObject); // ±
var pM: real;
begin
 if (Display.Text = 'Ошибка') or (Display.Text = 'Делить на 0 нельзя') then
 Exit;
 // проверяем, пустое ли поле ввода
 if Display.Text = '' then
 begin
 Exit;
 end;
 pM := StrToFloat(Display.Text);
 Display.Text := FloatToStr (-1 * Pm);
end;

procedure TForm1.ButtonRavnoClick(Sender: TObject);  // вывод операции (=)
begin
  if Display.Text = '' then
  begin
    Exit;
  end;
  if znak = '' then
  begin

    Exit;
  end;

  try
    b := StrToFloat(Display.Text);
    Display.Clear;

    case znak of
      '+': c := a + b;
      '-': c := a - b;
      '*': c := a * b;
      '/':
      begin
        if b = 0 then
        begin
          if (Display.Text = 'Ошибка') or (Display.Text = 'Делить на 0 нельзя') then
          Exit;
        end
        else
          c := a / b;
      end;
    end;

    if Frac(c) = 0 then
      Display.Text := FloatToStr(Round(c)) // целое число
    else
      Display.Text := FloatToStr(c); // дробное число (с запятой)

  except
    on E: Exception do
    begin
      a := 0;
      b := 0;
      c := 0;
      znak := '';
    end;
  end;
end;

end.

