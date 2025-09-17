unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids, Unit2, Unit3;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    StringGrid1: TStringGrid;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    procedure LoadGridFromFile(const FileName: string);
    procedure SaveGridToFile(const FileName: string);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.Edit1.Text := '';
  Form2.Edit2.Text := '';
  Form2.Edit3.Text := '';
  Form2.ComboBox1.Text := '...';
  StringGrid1.RowCount := StringGrid1.RowCount + 1;
  Unit2.Form2.ShowModal;
  if (Form2.ComboBox1.Text = '...') or (Form2.ComboBox1.Text = 'Нет') then
    Form2.Edit3.Text := 'Не продано';
  StringGrid1.Cells[0, StringGrid1.RowCount-1] := Form2.Edit1.Text;
  StringGrid1.Cells[1, StringGrid1.RowCount-1] := Form2.Edit2.Text;
  StringGrid1.Cells[2, StringGrid1.RowCount-1] := Form2.Edit3.Text;
  StringGrid1.Cells[3, StringGrid1.RowCount-1] := Form2.ComboBox1.Text;
  if (Form2.Edit1.Text = '') or (Form2.Edit2.Text = '') then
  begin
    Unit3.Form3.ShowModal;
  end;
end;


procedure TForm1.LoadGridFromFile(const FileName: string);
var
  SL: TStringList;
  i, j: Integer;
begin
  SL := TStringList.Create;
  try
    SL.LoadFromFile(FileName);

    // Очищаем таблицу перед загрузкой новых данных
    StringGrid1.RowCount := 1;

    // Устанавливаем количество строк по количеству строк в файле
    StringGrid1.RowCount := SL.Count;

    // Заполняем все строки, включая шапку
    for i := 0 to SL.Count - 1 do
    begin
      // Разбиваем строку по запятым
      StringGrid1.Rows[i].CommaText := SL[i];

      // Если в строке больше столбцов, чем в таблице - добавляем столбцы
      if StringGrid1.Rows[i].Count > StringGrid1.ColCount then
        StringGrid1.ColCount := StringGrid1.Rows[i].Count;
    end;
  finally
    SL.Free;
  end;
end;

procedure TForm1.SaveGridToFile(const FileName: string);
var
  SL: TStringList;
  i: Integer;
begin
  SL := TStringList.Create;
  try
    // Сохраняем все строки, включая шапку
    for i := 0 to StringGrid1.RowCount - 1 do
      SL.Add(StringGrid1.Rows[i].CommaText);

    SL.SaveToFile(FileName);

    // Очищаем таблицу после сохранения
    StringGrid1.RowCount := 1;

    ShowMessage('Данные успешно сохранены');
  finally
    SL.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    LoadGridFromFile(OpenDialog1.FileName);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    SaveGridToFile(SaveDialog1.FileName);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if StringGrid1.RowCount > 1 then
    StringGrid1.DeleteRow(StringGrid1.Row);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if StringGrid1.RowCount > 1 then
  begin
  Form2.Edit1.Text := StringGrid1.Cells[0, StringGrid1.Row];
  Form2.Edit2.Text := StringGrid1.Cells[1, StringGrid1.Row];
  Form2.Edit3.Text := StringGrid1.Cells[2, StringGrid1.Row];
  Form2.ComboBox1.Text := StringGrid1.Cells[3, StringGrid1.Row];
  Unit2.Form2.ShowModal;
  if (Form2.ComboBox1.Text = '...') or (Form2.ComboBox1.Text = 'Нет') then
    Form2.Edit3.Text := 'Не продано';
  StringGrid1.Cells[0, StringGrid1.Row] := Form2.Edit1.Text;
  StringGrid1.Cells[1, StringGrid1.Row] := Form2.Edit2.Text;
  StringGrid1.Cells[2, StringGrid1.Row] := Form2.Edit3.Text;
  StringGrid1.Cells[3, StringGrid1.Row] := Form2.ComboBox1.Text;
  end
  else
  ShowMessage('Редактировать пока нечего!')
end;

end.

