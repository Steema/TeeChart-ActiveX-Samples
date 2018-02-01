VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ColorLineFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3345
   ClientTop       =   2490
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.CheckBox Check7 
      Caption         =   "No Limit drag"
      Height          =   195
      Left            =   3960
      TabIndex        =   10
      Top             =   1140
      Width           =   1305
   End
   Begin VB.CheckBox Check6 
      Caption         =   "Draw Behind"
      Height          =   195
      Left            =   3960
      TabIndex        =   9
      Top             =   840
      Width           =   1305
   End
   Begin VB.CheckBox Check5 
      Caption         =   "Drag Repaint"
      Height          =   195
      Left            =   1770
      TabIndex        =   8
      Top             =   1110
      Width           =   1305
   End
   Begin VB.CheckBox Check4 
      Caption         =   "3D Lines"
      Height          =   195
      Left            =   2640
      TabIndex        =   7
      Top             =   840
      Value           =   1  'Checked
      Width           =   1275
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5475
      Left            =   0
      TabIndex        =   0
      Top             =   1440
      Width           =   11505
      Base64          =   $"ColorLineFormForm.frx":0000
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   9270
      Top             =   810
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Allow Drag"
      Height          =   195
      Left            =   180
      TabIndex        =   4
      Top             =   1080
      Value           =   1  'Checked
      Width           =   1275
   End
   Begin VB.CheckBox Check2 
      Caption         =   "3D"
      Height          =   195
      Left            =   1770
      TabIndex        =   3
      Top             =   840
      Value           =   1  'Checked
      Width           =   555
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show Lines"
      Height          =   195
      Left            =   180
      TabIndex        =   2
      Top             =   840
      Value           =   1  'Checked
      Width           =   1515
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   705
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ColorLineFormForm.frx":04F0
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Height          =   195
      Left            =   6960
      TabIndex        =   11
      Top             =   990
      Width           =   45
   End
   Begin VB.Label Label2 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Height          =   315
      Left            =   6270
      TabIndex        =   6
      Top             =   900
      Width           =   315
   End
   Begin VB.Label Label1 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Height          =   315
      Left            =   5730
      TabIndex        =   5
      Top             =   900
      Width           =   315
   End
End
Attribute VB_Name = "ColorLineFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim MouseX, MouseY As Double

Private Sub Check1_Click()
  TChart1.Tools.Items(0).Active = Check1.Value
  TChart1.Tools.Items(1).Active = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Aspect.View3D = Check2.Value
  Check4.Enabled = Check2.Value
End Sub

Private Sub Check3_Click()
  TChart1.Tools.Items(0).asColorLine.AllowDrag = Check3.Value
  TChart1.Tools.Items(1).asColorLine.AllowDrag = Check3.Value
End Sub

Private Sub Check4_Click()
  TChart1.Tools.Items(0).asColorLine.Draw3D = Check4.Value
  TChart1.Tools.Items(1).asColorLine.Draw3D = Check4.Value
End Sub

Private Sub Check5_Click()
  TChart1.Tools.Items(0).asColorLine.DragRepaint = Check5.Value
  TChart1.Tools.Items(1).asColorLine.DragRepaint = Check5.Value
End Sub

Private Sub Check6_Click()
  TChart1.Tools.Items(0).asColorLine.DrawBehind = Check6.Value
  TChart1.Tools.Items(1).asColorLine.DrawBehind = Check6.Value
End Sub

Private Sub Check7_Click()
  TChart1.Tools.Items(0).asColorLine.NoLimitDrag = Check7.Value
  TChart1.Tools.Items(1).asColorLine.NoLimitDrag = Check7.Value
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues 20
    .Series(1).FillSampleValues 20
    .Tools.Items(0).asColorLine.Value = .Series(0).YValues.Minimum _
        + ((.Series(0).YValues.Maximum _
        - .Series(0).YValues.Minimum) / 2)
    .Tools.Items(1).asColorLine.Value = .Series(0).XValues.Minimum _
        + ((.Series(0).XValues.Maximum _
        - .Series(0).XValues.Minimum) / 2)
    Label1.BackColor = TChart1.Tools(0).asColorLine.Pen.Color
    Label2.BackColor = TChart1.Tools(1).asColorLine.Pen.Color
  End With
End Sub

Private Sub Label1_Click()
  CommonDialog1.ShowColor
  If CommonDialog1.Color <> 0 Then
    TChart1.Tools.Items(0).asColorLine.Pen.Color = CommonDialog1.Color
    Label1.BackColor = CommonDialog1.Color
  End If
End Sub

Private Sub Label2_Click()
  CommonDialog1.ShowColor
  If CommonDialog1.Color <> 0 Then
    TChart1.Tools.Items(1).asColorLine.Pen.Color = CommonDialog1.Color
    Label1.BackColor = CommonDialog1.Color
  End If
End Sub

Private Sub TChart1_OnColorLineToolDragLine()
  If TChart1.Tools.Items(0).asColorLine.clicked(MouseX, MouseY) Then
    Label3.Caption = Str$(FormatNumber(TChart1.Tools.Items(0).asColorLine.Value, 2))
  End If
  
  If TChart1.Tools.Items(1).asColorLine.clicked(MouseX, MouseY) Then
    Label3.Caption = Str$(FormatNumber(TChart1.Tools.Items(1).asColorLine.Value, 2))
  End If
End Sub

Private Sub TChart1_OnColorLineToolEndDragLine()
  Label3.Caption = ""
End Sub

Private Sub TChart1_OnMouseMove(ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
  MouseX = X
  MouseY = Y
End Sub
