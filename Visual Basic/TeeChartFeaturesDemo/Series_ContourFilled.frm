VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_ContourFilled 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3480
   ClientTop       =   3390
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   9600
      Top             =   1110
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Legend lines"
      Height          =   195
      Left            =   5160
      TabIndex        =   7
      Top             =   1230
      Width           =   1365
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Filled"
      Height          =   195
      Left            =   90
      TabIndex        =   6
      Top             =   1230
      Value           =   1  'Checked
      Width           =   765
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Lines..."
      Height          =   345
      Left            =   7320
      TabIndex        =   5
      Top             =   1170
      Width           =   1245
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Frame..."
      Height          =   345
      Left            =   3630
      TabIndex        =   4
      Top             =   1170
      Width           =   1245
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Pattern..."
      Height          =   345
      Left            =   2310
      TabIndex        =   3
      Top             =   1170
      Width           =   1245
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   990
      TabIndex        =   2
      Top             =   1170
      Width           =   1245
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   1
      Top             =   1650
      Width           =   11505
      Base64          =   $"Series_ContourFilled.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1065
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Series_ContourFilled.frx":054A
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Series_ContourFilled"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  If Check1.Value Then
     TChart1.Series(0).Brush.Style = bsSolid
  Else
     TChart1.Series(0).Brush.Style = bsClear
  End If
End Sub

Private Sub Check2_Click()
' when LegendLines is True, and if contour levels aren't filled,
' the legend displays contour levels as lines instead of rectangles.
  TChart1.Series(0).asContour.LegendLines = Check2.Value

' Disable filling when LegendLines is True:
  If TChart1.Series(0).asContour.LegendLines Then
    TChart1.Series(0).Brush.Style = bsClear
    Check1.Value = Unchecked
  End If
End Sub

Private Sub Command1_Click()
  TChart1.ShowEditor 0
End Sub

Private Sub Command2_Click()
  TChart1.Series(0).asContour.Brush.ShowEditor
End Sub

Private Sub Command3_Click()
  TChart1.Series(0).asContour.Frame.ShowEditor
End Sub

Private Sub Command4_Click()
  CommonDialog1.ShowColor
  If CommonDialog1.Color > 0 Then
    TChart1.Series(0).asContour.LinesColor = CommonDialog1.Color
    'Label1.BackColor = CommonDialog1.Color
    Colorset = True
  End If
  
' "LinesColor" property only available when contour is filled.
' So, set contour to filled mode:
  If TChart1.Series(0).Brush.Style = bsClear Then
    Check1.Value = Unchecked
    TChart1.Series(0).Brush.Style = bsSolid
  End If
End Sub

Private Sub Form_Load()
  TChart1.Series(0).Brush.Style = bsSolid
  TChart1.Series(0).FillSampleValues
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
