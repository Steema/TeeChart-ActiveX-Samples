VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_DrawLineAddLine 
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
   Begin VB.TextBox Text5 
      Height          =   285
      Left            =   2640
      TabIndex        =   10
      Text            =   "0"
      Top             =   1245
      Width           =   375
   End
   Begin VB.TextBox Text4 
      Height          =   285
      Left            =   1920
      TabIndex        =   9
      Text            =   "0"
      Top             =   1245
      Width           =   375
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   1200
      TabIndex        =   8
      Text            =   "0"
      Top             =   1245
      Width           =   375
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   480
      TabIndex        =   7
      Text            =   "0"
      Top             =   1245
      Width           =   375
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Add Line"
      Height          =   345
      Left            =   3240
      TabIndex        =   2
      Top             =   1230
      Width           =   1095
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   1
      Top             =   1650
      Width           =   11505
      Base64          =   $"Tool_DrawLineAddLine.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_DrawLineAddLine.frx":03CC
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Y1:"
      Height          =   195
      Left            =   2400
      TabIndex        =   6
      Top             =   1275
      Width           =   240
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "X1:"
      Height          =   195
      Left            =   1680
      TabIndex        =   5
      Top             =   1275
      Width           =   240
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Y0:"
      Height          =   195
      Left            =   960
      TabIndex        =   4
      Top             =   1275
      Width           =   240
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "X0:"
      Height          =   195
      Left            =   240
      TabIndex        =   3
      Top             =   1275
      Width           =   240
   End
End
Attribute VB_Name = "Tool_DrawLineAddLine"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Dim X0, X1, Y0, Y1 As Double

  X0 = Format(Text2.Text)
  Y0 = Format(Text3.Text)
  X1 = Format(Text4.Text)
  Y1 = Format(Text5.Text)

  TChart1.Tools.Items(0).asDrawLine.AddLine X0, Y0, X1, Y1
End Sub

Private Sub Form_Load()
  TChart1.Tools.Add tcDrawLine
  
  With TChart1.Tools.Items(0).asDrawLine
    .Series = TChart1.Series(0)
    .AddLine 1, 100, 4, 100
    .EnableDraw = False
    .Pen.Color = RGB(0, 0, 128)
  End With
  
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
