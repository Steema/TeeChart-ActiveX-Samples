VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2014.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   6510
   ClientLeft      =   3570
   ClientTop       =   2520
   ClientWidth     =   6750
   LinkTopic       =   "Form1"
   ScaleHeight     =   6510
   ScaleWidth      =   6750
   Begin TeeChart.TChart TChart1 
      Height          =   4275
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6735
      Base64          =   $"ExplodePie.frx":0000
   End
   Begin VB.Frame Frame2 
      Height          =   1515
      Left            =   0
      TabIndex        =   4
      Top             =   4950
      Width           =   6735
      Begin VB.Frame Frame4 
         Caption         =   "ExplodeBiggest"
         Height          =   1305
         Left            =   4530
         TabIndex        =   11
         Top             =   150
         Width           =   2130
         Begin VB.HScrollBar HScroll1 
            Height          =   315
            LargeChange     =   5
            Left            =   255
            Max             =   30
            TabIndex        =   13
            Top             =   780
            Value           =   10
            Width           =   1545
         End
         Begin VB.CheckBox Check1 
            Caption         =   "ExplodeBiggest"
            Height          =   435
            Left            =   345
            TabIndex        =   12
            Top             =   300
            Width           =   1515
         End
      End
      Begin VB.Frame Frame3 
         Caption         =   "OtherSlice"
         Height          =   1305
         Left            =   60
         TabIndex        =   5
         Top             =   150
         Width           =   4425
         Begin VB.TextBox Text1 
            Height          =   345
            Left            =   60
            TabIndex        =   8
            Text            =   "20"
            Top             =   255
            Width           =   450
         End
         Begin VB.CommandButton Command2 
            Caption         =   "Set Otherslice"
            Height          =   360
            Left            =   1530
            TabIndex        =   7
            Top             =   855
            Width           =   1275
         End
         Begin VB.ComboBox Combo1 
            Height          =   315
            ItemData        =   "ExplodePie.frx":046C
            Left            =   1905
            List            =   "ExplodePie.frx":0479
            TabIndex        =   6
            Top             =   270
            Width           =   1425
         End
         Begin VB.Label Label3 
            Alignment       =   2  'Center
            Caption         =   "Criteria for deciding 'Other' slice grouping"
            Height          =   840
            Left            =   3285
            TabIndex        =   10
            Top             =   285
            Width           =   990
         End
         Begin VB.Label Label2 
            Caption         =   "Slice value below which slices are grouped"
            Height          =   585
            Left            =   555
            TabIndex        =   9
            Top             =   255
            Width           =   1290
         End
      End
   End
   Begin VB.Frame Frame1 
      Height          =   750
      Left            =   0
      TabIndex        =   1
      Top             =   4200
      Width           =   6735
      Begin VB.CheckBox Check2 
         Caption         =   "Animate !!"
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
         Left            =   210
         TabIndex        =   14
         Top             =   270
         Width           =   1470
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Reset Pie Slices"
         Height          =   390
         Left            =   5160
         TabIndex        =   3
         Top             =   225
         Width           =   1500
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Caption         =   "Drag Pie Slices out to move them. Put them back with the reset button."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   1845
         TabIndex        =   2
         Top             =   180
         Width           =   3225
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim OldX, OldY, DeltaS As Integer
Dim Dragged As Integer


Private Sub Check1_Click()
  If Check1.Value = 1 Then
    TChart1.Series(0).asPie.ExplodeBiggest = HScroll1.Value
    'TChart1.Series(0).asPie.OtherSlice.Style = poNone
  Else
    TChart1.Series(0).asPie.ExplodeBiggest = 0
    'TChart1.Series(0).asPie.OtherSlice.Style = Combo1.ListIndex
  End If
End Sub

Private Sub Check2_Click()
  If Check2.Value = 1 Then
    TChart1.TimerEnabled = True
    Command1_Click
  Else
    TChart1.TimerEnabled = False
  End If
End Sub

Private Sub Command1_Click()
Dim i As Integer
  For i = 0 To TChart1.Series(0).Count - 1
    TChart1.Series(0).asPie.ExplodedSlice.Value(i) = 0
  Next i
  DeltaS = 2
End Sub

Private Sub Command2_Click()
  TChart1.Series(0).asPie.OtherSlice.Style = Combo1.ListIndex
  TChart1.Series(0).asPie.OtherSlice.Value = Str$(Text1.Text)
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 6
  Dragged = -1
  Combo1.ListIndex = 0
  DeltaS = 2
  TChart1.TimerInterval = 100
  If TChart1.Canvas.IsScreenHighColor = False Then
    TChart1.Panel.Gradient.StartColor = vbYellow
  End If
End Sub

Private Sub HScroll1_Change()
  TChart1.Series(0).asPie.ExplodeBiggest = HScroll1.Value
End Sub

Private Sub TChart1_OnMouseDown(ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
  Dragged = TChart1.Series(0).Clicked(X, Y)
  OldX = X
  OldY = Y
End Sub

Private Sub TChart1_OnMouseMove(ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
Dim DifX, DifY As Integer
If TChart1.SeriesCount > 0 Then
  If Dragged <> -1 Then
  
    If X < OldX Then DifX = (X - OldX) * -1 Else DifX = (X - OldX)
    If Y < OldY Then DifY = (Y - OldY) * -1 Else DifY = (Y - OldY)
    If DifX > DifY Then
      If X >= TChart1.Series(0).asPie.XCenter Then
        If (X - OldX) > 0 Then
          TChart1.Series(0).asPie.ExplodedSlice.Value(Dragged) = (X - OldX)
        End If
      Else
        If (X - OldX) < 0 Then
          TChart1.Series(0).asPie.ExplodedSlice.Value(Dragged) = (OldX - X)
        End If
      End If
    Else
      If Y >= TChart1.Series(0).asPie.YCenter Then
        If (Y - OldY) > 0 Then
          TChart1.Series(0).asPie.ExplodedSlice.Value(Dragged) = (Y - OldY)
        End If
      Else
        If (Y - OldY) < 0 Then
          TChart1.Series(0).asPie.ExplodedSlice.Value(Dragged) = (OldY - Y)
        End If
      End If
    End If
 End If
End If
End Sub

Private Sub TChart1_OnMouseUp(ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
Dragged = -1
TChart1.Cursor = -2
End Sub

Private Sub TChart1_OnTimer()
Dim i As Integer
    For i = 0 To TChart1.Series(0).Count - 1
      TChart1.Series(0).asPie.ExplodedSlice.Value(i) = TChart1.Series(0).asPie.ExplodedSlice.Value(i) + DeltaS
    Next i
    If TChart1.Series(0).asPie.ExplodedSlice.Value(0) = 0 Or TChart1.Series(0).asPie.ExplodedSlice.Value(0) = 30 Then
       DeltaS = -DeltaS
    End If
    TChart1.Series(0).asPie.RotationAngle = TChart1.Series(0).asPie.RotationAngle + 2
End Sub


