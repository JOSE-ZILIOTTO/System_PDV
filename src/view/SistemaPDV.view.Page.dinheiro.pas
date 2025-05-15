unit SistemaPDV.view.Page.dinheiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFramedinheiro = class(TFrame)
    pnlprincipal: TPanel;
    pnlvalorrecebido: TPanel;
    Label1: TLabel;
    edtvalorrecebido: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
