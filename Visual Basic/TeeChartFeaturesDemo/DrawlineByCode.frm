VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form DrawlineByCode 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3315
   ClientTop       =   2790
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5115
      Left            =   0
      TabIndex        =   0
      Top             =   1800
      Width           =   11505
      Base64          =   $"DrawlineByCode.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Add Line"
      Height          =   345
      Left            =   3240
      TabIndex        =   10
      Top             =   1170
      Width           =   1155
   End
   Begin VB.TextBox Text5 
      Enabled         =   0   'False
      Height          =   315
      Left            =   2160
      TabIndex        =   7
      Text            =   "Text3"
      Top             =   1350
      Width           =   555
   End
   Begin VB.TextBox Text4 
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "0"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   3082
         SubFormatType   =   1
      EndProperty
      Enabled         =   0   'False
      Height          =   315
      Left            =   2160
      TabIndex        =   6
      Text            =   "Text2"
      Top             =   990
      Width           =   555
   End
   Begin VB.TextBox Text3 
      Enabled         =   0   'False
      Height          =   315
      Left            =   660
      TabIndex        =   3
      Text            =   "Text3"
      Top             =   1350
      Width           =   555
   End
   Begin VB.TextBox Text2 
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "0"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   3082
         SubFormatType   =   1
      EndProperty
      Enabled         =   0   'False
      Height          =   315
      Left            =   660
      TabIndex        =   2
      Text            =   "Text2"
      Top             =   990
      Width           =   555
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "DrawlineByCode.frx":061A
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "0"
      Height          =   195
      Left            =   5880
      TabIndex        =   12
      Top             =   1230
      Width           =   90
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "Line count:"
      Height          =   195
      Left            =   4860
      TabIndex        =   11
      Top             =   1230
      Width           =   795
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "EndY:"
      Height          =   195
      Left            =   1560
      TabIndex        =   9
      Top             =   1410
      Width           =   435
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "EndX:"
      Height          =   195
      Left            =   1560
      TabIndex        =   8
      Top             =   1050
      Width           =   435
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "StartY:"
      Height          =   195
      Left            =   60
      TabIndex        =   5
      Top             =   1410
      Width           =   480
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "StartX:"
      Height          =   195
      Left            =   60
      TabIndex        =   4
      Top             =   1050
      Width           =   480
   End
End
Attribute VB_Name = "DrawlineByCode"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()

On Error GoTo Errormsg
  With TChart1.Tools.Items(0).asDrawLine
    .AddLine (Text2.Text), _
             (Text3.Text), _
             (Text4.Text), _
             (Text5.Text)
    Label6.Caption = .Lines.Count
    Text2.Enabled = True
    Text3.Enabled = True
    Text4.Enabled = True
    Text5.Enabled = True
  End With
  Exit Sub
Errormsg:
  MsgBox ("Please check that you have entered numeric values")
End Sub

Private Sub Form_Load()
Dim Xmin, Xmax, Ymin, Ymax
  With TChart1
    .Series(0).FillSampleValues 20
    .Environment.InternalRepaint
    Xmin = .Axis.Bottom.Minimum
    Xmax = .Axis.Bottom.Maximum
    Ymin = .Axis.Left.Minimum
    Ymax = .Axis.Left.Maximum
    Text2.Text = Format(Xmin + ((Xmax - Xmin) / 3), "#.00")
    Text3.Text = Format(Ymin + ((Ymax - Ymin) / 3), "#.00")
    Text4.Text = Format(Xmin + ((Xmax - Xmin) / 3 * 2), "#.00")
    Text5.Text = Format(Ymin + ((Ymax - Ymin) / 3 * 2), "#.00")
  End With
End Sub
