VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2014.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5685
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   8790
   LinkTopic       =   "Form1"
   ScaleHeight     =   5685
   ScaleWidth      =   8790
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Caption         =   "Canvas:"
      Height          =   735
      Left            =   45
      TabIndex        =   4
      Top             =   540
      Width           =   2490
      Begin VB.OptionButton Option1 
         Caption         =   "GDI+"
         Height          =   195
         Index           =   1
         Left            =   1260
         TabIndex        =   6
         Top             =   315
         Width           =   825
      End
      Begin VB.OptionButton Option1 
         Caption         =   "GDI"
         Height          =   195
         Index           =   0
         Left            =   225
         TabIndex        =   5
         Top             =   315
         Value           =   -1  'True
         Width           =   825
      End
   End
   Begin VB.CheckBox cbAntialiasText 
      Caption         =   "Anti-Alias &Text"
      Height          =   240
      Left            =   4905
      TabIndex        =   3
      Top             =   810
      Width           =   1455
   End
   Begin VB.CheckBox cbAntialias 
      Caption         =   "&Anti-Alias"
      Height          =   240
      Left            =   2925
      TabIndex        =   2
      Top             =   810
      Width           =   1590
   End
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   510
      Left            =   45
      OleObjectBlob   =   "GDIPlusForm.frx":0000
      TabIndex        =   1
      Top             =   0
      Width           =   8745
   End
   Begin TeeChart.TChart TChart1 
      Height          =   4335
      Left            =   0
      TabIndex        =   0
      Top             =   1305
      Width           =   8790
      Base64          =   $"GDIPlusForm.frx":004C
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  TeeCommander1.Chart = TChart1
  
End Sub



unit DemoGDIPlus;
{$I TeeDefs.inc}

interface

uses
  Windows, Messages,
  SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  TeEngine, Series, TeeProcs, Chart,
  TeeGDIPlus, TeeTools, TeeComma, TeCanvas;

// Sample project showing the TGDIPlusCanvas to render TeeChart
// controls using Microsoft GDI Plus.

type
  TForm1 = Class(TForm)
    Chart1: TChart;
    Series1: TBarSeries;
    ChartTool1: TRotateTool;
    TeeCommander1: TTeeCommander;
    RadioGroup1: TRadioGroup;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ChartTool2: TAnnotationTool;
    procedure RadioGroup1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    g: TGDIPlusCanvas;
  end;

Var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  If RadioGroup1.ItemIndex = 0 Then
     Chart1.Canvas:=TTeeCanvas3D.Create  // normal GDI canvas
  Else
  begin
    // Create and set GDI Plus canvas.
    // This new canvas will be automatically destroyed when the chart
    // is freed.

    g:=TGDIPlusCanvas.Create;

    Chart1.Canvas:=g;

    // Some options for GDI Plus canvas
    g.AntiAlias:=CheckBox1.Checked;
    g.AntiAliasText:=CheckBox2.Checked;
  end;

  CheckBox1.Enabled:=RadioGroup1.ItemIndex=1;
  CheckBox2.Enabled:=RadioGroup1.ItemIndex=1;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  g.AntiAliasText:=CheckBox2.Checked;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  g.AntiAlias:=CheckBox1.Checked;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Series1.BarPen.Width:=2;
end;

end.
