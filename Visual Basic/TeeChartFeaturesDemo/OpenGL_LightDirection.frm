VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form OpenGL_LightDirection 
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
   Begin VB.CheckBox CheckBox1 
      Caption         =   "Default"
      Height          =   285
      Left            =   930
      TabIndex        =   14
      Top             =   4560
      Width           =   975
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      LargeChange     =   5
      Left            =   570
      Max             =   0
      Min             =   90
      SmallChange     =   5
      TabIndex        =   13
      Top             =   4560
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   120
      TabIndex        =   12
      Text            =   "50"
      Top             =   4560
      Width           =   435
   End
   Begin VB.HScrollBar HScroll3 
      Height          =   255
      Left            =   450
      Max             =   500
      Min             =   -500
      TabIndex        =   11
      Top             =   3960
      Width           =   1365
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   450
      Max             =   500
      Min             =   -500
      TabIndex        =   9
      Top             =   3090
      Width           =   1365
   End
   Begin VB.Frame Frame1 
      Caption         =   "Direction"
      Height          =   1605
      Left            =   120
      TabIndex        =   5
      Top             =   2760
      Width           =   1845
      Begin VB.HScrollBar HScroll2 
         Height          =   255
         Left            =   330
         Max             =   500
         Min             =   -500
         TabIndex        =   10
         Top             =   750
         Width           =   1365
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "Z:"
         Height          =   195
         Left            =   120
         TabIndex        =   8
         Top             =   1230
         Width           =   150
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "Y:"
         Height          =   195
         Left            =   120
         TabIndex        =   7
         Top             =   780
         Width           =   150
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "X:"
         Height          =   195
         Left            =   120
         TabIndex        =   6
         Top             =   360
         Width           =   150
      End
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "OpenGL_LightDirection.frx":0000
      Left            =   630
      List            =   "OpenGL_LightDirection.frx":000D
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   2040
      Width           =   1035
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   435
      Left            =   150
      TabIndex        =   2
      Top             =   1320
      Width           =   1065
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5775
      Left            =   2040
      TabIndex        =   1
      Top             =   1110
      Width           =   9435
      Base64          =   $"OpenGL_LightDirection.frx":0028
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "OpenGL_LightDirection.frx":09F0
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Light:"
      Height          =   195
      Left            =   150
      TabIndex        =   4
      Top             =   2100
      Width           =   390
   End
End
Attribute VB_Name = "OpenGL_LightDirection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CheckBox1_Click()
  With TChart1.Aspect.OpenGL
    If CheckBox1.Value = 1 Then
      Text2.Enabled = False
      VScroll1.Enabled = False
      HScroll1.Enabled = False
      HScroll2.Enabled = False
      HScroll3.Enabled = False
      
      Text2.Text = Str$(180)
    Else
      Text2.Enabled = True
      VScroll1.Enabled = True
      HScroll1.Enabled = True
      HScroll2.Enabled = True
      HScroll3.Enabled = True
            
      Text2.Text = Str$(50)
    End If
  End With
End Sub

Private Sub Combo1_Change()
  With TChart1.Aspect.OpenGL
    Select Case Combo1.ListIndex
      Case 0:
        HScroll1.Value = .Light.Direction.X
        HScroll2.Value = .Light.Direction.Y
        HScroll3.Value = .Light.Direction.z
        
        Text2.Text = Str$(.Light.SpotDegrees)
        If .Light.SpotDegrees = 180 Then
          CheckBox1.Value = 1
        Else
          CheckBox1.Value = 0
        End If
      Case 1:
        HScroll1.Value = .Light1.Direction.X
        HScroll2.Value = .Light1.Direction.Y
        HScroll3.Value = .Light1.Direction.z
        
        Text2.Text = Str$(.Light1.SpotDegrees)
        If .Light1.SpotDegrees = 180 Then
          CheckBox1.Value = 1
        Else
          CheckBox1.Value = 0
        End If
      Case 2:
        HScroll1.Value = .Light2.Direction.X
        HScroll2.Value = .Light2.Direction.Y
        HScroll3.Value = .Light2.Direction.z
        
        Text2.Text = Str$(.Light2.SpotDegrees)
        If .Light2.SpotDegrees = 180 Then
          CheckBox1.Value = 1
        Else
          CheckBox1.Value = 0
        End If
    End Select
  End With
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Command1_Click()
  TChart1.Aspect.OpenGL.ShowEditor
End Sub

Private Sub Form_Load()
  With TChart1.Aspect.OpenGL
    .Active = True
    .Light.Visible = True
    .Light1.Visible = True
    .Light2.Visible = True

    .Light.Color = RGB(57, 57, 57)
    .Light.Direction.X = 296
    .Light.Direction.Y = 61
    .Light.Direction.z = 163
    .Light.FixedPosition = True
    .Light.Position.X = -51
    .Light.Position.Y = 122
    .Light.Position.z = 439
    .Light.SpotDegrees = 50
    .Light.UseDirection = True

    .Light1.Color = RGB(53, 53, 53)
    .Light1.Direction.z = -1
    .Light1.FixedPosition = True
    .Light1.Position.X = -255
    .Light1.Position.Y = -500
    .Light1.Position.z = 500
    .Light1.SpotDegrees = 180
    .Light1.UseDirection = True

    .Light2.Color = RGB(19, 19, 19)
    .Light2.Direction.z = -1
    .Light2.FixedPosition = True
    .Light2.Position.X = -143
    .Light2.Position.Y = 327
    .Light2.Position.z = 500
    .Light2.SpotDegrees = 180
    .Light2.UseDirection = True
    
    .Shininess = 0.6
  End With
  
  Combo1.ListIndex = 0
End Sub

Private Sub HScroll1_Change()
  With TChart1.Aspect.OpenGL
    Select Case Combo1.ListIndex
      Case 0:
        .Light.Direction.X = HScroll1.Value
      Case 1:
        .Light1.Direction.X = HScroll1.Value
      Case 2:
        .Light2.Direction.X = HScroll1.Value
    End Select
  End With
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub

Private Sub HScroll2_Change()
  With TChart1.Aspect.OpenGL
    Select Case Combo1.ListIndex
      Case 0:
        .Light.Direction.Y = HScroll2.Value
      Case 1:
        .Light1.Direction.Y = HScroll2.Value
      Case 2:
        .Light2.Direction.Y = HScroll2.Value
    End Select
  End With
End Sub

Private Sub HScroll2_Scroll()
  HScroll2_Change
End Sub

Private Sub HScroll3_Change()
  With TChart1.Aspect.OpenGL
    Select Case Combo1.ListIndex
      Case 0:
        .Light.Direction.z = HScroll3.Value
      Case 1:
        .Light1.Direction.z = HScroll3.Value
      Case 2:
        .Light2.Direction.z = HScroll3.Value
    End Select
  End With
End Sub

Private Sub HScroll3_Scroll()
  HScroll3_Change
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  Text2_Confirm
End Sub

Private Sub Text2_Confirm()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Spot degrees"
  Else
    If (val(Text2.Text) > 90 Or val(Text2.Text) < 0) And (val(Text2.Text) <> 180) Then
      KeepFocus = True
      MsgBox "Please insert a value between 0 and 90", , "Spot degrees"
    Else
      With TChart1.Aspect.OpenGL
        Select Case Combo1.ListIndex
          Case 0: .Light.SpotDegrees = val(Text2.Text)
          Case 1: .Light1.SpotDegrees = val(Text2.Text)
          Case 2: .Light2.SpotDegrees = val(Text2.Text)
        End Select
      End With
      If val(Text2.Text) <> 180 Then
        VScroll1.Value = val(Text2.Text)
      End If
    End If
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = Str$(VScroll1.Value)
  Text2_Confirm
End Sub
