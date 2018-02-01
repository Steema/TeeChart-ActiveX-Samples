VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ColorGrid_TransparentForm 
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
      Height          =   5865
      Left            =   0
      TabIndex        =   0
      Top             =   1050
      Width           =   11505
      Base64          =   $"ColorGrid_TransparentForm.frx":0000
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   2295
      TabIndex        =   5
      Text            =   "1"
      Top             =   630
      Width           =   465
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Transparent"
      Height          =   195
      Left            =   180
      TabIndex        =   3
      Top             =   675
      Value           =   1  'Checked
      Width           =   1320
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   525
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "ColorGrid_TransparentForm.frx":0454
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Make some ramdom cells transparent"
      Height          =   345
      Left            =   3150
      TabIndex        =   1
      Top             =   585
      Width           =   3585
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Levels:"
      Height          =   195
      Left            =   1665
      TabIndex        =   4
      Top             =   675
      Width           =   510
   End
End
Attribute VB_Name = "ColorGrid_TransparentForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
    Text1.Enabled = Check1.Value
    'TChart1.Series(0).asColorGrid.Bitmap.Transparent = Check1.Value
    TChart1.Series(0).asColorGrid.CreateRangePalette
    If Check1.Value Then
      SetTransparentColors
    End If
    TChart1.Series(0).RefreshSeries
End Sub

Private Sub SetTransparentColors()
Dim t As Integer
  ' Set colorgrid bitmap to transparent
  With TChart1
    '.Series(0).asColorGrid.Bitmap.Transparent = False
    '.Series(0).asColorGrid.Bitmap.Transparent = True
    ' re-create the palette
    .Series(0).asColorGrid.CreateRangePalette
    ' set levels to transparent color (white in this example)  }
    For t = 0 To Text1.Text - 1
'      .Series(0).ascolorgrid.Palette[t].Color:=clWhite;
    Next t
  End With
End Sub

Private Sub Command1_Click()
Dim t, X, z As Integer
  ' make 10 cells transparent...
  For t = 1 To 10
    X = 1 + (Rnd * TChart1.Series(0).asColorGrid.NumXValues)
    z = 1 + (Rnd * TChart1.Series(0).asColorGrid.NumZValues)
    'TChart1.Series(0).SetNull TChart1.Series(0).asColorGrid.gridindex(x, z)
    'Series1.SetNull(Series1.GridIndex[x,z]);
  Next t
End Sub

Private Sub Form_Load()
'  UpDown1.Max:=30;
With TChart1
    .AddSeries scColorGrid
    .Series(0).FillSampleValues (100)
    .Series(0).asColorGrid.CenteredPoints = True
    .Series(0).asColorGrid.UseColorRange = False
    .Series(0).asColorGrid.UsePalette = True
    .Series(0).asColorGrid.PaletteSteps = 10
    .Series(0).asColorGrid.CreateRangePalette
    Check1_Click
End With
End Sub

Private Sub Text2_Change()
  SetTransparentColors
  TChart1.Series(0).RefreshSeries
End Sub
