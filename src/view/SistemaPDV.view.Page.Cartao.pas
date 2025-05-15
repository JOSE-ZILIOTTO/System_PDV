unit SistemaPDV.view.Page.Cartao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TFramecartao = class(TFrame)
    pnlcartao: TPanel;
    pnllistabandeira: TPanel;
    pnlmastercar: TPanel;
    shapecartao: TShape;
    Panel9: TPanel;
    Image1: TImage;
    pnlbtnmastercar: TPanel;
    pnlamerican: TPanel;
    shapepix: TShape;
    Panel12: TPanel;
    Image3: TImage;
    pnlbtnamerican: TPanel;
    pnllistacartao: TPanel;
    pnlcartaopage: TPanel;
    Shape1: TShape;
    Panel3: TPanel;
    Image2: TImage;
    pnlbtncarpage: TPanel;
    pnldebitopage: TPanel;
    Shape2: TShape;
    Panel6: TPanel;
    Image4: TImage;
    pnlbtndebito: TPanel;
    pnlVisa: TPanel;
    Shape3: TShape;
    Panel10: TPanel;
    Image5: TImage;
    pnlbtnvisa: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(Aowner : TComponent) : TFramecartao;
    function Alinhamento( value : Talign) : TFramecartao;
    function Embed (Value : TWinControl) : TFramecartao;

  end;

implementation

{$R *.dfm}

{ TFramecartao }

function TFramecartao.Alinhamento(value: Talign): TFramecartao;
begin
  result := self;
 self.Align := Value;
end;



function TFramecartao.Embed(Value: TWinControl): TFramecartao;
begin
  result := self;
  self.Parent := Value;
end;

class function TFramecartao.New(Aowner: TComponent): TFramecartao;
begin
  result := self.Create(Aowner);
end;

end.
