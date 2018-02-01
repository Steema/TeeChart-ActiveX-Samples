VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Rose_Series 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6825
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6825
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Rose_Series.frx":0000
      Left            =   4800
      List            =   "Rose_Series.frx":000A
      Style           =   2  'Dropdown List
      TabIndex        =   6
      Top             =   1275
      Width           =   2055
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Circled"
      Height          =   255
      Left            =   2760
      TabIndex        =   4
      Top             =   1320
      Value           =   1  'Checked
      Width           =   1095
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Axes"
      Height          =   255
      Left            =   1800
      TabIndex        =   3
      Top             =   1320
      Value           =   1  'Checked
      Width           =   1095
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5115
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"Rose_Series.frx":001D
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Rose_Series.frx":00D5
      Top             =   0
      Width           =   11730
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit"
      Height          =   345
      Left            =   0
      TabIndex        =   1
      Top             =   1230
      Width           =   1515
   End
   Begin VB.Label Label1 
      Caption         =   "Stacked :"
      Height          =   255
      Left            =   3960
      TabIndex        =   5
      Top             =   1320
      Width           =   1455
   End
End
Attribute VB_Name = "Rose_Series"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Axis.Visible = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Series(0).asRose.Circled = Check2.Value
End Sub

Private Sub Combo1_Click()
If Combo1.ListIndex = 0 Then
   TChart1.Series(0).asRose.MultiRose = mrNone
Else
   TChart1.Series(0).asRose.MultiRose = mrStacked
End If
End Sub

Private Sub Command1_Click()
 TChart1.ShowEditor 0
End Sub

Private Sub Form_Load()
  With TChart1
    .Header.Visible = False
    .Aspect.View3D = False
    .AddSeries scRose
    .AddSeries scRose
    .AddSeries scRose
    .Series(0).FillSampleValues
    .Series(1).FillSampleValues
    .Series(2).FillSampleValues
    .Series(0).asRose.Circled = True
    .Axis.Visible = True
  End With
  Combo1.ListIndex = 0
End Sub
