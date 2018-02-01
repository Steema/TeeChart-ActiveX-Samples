VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series3DRangePaletteForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2385
   ClientTop       =   3165
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5475
      Left            =   0
      TabIndex        =   0
      Top             =   1440
      Width           =   11505
      Base64          =   $"Series3DRangePaletteForm.frx":0000
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   6480
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox Text4 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   225
      Left            =   2520
      TabIndex        =   11
      Top             =   1050
      Width           =   255
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Mid colour     "
      Height          =   345
      Left            =   1500
      TabIndex        =   10
      Top             =   990
      Width           =   1335
   End
   Begin VB.TextBox Text3 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   9
      Text            =   "Series3DRangePaletteForm.frx":0654
      Top             =   0
      Width           =   11490
   End
   Begin VB.TextBox Text2 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   225
      Left            =   3900
      TabIndex        =   8
      Top             =   1050
      Width           =   255
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   225
      Left            =   1140
      TabIndex        =   7
      Top             =   1050
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      Caption         =   "No steps"
      Height          =   195
      Left            =   5760
      TabIndex        =   6
      Top             =   1080
      Value           =   1  'Checked
      Width           =   1215
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   315
      Left            =   5280
      Max             =   1
      Min             =   100
      TabIndex        =   4
      Top             =   1020
      Value           =   10
      Width           =   225
   End
   Begin VB.CommandButton Command2 
      Caption         =   "End colour       "
      Height          =   345
      Left            =   2880
      TabIndex        =   2
      Top             =   990
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Start colour       "
      Height          =   345
      Left            =   120
      TabIndex        =   1
      Top             =   990
      Width           =   1335
   End
   Begin VB.Label Label3 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "10"
      Height          =   285
      Left            =   4920
      TabIndex        =   5
      Top             =   1020
      Width           =   375
   End
   Begin VB.Label Label2 
      Caption         =   "Steps:"
      Height          =   195
      Left            =   4380
      TabIndex        =   3
      Top             =   1080
      Width           =   495
   End
End
Attribute VB_Name = "Series3DRangePaletteForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  With TChart1.Series(0).asColorGrid
    .UsePalette = Not Check1.Value
    .UseColorRange = Check1.Value
    If Check1.Value = 1 Then
      .CreateDefaultPalette .PaletteSteps
    Else
      .CreateRangePalette
    End If
  End With
  If Check1.Value = 1 Then
    VScroll1.Enabled = False
  Else
    VScroll1.Enabled = True
  End If
  TChart1.Repaint
End Sub

Private Sub Command1_Click()
  CommonDialog1.ShowColor
  If CommonDialog1.Color > 0 Then
    TChart1.Series(0).asColorGrid.StartColor = CommonDialog1.Color
    Text1.BackColor = CommonDialog1.Color
  End If
End Sub
Private Sub Command2_Click()
CommonDialog1.ShowColor
If CommonDialog1.Color > 0 Then
TChart1.Series(0).asColorGrid.EndColor = CommonDialog1.Color
Text2.BackColor = CommonDialog1.Color
End If
End Sub
Private Sub Command3_Click()
CommonDialog1.ShowColor
If CommonDialog1.Color > 0 Then
TChart1.Series(0).asColorGrid.MidColor = CommonDialog1.Color
Text4.BackColor = CommonDialog1.Color
End If
End Sub
Private Sub Form_Load()
With TChart1.Series(0)
.FillSampleValues 100
.asColorGrid.Pen.Visible = False
End With
TChart1.Series(0).asColorGrid.MidColor = RGB(0, 128, 128)
Text1.BackColor = TChart1.Series(0).asColorGrid.StartColor
Text2.BackColor = TChart1.Series(0).asColorGrid.EndColor
Text4.BackColor = TChart1.Series(0).asColorGrid.MidColor
TChart1.Series(0).asColorGrid.PaletteSteps = 10
TChart1.Series(0).asColorGrid.UsePalette = False
If Check1.Value = 1 Then
VScroll1.Enabled = False
Else
VScroll1.Enabled = True
End If
VScroll1_Change
End Sub
Private Sub TChart1_OnDblClick()
TChart1.ShowEditor
TChart1.StopMouse
End Sub
Private Sub VScroll1_Change()
If Check1.Value = 0 Then
With TChart1.Series(0).asColorGrid
.PaletteSteps = VScroll1.Value
.CreateRangePalette
End With
Label3.Caption = TChart1.Series(0).asColorGrid.PaletteSteps
TChart1.Repaint
End If
End Sub
