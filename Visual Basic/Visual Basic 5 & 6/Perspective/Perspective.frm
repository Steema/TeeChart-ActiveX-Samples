VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2014.ocx"
Begin VB.Form Form1 
   Caption         =   "Surface Series Example"
   ClientHeight    =   5505
   ClientLeft      =   60
   ClientTop       =   300
   ClientWidth     =   7860
   LinkTopic       =   "Form1"
   ScaleHeight     =   5505
   ScaleWidth      =   7860
   StartUpPosition =   3  'Windows Default
   Begin TeeChart.TChart TChart1 
      Height          =   4095
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   7695
      Base64          =   $"Perspective.frx":0000
   End
   Begin VB.HScrollBar HScroll2 
      Height          =   315
      LargeChange     =   8
      Left            =   4365
      Max             =   95
      Min             =   5
      SmallChange     =   2
      TabIndex        =   11
      Top             =   4650
      Value           =   5
      Width           =   1785
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Show &Editor..."
      Height          =   375
      Left            =   6540
      TabIndex        =   10
      Top             =   4380
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Close"
      Height          =   375
      Left            =   6540
      TabIndex        =   9
      Top             =   5040
      Width           =   1215
   End
   Begin VB.CheckBox Check2 
      Caption         =   "&Animate !!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   135
      TabIndex        =   8
      Top             =   4275
      Width           =   1515
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   1965
      Top             =   4200
   End
   Begin VB.Frame Frame1 
      Caption         =   "Colors"
      Height          =   1095
      Left            =   2730
      TabIndex        =   4
      Top             =   4260
      Width           =   1515
      Begin VB.OptionButton Option3 
         Caption         =   "Solid"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   780
         Width           =   915
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Palette"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   525
         Width           =   1155
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Color range"
         Height          =   315
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Value           =   -1  'True
         Width           =   1215
      End
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Wire frame"
      Height          =   315
      Left            =   120
      TabIndex        =   3
      Top             =   5040
      Width           =   1215
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   315
      Left            =   120
      Max             =   20
      Min             =   2
      TabIndex        =   1
      Top             =   4650
      Value           =   8
      Width           =   1815
   End
   Begin VB.Label Label4 
      Height          =   315
      Left            =   5055
      TabIndex        =   14
      Top             =   5160
      Width           =   630
   End
   Begin VB.Label Label3 
      Caption         =   "15%                          90%"
      Height          =   285
      Left            =   4380
      TabIndex        =   13
      Top             =   5025
      Width           =   1770
   End
   Begin VB.Label Label2 
      Caption         =   "Perspective"
      Height          =   240
      Left            =   4395
      TabIndex        =   12
      Top             =   4365
      Width           =   1515
   End
   Begin VB.Label Label1 
      Caption         =   "8 x 8"
      Height          =   255
      Left            =   2040
      TabIndex        =   2
      Top             =   4710
      Width           =   1275
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Delta, DeltaP As Integer

Private Sub FillSurface()
'  fill surface with sample values...
 TChart1.Series(0).Clear
 With TChart1.Series(0).asSurface
  ' remove all surface points...
  ' set initial surface size ( rows x columns )
  .NumXValues = HScroll1.Value
  .NumZValues = HScroll1.Value
  ' add surface points with a loop...
  For X = 1 To .NumXValues
    For Z = 1 To .NumZValues
       ' add a surface point with a formula...
       .AddXYZ X, 0.5 * Cos(X / (.NumXValues * 0.2)) + _
                  Cos(Z / (.NumZValues * 0.2)), Z, "", clTeeColor
    Next Z
  Next X
 End With
End Sub

Private Sub Check1_Click()
' show surface as wireframe...
  TChart1.Series(0).asSurface.WireFrame = Check1.Value
End Sub

Private Sub Check2_Click()
 Timer1.Enabled = Check2.Value
 If Check2.Value = 1 Then
   HScroll2.Value = 50
 End If
End Sub

Private Sub Command1_Click()
  End
End Sub

Private Sub Command2_Click()
  TChart1.ShowEditor
End Sub



Private Sub Form_Load()
  Delta = 1
  DeltaP = 5
  HScroll1_Change
  TChart1.TimerInterval = 250
End Sub

Private Sub HScroll1_Change()
' re-fill surface...
  FillSurface
  Label1.Caption = Str$(HScroll1.Value) + " x " + Str$(HScroll1.Value)
End Sub


Private Sub HScroll2_Change()
  TChart1.Aspect.Perspective = HScroll2.Value
  Label4.Caption = Str$(HScroll2.Value) & "%"
End Sub

Private Sub Option1_Click()
' surface shows with "ColorRange" mode...
  TChart1.Series(0).asSurface.UseColorRange = True
  TChart1.Series(0).asSurface.UsePalette = False
End Sub

Private Sub Option2_Click()
' surface shows with "Palette" mode...
  TChart1.Series(0).asSurface.UsePalette = True
  TChart1.Series(0).asSurface.UseColorRange = False
End Sub

Private Sub Option3_Click()
' surface shows with solid color. No "ColorRange", no palette...
  TChart1.Series(0).asSurface.UseColorRange = False
  TChart1.Series(0).asSurface.UsePalette = False
End Sub

Private Sub Timer1_Timer()
  HScroll1.Value = HScroll1.Value + Delta
  If HScroll1.Value = 2 Or HScroll1.Value = 20 Then
     Delta = -Delta
  End If
  HScroll1_Change
  HScroll2.Value = HScroll2.Value + DeltaP
  If HScroll2.Value <= 15 Or HScroll2.Value >= 85 Then
     DeltaP = -DeltaP
  End If
End Sub


