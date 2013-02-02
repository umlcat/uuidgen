unit ufrmmain;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls, StdCtrls,
  uktmsgdlgtypes,
  uktmsgdlgs,
  uktdecs,
  ukthexas,
  uktguids,
  uktguidstrs,
  uktstrings,
  ufrmmainstrs,
  dummy;

const
  riSingleUUIDStrSourceRadioButton   = 0;
  riDoubleUUIDStrSourceRadioButton   = 1;
  riLongUUIDStrSourceRadioButton     = 2;
  riPascalByteArraySourceRadioButton = 3;
  riPlainCByteArraySourceRadioButton = 4;

type

  { TMainForm }

  TMainForm = class(TForm)
    DoubleUUIDStrPasteButton: TButton;
    DoubleUUIDStrCopyButton: TButton;
    DoubleUUIDStrDestEdit: TEdit;
    DoubleUUIDStrSourceEdit: TEdit;
    DoubleUUIDStrDestLabel: TLabel;
    ButtonPanel: TPanel;
    LongUUIDStrPasteButton: TButton;
    LongUUIDStrSourceRadioButton: TRadioButton;
    PascalByteArrayPasteButton: TButton;
    PascalByteArraySourceRadioButton: TRadioButton;
    PlainCByteArrayPasteButton: TButton;
    PlainCByteArraySourceRadioButton: TRadioButton;
    SingleUUIDStrPasteButton: TButton;
    SingleUUIDStrSourceRadioButton: TRadioButton;
    ResultEdit: TEdit;
    ResultLabel: TLabel;
    LongUUIDStrCopyButton: TButton;
    LongUUIDStrDestEdit: TEdit;
    LongUUIDStrSourceEdit: TEdit;
    LongUUIDStrDestLabel: TLabel;
    MainStatusBar: TStatusBar;
    MainPanel: TPanel;
    MainPageControl: TPageControl;
    PascalByteArrayCopyButton: TButton;
    PascalByteArrayDestEdit: TEdit;
    PascalByteArraySourceEdit: TEdit;
    PascalByteArrayDestLabel: TLabel;
    PlainCByteArrayCopyButton: TButton;
    PlainCByteArrayDestEdit: TEdit;
    PlainCByteArraySourceEdit: TEdit;
    PlainCByteArrayDestLabel: TLabel;
    SingleUUIDStrCopyButton: TButton;
    SingleUUIDStrDestEdit: TEdit;
    SingleUUIDStrSourceEdit: TEdit;
    SingleUUIDStrDestLabel: TLabel;
    DoubleUUIDStrSourceRadioButton: TRadioButton;
    TextToUUIDPanel: TPanel;
    ExecuteButton: TButton;
    ExitButton: TButton;
    UUIDToTextTabSheet: TTabSheet;
    TextToUUIDTabSheet: TTabSheet;
    UUIDToTextPanel: TPanel;
    procedure DoubleUUIDStrCopyButtonClick(Sender: TObject);
    procedure DoubleUUIDStrPasteButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LongUUIDStrCopyButtonClick(Sender: TObject);
    procedure LongUUIDStrPasteButtonClick(Sender: TObject);
    procedure PascalByteArrayPasteButtonClick(Sender: TObject);
    procedure PlainCByteArrayPasteButtonClick(Sender: TObject);
    procedure SingleUUIDStrCopyButtonClick(Sender: TObject);
    procedure SingleUUIDStrPasteButtonClick(Sender: TObject);
    procedure TextToUUIDExecuteButtonClick(Sender: TObject);
    procedure TextToUUIDExitButtonClick(Sender: TObject);
    procedure ExecuteButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
  private
    { private declarations }
  protected
    { protected declarations }

    FGUID: TGUID;

    SingleGUIDStr: TSingleGUIDStr;
    DoubleGUIDStr: TDoubleGUIDStr;
    LongGUIDStr:   TLongGUIDStr;
    AnsiStr:       ansistring;
  public
    { public declarations }

    procedure LoadResources();

    procedure GenerateText();

    procedure SelectGenerateUUID
      (const ASource: ansistring;
       const ALen: Integer;
       const ARadioItem: Integer);
    procedure GenerateUUID();
  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.GenerateText();
begin
  uktguids.CreateGUID( (* var *) FGUID);

  GUIDToSingleStr((* const *) FGUID, (* var *) SingleGUIDStr);
  SingleUUIDStrDestEdit.Text := SingleGUIDStr;

  GUIDToDoubleStr((* const *) FGUID, (* var *) DoubleGUIDStr);
  DoubleUUIDStrDestEdit.Text := DoubleGUIDStr;

  GUIDToLongStr((* const *) FGUID, (* var *) LongGUIDStr);
  LongUUIDStrDestEdit.Text := LongGUIDStr;

  GUIDToPascalByteArray((* const *) FGUID, (* var *) AnsiStr);
  PascalByteArrayDestEdit.Text := AnsiStr;

  GUIDToPlainCByteArray((* const *) FGUID, (* var *) AnsiStr);
  PlainCByteArrayDestEdit.Text := AnsiStr;

  (*
  ASource := UUIDSourceEdit.Text;
  ALen := Length(ASource);
  if (ALen > 0) then
  begin
    if (ALen > 32) then
    begin
      uktmsgdlgs.MessageDlg
        ('Too Many Digits', uktmsgdlgtypes.mtError, [mbOK]);
    end else if (not ukthexas.IsHexShortStr(ASource, ALen)) then
    begin
      uktmsgdlgs.MessageDlg
        ('Non hexadecimal digit', uktmsgdlgtypes.mtError, [mbOK]);
    end else
    begin
      // --> apply conversion

    end;
  end else
  begin
    uktmsgdlgs.MessageDlg
      ('Empty String', uktmsgdlgtypes.mtError, [mbOK]);
  end;
  *)
end;

procedure TMainForm.SelectGenerateUUID
  (const ASource: ansistring;
   const ALen: Integer;
   const ARadioItem: Integer);
var ThisGuid: TGUID;
    ASingleGUIDStr: TSingleGUIDStr;
    ADoubleGUIDStr: TDoubleGUIDStr;
    ALongGUIDStr:   TLongGUIDStr;
begin
  case (ARadioItem) of
    riSingleUUIDStrSourceRadioButton:
      begin
        if (not uktguidstrs.IsSingleGUIDStr(ASource)) then
        begin
          uktmsgdlgs.MessageDlg
            ('Non hexadecimal digit', uktmsgdlgtypes.mtError, [mbOK]);
        end else
        begin
          // --> convert
          SingleStrToGUID(ASource, (* var *) ThisGuid);
          // --> convert back
          GUIDToSingleStr((* const *) ThisGuid, (* var *) ASingleGUIDStr);
          ResultEdit.Text := ASingleGUIDStr;
        end;
      end;
    riDoubleUUIDStrSourceRadioButton:
      begin
        if (not uktguidstrs.IsDoubleGUIDStr(ASource)) then
        begin
          uktmsgdlgs.MessageDlg
            ('Syntax Error', uktmsgdlgtypes.mtError, [mbOK]);
        end else
        begin
          // --> convert
          DoubleStrToGUID(ASource, (* var *) ThisGuid);
          // --> convert back
          GUIDToDoubleStr((* const *) ThisGuid, (* var *) ADoubleGUIDStr);
          ResultEdit.Text := ADoubleGUIDStr;
        end;
      end;
    riLongUUIDStrSourceRadioButton:
      begin
        if (not uktguidstrs.IsLongGUIDStr(ASource)) then
        begin
          uktmsgdlgs.MessageDlg
            ('Syntax Error', uktmsgdlgtypes.mtError, [mbOK]);
        end else
        begin
          // --> convert
          LongStrToGUID(ASource, (* var *) ThisGuid);
          // --> convert back
          GUIDToLongStr((* const *) ThisGuid, (* var *) ALongGUIDStr);
          ResultEdit.Text := ALongGUIDStr;
        end;
      end;
    riPascalByteArraySourceRadioButton:
      begin
      end;
    riPlainCByteArraySourceRadioButton:
      begin
      end;
  end;
end;

procedure TMainForm.GenerateUUID();
var ASource: shortstring; ARadioItem, ALen: Integer;
  ASizes: array
   [riSingleUUIDStrSourceRadioButton .. riPlainCByteArraySourceRadioButton]
   of Integer;
begin
  ASizes[riSingleUUIDStrSourceRadioButton]   := SingleGUIDStrMaxSize;
  ASizes[riDoubleUUIDStrSourceRadioButton]   := DoubleGUIDStrMaxSize;
  ASizes[riLongUUIDStrSourceRadioButton]     := LongGUIDStrMaxSize;
  ASizes[riPascalByteArraySourceRadioButton] := PascalArrayGUIDStrMaxSize;
  ASizes[riPlainCByteArraySourceRadioButton] := PlainCArrayGUIDStrMaxSize;

  if (SingleUUIDStrSourceRadioButton.Checked) then
  begin
    ARadioItem := riSingleUUIDStrSourceRadioButton;
    ASource := SingleUUIDStrSourceEdit.Text;
  end else if (DoubleUUIDStrSourceRadioButton.Checked) then
  begin
    ARadioItem := riDoubleUUIDStrSourceRadioButton;
    ASource := DoubleUUIDStrSourceEdit.Text;
  end else if (LongUUIDStrSourceRadioButton.Checked) then
  begin
    ARadioItem := riLongUUIDStrSourceRadioButton;
    ASource := LongUUIDStrSourceEdit.Text;
  end else if (PascalByteArraySourceRadioButton.Checked) then
  begin
    ARadioItem := riPascalByteArraySourceRadioButton;
    ASource := PascalByteArraySourceEdit.Text;
  end else if (PlainCByteArraySourceRadioButton.Checked) then
  begin
    ARadioItem := riPlainCByteArraySourceRadioButton;
    ASource := PlainCByteArraySourceEdit.Text;
  end;
  ALen := Length(ASource);

  if (ALen > 0) then
  begin
    if (ALen > ASizes[ARadioItem]) then
    begin
      uktmsgdlgs.MessageDlg
        ('Too Many Digits', uktmsgdlgtypes.mtError, [mbOK]);
    end else
    begin
      // --> apply conversion
      SelectGenerateUUID(ASource, ALen, ARadioItem);
    end;
  end else
  begin
    uktmsgdlgs.MessageDlg
      ('Empty String', uktmsgdlgtypes.mtError, [mbOK]);
  end;
end;

procedure TMainForm.ExecuteButtonClick(Sender: TObject);
begin
  if (MainPageControl.ActivePageIndex = UUIDToTextTabSheet.PageIndex) then
  begin
    GenerateText();
  end else
  begin
    GenerateUUID();
  end;
end;

procedure TMainForm.TextToUUIDExecuteButtonClick(Sender: TObject);
begin
  Self.Close();
end;

const A: array[0 .. 15] of byte =
  ($D1,$BF,$01,$75,$9A,$93,$CC,$41,$82,$A3,$3A,$DB,$1B,$34,$59,$E8);

procedure TMainForm.LoadResources();
begin
  MainForm.Caption      := resMainForm_Caption;

  UUIDToTextTabSheet.Caption := resUUIDToTextTabSheet_Caption;
  TextToUUIDTabSheet.Caption := resTextToUUIDTabSheet_Caption;

  ExecuteButton.Caption := resExecuteButton_Caption;
  ExitButton.Caption  := resExitButton_Caption;

  SingleUUIDStrCopyButton.Caption   := resSingleUUIDStrButton_Caption;
  DoubleUUIDStrCopyButton.Caption   := resDoubleUUIDStrButton_Caption;
  LongUUIDStrCopyButton.Caption     := resLongUUIDStrButton_Caption;
  PascalByteArrayCopyButton.Caption := resPascalByteArrayButton_Caption;
  PlainCByteArrayCopyButton.Caption := resPlainCByteArrayButton_Caption;

  SingleUUIDStrDestLabel.Caption   := resSingleUUIDStrLabel_Caption;
  DoubleUUIDStrDestLabel.Caption   := resDoubleUUIDStrLabel_Caption;
  LongUUIDStrDestLabel.Caption     := resLongUUIDStrLabel_Caption;
  PascalByteArrayDestLabel.Caption := resPascalByteArrayLabel_Caption;
  PlainCByteArrayDestLabel.Caption := resPlainCByteArrayLabel_Caption;

  SingleUUIDStrSourceRadioButton.Caption :=
    resSourceSingleUUIDStrRadioButton_Caption;
  DoubleUUIDStrSourceRadioButton.Caption :=
    resDoubleUUIDStrSourceRadioButton_Caption;
  LongUUIDStrSourceRadioButton.Caption :=
    resLongUUIDStrSourceRadioButton_Caption;
  PascalByteArraySourceRadioButton.Caption :=
    resPascalByteArraySourceRadioButton_Caption;
  PlainCByteArraySourceRadioButton.Caption :=
    resPlainCByteArraySourceRadioButton_Caption;
  ResultLabel.Caption :=
    resResultLabel_Caption;

  SingleUUIDStrPasteButton.Caption :=
    resSingleUUIDStrPasteButton_Caption;
  DoubleUUIDStrPasteButton.Caption :=
    resDoubleUUIDStrPasteButton_Caption;
  LongUUIDStrPasteButton.Caption :=
    resLongUUIDStrPasteButton_Caption;
  PascalByteArrayPasteButton.Caption :=
    resPascalByteArrayPasteButton_Caption;
  PlainCByteArrayPasteButton.Caption :=
    resPlainCByteArrayPasteButton_Caption;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  LoadResources();
end;

procedure TMainForm.LongUUIDStrCopyButtonClick(Sender: TObject);
begin
  //
end;

procedure TMainForm.LongUUIDStrPasteButtonClick(Sender: TObject);
begin
  //
end;

procedure TMainForm.PascalByteArrayPasteButtonClick(Sender: TObject);
begin
  //
end;

procedure TMainForm.PlainCByteArrayPasteButtonClick(Sender: TObject);
begin
  //
end;

procedure TMainForm.DoubleUUIDStrCopyButtonClick(Sender: TObject);
begin
  //
end;

procedure TMainForm.DoubleUUIDStrPasteButtonClick(Sender: TObject);
begin
  //
end;

procedure TMainForm.SingleUUIDStrCopyButtonClick(Sender: TObject);
begin
  //Clipboard.
end;

procedure TMainForm.SingleUUIDStrPasteButtonClick(Sender: TObject);
begin
  //
end;

procedure TMainForm.TextToUUIDExitButtonClick(Sender: TObject);
begin
  //
end;

procedure TMainForm.ExitButtonClick(Sender: TObject);
begin
  Self.Close();
end;

end.

