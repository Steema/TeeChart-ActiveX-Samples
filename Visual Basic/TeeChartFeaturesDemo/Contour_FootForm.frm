VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Contour_FootForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   0
      Top             =   1650
      Width           =   11505
      Base64          =   $"Contour_FootForm.frx":0000
   End
   Begin VB.Frame Frame1 
      Caption         =   "Show as :"
      Height          =   825
      Left            =   90
      TabIndex        =   2
      Top             =   765
      Width           =   2985
      Begin VB.OptionButton Option2 
         Caption         =   "ColorGrid Series"
         Height          =   285
         Left            =   270
         TabIndex        =   4
         Top             =   450
         Width           =   1905
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Contour Series"
         Height          =   195
         Left            =   270
         TabIndex        =   3
         Top             =   225
         Value           =   -1  'True
         Width           =   1590
      End
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   705
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Contour_FootForm.frx":00C4
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Contour_FootForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' This example was kindly provided by Lee Grissom
' Hard coded values for this specific format
Dim BIGPADWIDTH
Dim BIGPADLENGTH

'  ColorPalette: array[ 0..15 ] of TColor =
'  (
'    $000000, $ff0000, $ff8000, $ffc000,
'    $ffff00, $c0ff00, $80ff00, $00ff00,
'    $00ff80, $00ffff, $00dfff, $00c0ff,
'    $00a0ff, $0080ff, $0060ff, $0000ff
'  );

  
  
'  TBigPadArray = array[0..95, 0..63] of Byte;

'  TContourFoot = Class(TBaseForm)
'    Series1: TContourSeries;
'    RadioGroup1: TRadioGroup;
'    procedure RadioGroup1Click(Sender: TObject);
'    procedure FormCreate(Sender: TObject);
'  private
'    { Private declarations }
'    FootScanArray: TBigPadArray;
'    procedure AddDataToSeries(ASeries: TCustom3DGridSeries; Const FileName: String);
'    procedure InitContourSeries(ASeries :TContourSeries);
'    procedure InitSeries(ASeries :TCustom3DGridSeries);
'  public
'    { Public declarations }
'  end;


'procedure TContourFoot.AddDataToSeries(ASeries: TCustom3DGridSeries; const FileName: String);
'Var
'//  f: File of TBigPadArray;
'  len, wid: Integer;
'  val: Byte;
'  r: TResourceStream;
'begin
'  r:=TResourceStream.Create(HInstance, 'FOOTDATA', RT_RCDATA);
'  try
'    {$IFNDEF CLR}
'    r.ReadBuffer(FootScanArray,r.Size);
'    {$ENDIF}
'  finally
'    r.Free;
'  end;

'(*
'  AssignFile(f,fileName);
'  try
'    Reset(f);
'    Read(f, FootScanArray);
'  finally
'    CloseFile(f);
'  end;
'*)

  'ASeries.Clear;

'  for len := 0 to BIGPADLENGTH do
'    for wid := 0 to BIGPADWIDTH do
'    begin
'      val:=FootScanArray[len, wid];

'       ASeries.AddXYZ( wid+1, val, len+1 );
'    end;
'end;

'procedure TContourFoot.InitContourSeries(ASeries :TContourSeries);
'var i: Integer;
'begin
'  ASeries.NumLevels := High(ColorPalette)+1;
'  ASeries.CreateAutoLevels;
'  ASeries.AutomaticLevels:=False;
'  ASeries.Pen.Visible := True;
'  ASeries.Pen.Width := 5;
'  for i := 0 to ASeries.Levels.Count -1  do
'  begin
'    ASeries.Levels[i].Color := ColorPalette[i];
'    ASeries.Levels[i].UpToValue := i + 0.5;
'  end;
'end;

'procedure TContourFoot.InitSeries(ASeries: TCustom3DGridSeries);
'var i: Integer;
'begin
'  ASeries.UsePalette := True;
'  ASeries.UseColorRange := False;'

'  ASeries.ClearPalette;
'  for i := Low(ColorPalette) to High(ColorPalette) do
'    ASeries.AddPalette(i+0.5,ColorPalette[i]);

  'ASeries.Repaint;
'end;

'procedure TContourFoot.RadioGroup1Click(Sender: TObject);
'var tmp: TChartSeries;
'begin
'  tmp := Chart1.Series[0];
'  case RadioGroup1.ItemIndex of
'0:      begin
'          ChangeSeriesType(tmp,TContourSeries);
'          InitContourSeries(Chart1.Series[0] as TContourSeries);
'        end;
'1:      begin
'          ChangeSeriesType(tmp,TColorGridSeries);
'          Chart1.Series[0].Pen.Visible := False;
'        end;
'  end;
'end;

'procedure TContourFoot.FormCreate(Sender: TObject);
'begin
'  inherited;
'  AddDataToSeries(Series1,'FootData.bin');'

'//  Series1.NumLevels:=Series1.PaletteSteps;

  'InitSeries(Series1);
'  RadioGroup1.ItemIndex := 0;
'  RadioGroup1Click(Self);
'end;


Private Sub Form_Load()
BIGPADWIDTH = 63
BIGPADLENGTH = 95

End Sub
