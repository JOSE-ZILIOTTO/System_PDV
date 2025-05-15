unit SistemaPDV.view.pages.pagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, SistemaPDV.view.Page.pix,
  SistemaPDV.view.Page.dinheiro, SistemaPDV.view.Page.Cartao;

type
  Tfrmpagamentos = class(TForm)
    pnlPrincipal: TPanel;
    pnlesquerda: TPanel;
    plndireita: TPanel;
    Panel2: TPanel;
    pnlretornar: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Label2: TLabel;
    Panel7: TPanel;
    Image2: TImage;
    pnltotalreceber: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    pnlacrecimo: TPanel;
    Label4: TLabel;
    pnldesconto: TPanel;
    Label6: TLabel;
    pnltotalvenda: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Shape1: TShape;
    pnltotalrecebido: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    pnlsaldorestante: TPanel;
    lblsaldorest: TLabel;
    Label11: TLabel;
    pnltroco: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    pnltopo: TPanel;
    pnlshape: TPanel;
    Shape2: TShape;
    pnltitulo: TPanel;
    Label10: TLabel;
    pnlclient: TPanel;
    pnlescolher: TPanel;
    Label14: TLabel;
    pnllistapagamentos: TPanel;
    pnlcartao: TPanel;
    shapecartao: TShape;
    Panel9: TPanel;
    pnlbtncartao: TPanel;
    Image1: TImage;
    pnlpix: TPanel;
    shapepix: TShape;
    Panel12: TPanel;
    Image3: TImage;
    pnlbtnpix: TPanel;
    pnldinheiro: TPanel;
    shapedinheiro: TShape;
    Panel15: TPanel;
    Image4: TImage;
    pnlbtndinheiro: TPanel;
    pnlshape2: TPanel;
    Shape6: TShape;
    pnlexibir: TPanel;
    Label15: TLabel;
    procedure pnlbtnpixClick(Sender: TObject);
    procedure pnlbtncartaoClick(Sender: TObject);
    procedure pnlbtndinheiroClick(Sender: TObject);
    procedure pnlretornarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Setclick (Shape : TShape ; Panel : TPanel);
  public
    { Public declarations }
  end;

var
  frmpagamentos: Tfrmpagamentos;

implementation

{$R *.dfm}

procedure Tfrmpagamentos.pnlbtncartaoClick(Sender: TObject);
var
LFrame : TFramecartao;
begin
LFrame := TFramecartao.Create(nil);
LFrame.Align := alclient;
lframe.Parent := pnlexibir;
//TFramecartao.New(self).Alinhamento(alClient).Embed(pnlexibir);
Setclick(shapecartao, pnllistapagamentos)
end;

procedure Tfrmpagamentos.pnlbtndinheiroClick(Sender: TObject);
var
lFrame : TFramedinheiro;
begin
lFrame := TFramedinheiro.Create(nil);
lFrame.Align := alClient;
lFrame.Parent := pnlexibir;
Setclick(shapedinheiro, pnllistapagamentos)
end;

procedure Tfrmpagamentos.pnlbtnpixClick(Sender: TObject);
var
LFrame : Tfrmqrcode;

begin
 lframe := Tfrmqrcode.Create(nil);
 LFrame.Align := alClient;
 lframe.Parent := pnlexibir;

  Setclick(shapepix, pnllistapagamentos);
end;

procedure Tfrmpagamentos.pnlretornarClick(Sender: TObject);
begin
self.Close     ;
self.DisposeOf;
end;

procedure Tfrmpagamentos.Setclick(Shape: TShape; Panel: TPanel);
begin
shapecartao.Pen.Style := psClear ;
shapepix.Pen.Style := psClear     ;
shapedinheiro.Pen.Style := psClear ;

shape.Pen.Style := psSolid;

Panel.Visible := False;
Panel.Visible := true;
end;

end.
