unit SistemaPDV.view.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons,
  Vcl.ExtCtrls,
  SistemaPDV.view.pages.pagamento,
  Vcl.StdCtrls, Vcl.Skia, Data.DB, Vcl.Grids,
  Vcl.DBGrids,
  SistemaPDV.view.pages.login, Vcl.WinXCtrls, SistemaPDV.view.Page.identificar.cliente,
  SistemaPDV.view.Page.importar.cliente, SistemaPDV.view.AbrirCAixa,
  SistemaPDV.Model.Caixa,
  SistemaPDV.view.FecharCAixa;

type
  TfmPrincipal = class(TForm)
    Ppnlprincipal: TPanel;
    pnltitulo: TPanel;
    pnlbottom: TPanel;
    pnldireitaAlclient: TPanel;
    pnlesquerda: TPanel;
    pnlmaisfuncoes: TPanel;
    Shape1: TShape;
    btnmaisfuncoes: TSpeedButton;
    pnlcancelaritems: TPanel;
    Shape2: TShape;
    btncancelaritem: TSpeedButton;
    pnlcancelarvenda: TPanel;
    Shape3: TShape;
    btncancelarvenda: TSpeedButton;
    pnlAbiricaixa: TPanel;
    Shape4: TShape;
    btnAbrirCaixa: TSpeedButton;
    pnlconsultarpreco: TPanel;
    Shape5: TShape;
    btnconsultarpreco: TSpeedButton;
    pnlcancelaroperacao: TPanel;
    Shape6: TShape;
    btncancelarope: TSpeedButton;
    pnlimage: TPanel;
    Image1: TImage;
    pnltotalcompra: TPanel;
    Shape7: TShape;
    Label1: TLabel;
    lbltotalcompra: TLabel;
    pnlsubtotal: TPanel;
    Shape8: TShape;
    lblsubtotal: TLabel;
    Label3: TLabel;
    pnlpreco: TPanel;
    Shape9: TShape;
    lblpreco: TLabel;
    pnlquantidade: TPanel;
    Shape10: TShape;
    pnlproduto: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBGrid1: TDBGrid;
    edtproduto: TEdit;
    edtquantidade: TEdit;
    pnlMarge: TPanel;
    SplitView1: TSplitView;
    Panel2: TPanel;
    Shape11: TShape;
    Panel7: TPanel;
    Shape12: TShape;
    Panel8: TPanel;
    Shape13: TShape;
    Panel9: TPanel;
    Shape14: TShape;
    Panel10: TPanel;
    Shape15: TShape;
    Panel11: TPanel;
    Shape16: TShape;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SplitView2: TSplitView;
    Shape17: TShape;
    Panel6: TPanel;
    Shape18: TShape;
    SpeedButton7: TSpeedButton;
    pnlidentificacliente: TPanel;
    pnlpag: TPanel;
    DataSource1: TDataSource;
    lblteste: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnmaisfuncoesClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);

  private
    Flogin: Tfrmlogin;
    FCaixa: TCaixa;
    procedure Montarbotoes;
    procedure SplitviewAction(Value: TSplitView);
    procedure ExibeSplitpagamento(Value: TSplitView);
    procedure ajustarCampos;
    procedure VerificaCaixaFechadoAberto;
    procedure iformacoesdoOperador;

  public

  end;

var
  fmPrincipal: TfmPrincipal;

implementation

{$R *.dfm}

procedure TfmPrincipal.ajustarCampos;
begin
  edtproduto.Text := '';
  lblpreco.Caption := FormatCurr('"R$ ", 0.00', 0);
  edtquantidade.Text := FormatFloat('0.000', 0);
  lblsubtotal.Caption := FormatCurr('"R$ ", 0.00', 0);
  lbltotalcompra.Caption := FormatCurr('"R$ ", 0.00', 0);
  pnltitulo.SetFocus;
end;

procedure TfmPrincipal.btnmaisfuncoesClick(Sender: TObject);
begin
  SplitviewAction(SplitView1)
end;

procedure TfmPrincipal.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with (Sender as TDBGrid).Canvas do
  begin

    Pen.Color := clGray; // Cor da borda
    Pen.Width := 1;
    MoveTo(Rect.Left, Rect.Bottom - 1);
    LineTo(Rect.Right, Rect.Bottom - 1); // linha inferior
    MoveTo(Rect.Right - 1, Rect.Top);
    LineTo(Rect.Right - 1, Rect.Bottom); // linha direita
  end;
end;

procedure TfmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Flogin.free;;
  FCaixa.free;

end;

procedure TfmPrincipal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Lpagamnetos: Tfrmpagamentos;
  LKeyEvent: TKeyevent;
  I: Integer;

begin
  for I := Pred(pnlMarge.ControlCount) downto 0 do
  begin
    if ((pnlMarge.Controls[I] is TForm) and (TForm(pnlMarge.Controls[I]).ModalResult = MRok)) then
    begin
      if ((TForm(pnlMarge.Controls[I]).KeyPreview) and (Assigned(LKeyEvent))) then
      begin
        LKeyEvent := TForm(pnlMarge.Controls[I]).OnKeyDown;
        LKeyEvent(Sender, Key, Shift);
        exit;
      end;
    end;
  end;

  case Key of
    VK_Escape:
      self.Close;
    VK_F2:
      begin

          Tfrmabrircaixa.new(self).Embed(pnlMarge).informacoes(
            procedure(Value: TCaixa)
            begin

              if not Assigned(FCaixa) then
                FCaixa := TCaixa.new;

              FCaixa.id := Value.id;
              FCaixa.Caixa := Value.Caixa;
              FCaixa.Turno := Value.Turno;
              FCaixa.Aberto := Value.Aberto;
              FCaixa.DataAbertura := Value.DataAbertura;
              FCaixa.SaldoInicial := Value.SaldoInicial;
              lblteste.Caption := ' | Valor Caixa: ' + FormatCurr('"R$ "#,##0.00', FCaixa.SaldoInicial) + ' | Caixa: ' +
                inttostr(FCaixa.Caixa) + ' | Turno: ' + FCaixa.Turno.Tostring + ' ' +
                Datetimetostr(FCaixa.DataAbertura);
              VerificaCaixaFechadoAberto;

            end).Show;

      end;
    VK_F6:
      showmessage('Cancelar Venda');
    VK_F5:
      showmessage('Cancelar Item');
    VK_F12:
      btnmaisfuncoes.OnClick(Sender);
    VK_F4:
      Begin
        TfrmfecharCAixa.new(self).Embed(pnlMarge).informacoes(
          procedure(Value: TCaixa)
          begin

            if not Assigned(FCaixa) then
              FCaixa := TCaixa.new;

            FCaixa.Aberto := Value.Aberto;
            FCaixa.DataHoraFechamento := Value.DataHoraFechamento;
            VerificaCaixaFechadoAberto;
            lblteste.Caption := '';
          end).Show;
      end;
    VK_F7:
      begin
        Lpagamnetos := Tfrmpagamentos.Create(nil);
        Lpagamnetos.Parent := pnlpag;
        Lpagamnetos.Show;
        ExibeSplitpagamento(SplitView2)
      end;
    VK_F1:
      begin
        Tfrmimportarcliente.new(self).Embed(pnlMarge).Show;
      end;

    VK_F9:
      begin
        Tfrmidentificarcliente.new(self).identificarcpf.Embed(pnlMarge).identificarcliente(
          procedure(aCPF, aCliente: string)
          begin
            if not aCliente.IsEmpty then
              aCliente := 'Cliente' + aCliente;

            if not aCPF.IsEmpty then
              aCPF := 'CPF - ' + aCPF;

            if ((not aCPF.IsEmpty) or (not aCliente.IsEmpty)) then
              Label2.Visible := true;
            Label2.Caption := aCPF + ' ' + aCliente;

          end)

      end;
  end;

end;

procedure TfmPrincipal.FormShow(Sender: TObject);
begin
  Tfrmlogin.new(self).Informacao(
    procedure(Value: string)

    begin
      if not Assigned(FCaixa) then
        FCaixa := TCaixa.new;
      FCaixa.Operador := Value;
      VerificaCaixaFechadoAberto;
    end).Show;

end;

procedure TfmPrincipal.iformacoesdoOperador;
var
  LCaption, Loperador: string;
begin

  Loperador := 'Caixa ' + FCaixa.Caixa.Tostring + ' | Operador: ' + FCaixa.Operador + ' | Turno: ' +
    FCaixa.Turno.Tostring + ' ' + datetostr(FCaixa.DataAbertura);

  LCaption := StringOfChar(' ', (255 - (Length(self.Caption) + Length(Loperador))));

  self.Caption := self.Caption + LCaption + Loperador;

end;

procedure TfmPrincipal.Montarbotoes;
begin
  btncancelarope.Caption := 'Cancelar Operação' + ''#13'' + '(ESC)';
  btnAbrirCaixa.Caption := 'Abrir Caixa' + ''#13'' + '(F2)';
  btncancelarvenda.Caption := 'Cancelar Venda' + ''#13'' + '(F6)';
  btncancelaritem.Caption := 'Cancelar Item' + ''#13'' + '(F5)';
  btnmaisfuncoes.Caption := 'Mais Funções' + ''#13'' + '(F12)';
  btnconsultarpreco.Caption := 'Fechar Caixa' + ''#13'' + '(F4)';
end;

procedure TfmPrincipal.SplitviewAction(Value: TSplitView);
begin
  SplitView1.Opened := not SplitView1.Opened;
end;

procedure TfmPrincipal.VerificaCaixaFechadoAberto;
begin
  if not FCaixa.Aberto then
  begin
    pnltitulo.Caption := ' Caixa Fechado';
    ajustarCampos;
    exit;
  end;
  pnltitulo.Caption := 'Caixa Aberto';
  ajustarCampos;
  iformacoesdoOperador;
end;

procedure TfmPrincipal.ExibeSplitpagamento(Value: TSplitView);
begin
  SplitView2.Opened := not SplitView2.Opened;
end;

end.
