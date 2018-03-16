VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "Date Time axis labels example"
   ClientHeight    =   5835
   ClientLeft      =   2175
   ClientTop       =   2670
   ClientWidth     =   8760
   LinkTopic       =   "Form1"
   ScaleHeight     =   5835
   ScaleWidth      =   8760
   Begin TeeChart.TChart TChart1 
      Height          =   4635
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   8655
      Base64          =   $"Form DateTime.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Multiline"
      Height          =   330
      Left            =   5145
      TabIndex        =   7
      Top             =   4800
      Width           =   990
   End
   Begin VB.TextBox Text2 
      Height          =   330
      Left            =   6165
      MaxLength       =   1
      TabIndex        =   6
      Top             =   4800
      Width           =   240
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Help..."
      Height          =   315
      Left            =   4200
      TabIndex        =   5
      Top             =   4800
      Width           =   735
   End
   Begin VB.TextBox Text1 
      Height          =   315
      Left            =   2280
      TabIndex        =   4
      Text            =   "mmm-yyyy"
      Top             =   4800
      Width           =   1815
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Close"
      Height          =   375
      Left            =   7320
      TabIndex        =   2
      Top             =   5415
      Width           =   1395
   End
   Begin VB.Label Label3 
      Caption         =   "Line break symbol (converts to space)"
      Height          =   450
      Left            =   6435
      TabIndex        =   8
      Top             =   4770
      Width           =   1605
   End
   Begin VB.Label Label2 
      Caption         =   "Date && Time Format:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   60
      TabIndex        =   3
      Top             =   4800
      Width           =   2175
   End
   Begin VB.Label Label1 
      Caption         =   "Drag from Top/Left to Right/Bottom to zoom. Drag with right mouse button to scroll."
      Height          =   255
      Left            =   60
      TabIndex        =   1
      Top             =   5415
      Width           =   6255
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  CheckLineBreaks
End Sub
Sub CheckLineBreaks()
Dim newstring, charpos
With TChart1.Axis.Bottom
  If Check1.Value Then
    If Text2.Text = "" Then
      MsgBox ("Please put a character to be used for the newline separator in the 'Label break symbol' box")
      Exit Sub
    End If
    newstring = Text1.Text
    charpos = InStr(1, newstring, Text2.Text)
    If Text2.Text <> " " Then
      While charpos
        Mid(newstring, charpos) = " "
        charpos = InStr(1, newstring, Text2.Text)
      Wend
    End If
    .Labels.DateTimeFormat = newstring
    .Labels.MultiLine = True
  Else
    .Labels.DateTimeFormat = Text1.Text
    .Labels.MultiLine = False
  End If
End With
End Sub
Private Sub Command1_Click()
  End
End Sub

Private Sub Command2_Click()
  Form2.Show
End Sub

Private Sub Form_Load()
 ' add 1000 sample date-time points...
 With TChart1.Series(0)
   .Clear
   .XValues.DateTime = True
   For t = 1 To 1000
     .AddXY Now + t / 4, Rnd(1000), "", clTeeColor
   Next
 End With
 'set bottom axis to date-time, showing one label per month...
 With TChart1.Axis.Bottom
   .Increment = TChart1.GetDateTimeStep(dtOneMonth)
   .Labels.DateTimeFormat = "mmm-yyyy"
 End With
 Text2.Text = "-"
End Sub

Private Sub Text1_Change()
 'TChart1.Axis.Bottom.Labels.DateTimeFormat = Text1.Text
 CheckLineBreaks
End Sub

Private Sub Text2_Change()
 CheckLineBreaks
End Sub




