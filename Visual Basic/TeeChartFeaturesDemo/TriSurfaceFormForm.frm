VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form TriSurfaceFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2970
   ClientTop       =   2055
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5505
      Left            =   0
      TabIndex        =   0
      Top             =   1410
      Width           =   11505
      Base64          =   $"TriSurfaceFormForm.frx":0000
   End
   Begin VB.TextBox Text3 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   195
      Left            =   2955
      TabIndex        =   5
      Top             =   1065
      Width           =   195
   End
   Begin VB.TextBox Text2 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   195
      Left            =   1320
      TabIndex        =   4
      Top             =   1065
      Width           =   195
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Border"
      Height          =   345
      Left            =   1740
      TabIndex        =   3
      Top             =   990
      Width           =   1515
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Pen"
      Height          =   345
      Left            =   120
      TabIndex        =   2
      Top             =   990
      Width           =   1515
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "TriSurfaceFormForm.frx":034C
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "TriSurfaceFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  With TChart1.Series(0).asTriSurface
    PenColor = .Pen.Color
    PenStyle = .Pen.Style
    PenVisible = .Pen.Visible
    PenWidth = .Pen.Width
    PenForm.Show vbModal
    If PenCancel = False Then
      .Pen.Color = PenColor
      .Pen.Style = PenStyle
      .Pen.Visible = PenVisible
      .Pen.Width = PenWidth
      Text2.BackColor = PenColor
    End If
  End With
End Sub

Private Sub Command2_Click()
  With TChart1.Series(0).asTriSurface
    PenColor = .Border.Color
    PenStyle = .Border.Style
    PenVisible = .Border.Visible
    PenWidth = .Border.Width
    PenForm.Show vbModal
    If PenCancel = False Then
      .Border.Color = PenColor
      .Border.Style = PenStyle
      .Border.Visible = PenVisible
      .Border.Width = PenWidth
      Text3.BackColor = PenColor
    End If
  End With
End Sub

Private Sub Form_Load()
  With TChart1.Series(0)
    .FillSampleValues 30
    Text2.BackColor = .asTriSurface.Pen.Color
    Text3.BackColor = .asTriSurface.Border.Color
  End With
End Sub
