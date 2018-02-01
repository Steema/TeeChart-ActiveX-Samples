VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2014.ocx"
Begin VB.Form Form1 
   Caption         =   "TeeChart Paging"
   ClientHeight    =   6690
   ClientLeft      =   2010
   ClientTop       =   1470
   ClientWidth     =   6120
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   6690
   ScaleWidth      =   6120
   Begin TeeChart.TChart TChart1 
      Height          =   3855
      Left            =   60
      OleObjectBlob   =   "PageForm1.frx":0000
      TabIndex        =   1
      Top             =   60
      Width           =   6015
   End
   Begin VB.Frame Frame2 
      Caption         =   "Moving average"
      Height          =   2295
      Left            =   3480
      TabIndex        =   13
      Top             =   3960
      Width           =   2655
      Begin VB.HScrollBar HScroll2 
         Height          =   375
         Left            =   135
         Max             =   50
         Min             =   1
         TabIndex        =   14
         Top             =   270
         Value           =   1
         Width           =   2295
      End
      Begin VB.Label Label12 
         Height          =   255
         Left            =   975
         TabIndex        =   20
         Top             =   1590
         Width           =   375
      End
      Begin VB.Label Label11 
         BackStyle       =   0  'Transparent
         Caption         =   "points"
         Height          =   255
         Left            =   1350
         TabIndex        =   19
         Top             =   1590
         Width           =   615
      End
      Begin VB.Label Label10 
         BackStyle       =   0  'Transparent
         Caption         =   "preceding"
         Height          =   255
         Left            =   135
         TabIndex        =   18
         Top             =   1590
         Width           =   855
      End
      Begin VB.Label Label9 
         BackStyle       =   0  'Transparent
         Caption         =   "Calculated with the actual and"
         Height          =   495
         Left            =   135
         TabIndex        =   17
         Top             =   1350
         Width           =   2295
      End
      Begin VB.Label Label8 
         BackStyle       =   0  'Transparent
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
         Left            =   975
         TabIndex        =   16
         Top             =   750
         Width           =   495
      End
      Begin VB.Label Label7 
         BackStyle       =   0  'Transparent
         Caption         =   "Period:"
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
         Left            =   135
         TabIndex        =   15
         Top             =   750
         Width           =   735
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Paging"
      Height          =   2295
      Left            =   0
      TabIndex        =   2
      Top             =   3960
      Width           =   3375
      Begin VB.CommandButton Command4 
         Caption         =   "<<"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   8
         Top             =   285
         Width           =   615
      End
      Begin VB.CommandButton Command2 
         Caption         =   "<"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   840
         TabIndex        =   7
         Top             =   285
         Width           =   735
      End
      Begin VB.CommandButton Command3 
         Caption         =   ">"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1680
         TabIndex        =   6
         Top             =   285
         Width           =   735
      End
      Begin VB.CommandButton Command5 
         Caption         =   ">>"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2520
         TabIndex        =   5
         Top             =   285
         Width           =   615
      End
      Begin VB.HScrollBar HScroll1 
         Height          =   375
         Left            =   120
         Max             =   50
         Min             =   1
         TabIndex        =   4
         Top             =   1125
         Value           =   1
         Width           =   3015
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Scale last page"
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   1965
         Width           =   1575
      End
      Begin VB.Label Label3 
         Caption         =   "Page"
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
         Left            =   120
         TabIndex        =   12
         Top             =   765
         Width           =   615
      End
      Begin VB.Label Label4 
         Caption         =   "1"
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
         Left            =   840
         TabIndex        =   11
         Top             =   765
         Width           =   1215
      End
      Begin VB.Label Label1 
         Caption         =   "MaxPointsPerPage = "
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
         Left            =   120
         TabIndex        =   10
         Top             =   1605
         Width           =   2295
      End
      Begin VB.Label Label2 
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
         Left            =   2400
         TabIndex        =   9
         Top             =   1605
         Width           =   495
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Chart Editor"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   0
      TabIndex        =   0
      Top             =   6320
      Width           =   6135
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
'Toggles re-scaling of the last page to
'best-fit remaing Series points
  If Check1.Value = 1 Then
     TChart1.Page.ScaleLastPage = True
  Else
     TChart1.Page.ScaleLastPage = False
  End If
End Sub

Private Sub Command1_Click()
  TChart1.ShowEditor
  HScroll1.Value = TChart1.Page.MaxPointsPerPage
  Label4.Caption = Str$(TChart1.Page.Current)
End Sub

Private Sub Command2_Click()
  TChart1.Page.Previous
End Sub


Private Sub Command3_Click()
  TChart1.Page.Next
End Sub

Private Sub Command4_Click()
  TChart1.Page.Current = 0
End Sub

Private Sub Command5_Click()
  With TChart1
   .Page.Current = .Page.Count
  End With
End Sub


Private Sub Command6_Click()
  TChart1.Series(1).FunctionType.Period = 3
End Sub

Private Sub Form_Load()
  HScroll1.Value = 10
  Label2.Caption = "10"
  Label8.Caption = "1"
  Label12.Caption = "1"
  TChart1.Series(0).FillSampleValues (200)
  TChart1.Page.MaxPointsPerPage = 10
  TChart1_OnPageChange
  Check1.Value = 0
  TChart1.Panel.Gradient.Visible = TChart1.Canvas.IsScreenHighColor
End Sub

Private Sub HScroll1_Change()
  TChart1.Page.MaxPointsPerPage = HScroll1.Value
  Label2.Caption = Str$(HScroll1.Value)
  TChart1_OnPageChange
End Sub


Private Sub HScroll2_Change()
  TChart1.Series(1).FunctionType.Period = HScroll2.Value
  Label8.Caption = Str$(HScroll2.Value)
  Label12.Caption = Str$(HScroll2.Value)
End Sub

Private Sub TChart1_OnPageChange()
  Label4.Caption = Str$(TChart1.Page.Current) + " of " + Str$(TChart1.Page.Count)
End Sub




