VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_SeriesRegion 
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
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   375
      Left            =   420
      TabIndex        =   12
      Top             =   570
      Width           =   945
   End
   Begin VB.VScrollBar VScroll4 
      Height          =   285
      Left            =   2760
      Max             =   0
      Min             =   24
      TabIndex        =   11
      Top             =   600
      Width           =   255
   End
   Begin VB.TextBox Text5 
      Height          =   285
      Left            =   2280
      TabIndex        =   10
      Text            =   "0"
      Top             =   600
      Width           =   495
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Draw Behind"
      Height          =   195
      Left            =   7320
      TabIndex        =   8
      Top             =   630
      Value           =   1  'Checked
      Width           =   1215
   End
   Begin VB.VScrollBar VScroll3 
      Height          =   285
      Left            =   6480
      Max             =   0
      Min             =   250
      TabIndex        =   7
      Top             =   600
      Value           =   250
      Width           =   255
   End
   Begin VB.TextBox Text4 
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "0"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1027
         SubFormatType   =   1
      EndProperty
      Height          =   285
      Left            =   6000
      TabIndex        =   6
      Text            =   "250"
      Top             =   600
      Width           =   495
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Use origin"
      Height          =   195
      Left            =   4800
      TabIndex        =   5
      Top             =   630
      Value           =   1  'Checked
      Width           =   1095
   End
   Begin VB.VScrollBar VScroll2 
      Height          =   285
      Left            =   4320
      Max             =   0
      Min             =   24
      TabIndex        =   4
      Top             =   600
      Width           =   255
   End
   Begin VB.TextBox Text3 
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "0"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1027
         SubFormatType   =   1
      EndProperty
      Height          =   285
      Left            =   3840
      TabIndex        =   3
      Text            =   "24"
      Top             =   600
      Width           =   495
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5925
      Left            =   0
      TabIndex        =   1
      Top             =   990
      Width           =   11505
      Base64          =   $"Tool_SeriesRegion.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   495
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_SeriesRegion.frx":03D0
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Lower:"
      Height          =   195
      Left            =   1680
      TabIndex        =   9
      Top             =   630
      Width           =   480
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Upper:"
      Height          =   195
      Left            =   3240
      TabIndex        =   2
      Top             =   630
      Width           =   480
   End
End
Attribute VB_Name = "Tool_SeriesRegion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check2_Click()
  TChart1.Tools.Items(0).asSeriesRegion.DrawBehind = Check2.Value
End Sub

Private Sub Command1_Click()
  TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Form_Load()
  
  TChart1.Tools.Add tcSeriesRegion
  
  With TChart1.Tools.Items(0).asSeriesRegion
    .Series = TChart1.Series(0)
    
    .AutoBounds = False
    .LowerBound = val(Text5.Text)
    .UpperBound = val(Text3.Text)
      
    .DrawBehind = Check2.Value
    
    .UseOrigin = Check1.Value
    .Origin = val(Text4.Text)
    
    .Gradient.Visible = True
  End With
  
  VScroll2.Value = val(Text3.Text)
  VScroll3.Value = val(Text4.Text)
  VScroll3.Min = TChart1.Series(0).YValues.Maximum
  
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text3_Change()
  Text3_Confirm
End Sub

Private Sub Text3_Confirm()
  If Not IsNumeric(Text3.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Upper"
  Else
    If (val(Text3.Text) > TChart1.Series(0).Count - 1 Or val(Text3.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and " + Str(TChart1.Series(0).Count - 1), , "Upper"
    Else
      TChart1.Tools.Items(0).asSeriesRegion.UpperBound = val(Text3.Text)
      VScroll2.Value = val(Text3.Text)
    End If
  End If
End Sub

Private Sub VScroll2_Change()
  VScroll2_Scroll
End Sub

Private Sub VScroll2_Scroll()
  Text3.Text = Str$(VScroll2.Value)
  Text3_Confirm
End Sub

Private Sub Text4_Change()
  Text4_Confirm
End Sub

Private Sub Text4_Confirm()
  If Not IsNumeric(Text4.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Origin"
  Else
    TChart1.Tools.Items(0).asSeriesRegion.Origin = val(Text4.Text)
    VScroll3.Value = val(Text4.Text)
  End If
End Sub

Private Sub VScroll3_Change()
  VScroll3_Scroll
End Sub

Private Sub VScroll3_Scroll()
  Text4.Text = Str$(VScroll3.Value)
  Text4_Confirm
End Sub

Private Sub Text5_Change()
  Text5_Confirm
End Sub

Private Sub Text5_Confirm()
  If Not IsNumeric(Text5.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Lower"
  Else
    If (val(Text5.Text) > TChart1.Series(0).Count - 1 Or val(Text5.Text) < 0) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and " + Str(TChart1.Series(0).Count - 1), , "Lower"
    Else
      TChart1.Tools.Items(0).asSeriesRegion.LowerBound = val(Text5.Text)
      VScroll4.Value = val(Text5.Text)
    End If
  End If
End Sub

Private Sub VScroll4_Change()
  VScroll4_Scroll
End Sub

Private Sub VScroll4_Scroll()
  Text5.Text = Str$(VScroll4.Value)
  Text5_Confirm
End Sub

Private Sub Check1_Click()
  Text4.Enabled = Check1.Value
  TChart1.Tools.Items(0).asSeriesRegion.UseOrigin = Check1.Value
End Sub
