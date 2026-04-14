unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Button1: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  d, m, y: Integer;
  maxDay: Integer;
begin
  Label5.Caption := '';
  Label6.Caption := '';
  Label7.Caption := '';

  if not TryStrToInt(Edit1.Text, d) then
  begin
    Label7.Caption := 'Ошибка ввода дня';
    Exit;
  end;

  if not TryStrToInt(Edit2.Text, m) then
  begin
    Label7.Caption := 'Ошибка ввода месяца';
    Exit;
  end;

  if not TryStrToInt(Edit3.Text, y) then
  begin
    Label7.Caption := 'Ошибка ввода года';
    Exit;
  end;

  case m of
    1,3,5,7,8,10,12: maxDay := 31;
    4,6,9,11: maxDay := 30;
    2:
      begin
        if ((y mod 4 = 0) and (y mod 100 <> 0)) or (y mod 400 = 0) then
          maxDay := 29
        else
          maxDay := 28;
      end;
  else
    begin
      Label7.Caption := 'Ошибка: неверный месяц';
      Exit;
    end;
  end;

  if (d < 1) or (d > maxDay) then
  begin
    Label7.Caption := 'Ошибка: такого числа в месяце не существует';
    Exit;
  end;

  if d = maxDay then
  begin
    Label5.Caption := 'Последний день месяца!';
    d := 1;

    if m = 12 then
    begin
      m := 1;
      y := y + 1;
      Label6.Caption := 'С наступающим новым годом!';
    end
    else
      m := m + 1;
  end
  else
    d := d + 1;

  Label7.Caption := 'Завтра ' + IntToStr(d) + '.' +
                    IntToStr(m) + '.' +
                    IntToStr(y);
end;
end.
