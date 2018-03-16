VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "Operations with Series and Functions"
   ClientHeight    =   6465
   ClientLeft      =   2445
   ClientTop       =   1590
   ClientWidth     =   6030
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   6465
   ScaleWidth      =   6030
   Begin TeeChart.TChart TChart1 
      Height          =   3975
      Left            =   0
      OleObjectBlob   =   "SeriesForm.frx":0000
      TabIndex        =   0
      Top             =   480
      Width           =   6015
   End
   Begin VB.Frame Frame2 
      Height          =   1575
      Left            =   0
      TabIndex        =   10
      Top             =   4440
      Width           =   3135
      Begin VB.ComboBox ComboSeries 
         Height          =   315
         ItemData        =   "SeriesForm.frx":014C
         Left            =   600
         List            =   "SeriesForm.frx":018F
         TabIndex        =   11
         Top             =   765
         Width           =   1335
      End
      Begin VB.Label Label1 
         Caption         =   "Pick a Series type to Chart"
         Height          =   300
         Left            =   270
         TabIndex        =   12
         Top             =   480
         Width           =   1875
      End
   End
   Begin VB.Frame Frame1 
      Height          =   1575
      Left            =   3120
      TabIndex        =   3
      Top             =   4440
      Width           =   2895
      Begin VB.ComboBox ComboFunctions 
         Height          =   315
         ItemData        =   "SeriesForm.frx":0233
         Left            =   150
         List            =   "SeriesForm.frx":024C
         TabIndex        =   6
         Top             =   540
         Width           =   1275
      End
      Begin VB.CommandButton FunctionAdd 
         Caption         =   "ShowFunction"
         Height          =   300
         Left            =   1515
         TabIndex        =   5
         Top             =   540
         Width           =   1170
      End
      Begin VB.HScrollBar HScroll1 
         Height          =   285
         Left            =   135
         Max             =   10
         TabIndex        =   4
         Top             =   930
         Value           =   1
         Width           =   2550
      End
      Begin VB.Label Label2 
         Caption         =   "Add a function"
         Height          =   300
         Left            =   120
         TabIndex        =   9
         Top             =   240
         Width           =   1815
      End
      Begin VB.Label Label4 
         BackStyle       =   0  'Transparent
         Caption         =   "Function Period:"
         Height          =   240
         Left            =   150
         TabIndex        =   8
         Top             =   1305
         Width           =   1230
      End
      Begin VB.Label Label5 
         BackStyle       =   0  'Transparent
         Height          =   255
         Left            =   1320
         TabIndex        =   7
         Top             =   1305
         Width           =   735
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Show Chart Editor"
      Height          =   345
      Left            =   0
      TabIndex        =   1
      Top             =   6090
      Width           =   6015
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "Add / Remove Series and Functions"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   120
      TabIndex        =   2
      Top             =   30
      Width           =   5760
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub ComboSeries_Click()
  With TChart1
  'Look to see if there's already a Series in the Chart
  'Remove the existing Series
    .RemoveAllSeries
  'Add and randomly populate the new Series
  'eg. .AddSeries(scHorizBar) is the same as .AddSeries(2)
    .AddSeries (ComboSeries.ListIndex)
    .Series(0).FillSampleValues 15
  'Name the Series to visualise in the Chart Editor.
    .Series(0).Title = ComboSeries.List(ComboSeries.ListIndex) & "Series"
  'Modify the Chart Title
    .Header.Text(0) = .Series(0).Title
  End With
End Sub

Private Sub Command1_Click()
' show the Editor dialog...
  TChart1.ShowEditor
End Sub

Private Sub Form_Load()
' initialize comboboxes...
  ComboSeries.ListIndex = 0
  ComboFunctions.ListIndex = 0
  HScroll1.Value = 0
End Sub

Private Sub FunctionAdd_Click()
  With TChart1
  ' the function will create a second Series on the
  ' Chart. So, remove the second Series each time
  ' we click this button...
    If .SeriesCount > 1 Then
      .RemoveSeries (1)
    End If
    
  ' add a new Line Series to show the Function...
    .AddSeries (scLine)
    
  ' set the Function type (Add, Subtract, etc... )
    .Series(1).SetFunction (ComboFunctions.ListIndex + 1)
    
  ' set the Function Source (the first Series)...
    .Series(1).DataSource = .Series(0).Name
    
  ' change the Series title to be the Function name...
    .Series(1).Title = ComboFunctions.List(ComboFunctions.ListIndex) & "Function"
  End With
  HScroll1.Value = 0
End Sub

Private Sub HScroll1_Change()
' Change the Function "Period" property...
  If TChart1.SeriesCount > 1 Then
     TChart1.Series(1).FunctionType.Period = HScroll1.Value
     Label5.Caption = HScroll1.Value
  End If
End Sub




