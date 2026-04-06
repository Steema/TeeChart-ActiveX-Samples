VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2026.ocx"
Begin VB.Form SeriesType_Sankey 
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
   Begin VB.CommandButton Command3 
      Caption         =   "Data 1"
      Height          =   375
      Left            =   1680
      TabIndex        =   5
      Top             =   1200
      Width           =   1455
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Highlight Node"
      Height          =   375
      Left            =   5640
      TabIndex        =   4
      Top             =   1200
      Width           =   1815
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Data 2"
      Height          =   375
      Left            =   3120
      TabIndex        =   3
      Top             =   1200
      Width           =   1455
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1620
      Width           =   11505
      Base64          =   $"SeriesType_Sankey.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "SeriesType_Sankey.frx":00D8
      Top             =   0
      Width           =   11490
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit"
      Height          =   345
      Left            =   0
      TabIndex        =   1
      Top             =   1230
      Width           =   1515
   End
End
Attribute VB_Name = "SeriesType_Sankey"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
    setHighlighting (Check1.Value)
End Sub

Private Sub Command1_Click()
 TChart1.ShowEditor 0
End Sub


Private Sub Command2_Click()

  With TChart1
    .Series(0).Clear
    .Series(0).asSankey.Add "A1", "B1", 8
    .Series(0).asSankey.Add "A2", "B2", 4
    .Series(0).asSankey.Add "A1", "B2", 2
    .Series(0).asSankey.Add "B1", "C1", 8
    .Series(0).asSankey.Add "B2", "C1", 4
    .Series(0).asSankey.Add "B2", "C2", 2
  End With
End Sub

Private Sub Command3_Click()
    With TChart1
        .Series(0).Clear
          .Series(0).asSankey.Add "Agricultural 'waste'", "Bio-conversion", 124.729
          .Series(0).asSankey.Add "Bio-conversion", "Liquid", 0.597
          .Series(0).asSankey.Add "Bio-conversion", "Losses", 26.862
          .Series(0).asSankey.Add "Bio-conversion", "Solid", 280.322
          .Series(0).asSankey.Add "Bio-conversion", "Gas", 81.144
          .Series(0).asSankey.Add "Biofuel imports", "Liquid", 35
          .Series(0).asSankey.Add "Biomass imports", "Solid", 35
          .Series(0).asSankey.Add "Coal imports", "Coal", 11.606
          .Series(0).asSankey.Add "Coal reserves", "Coal", 63.965
          .Series(0).asSankey.Add "Coal", "Solid", 75.571
          .Series(0).asSankey.Add "District heating", "Industry", 10.639
          .Series(0).asSankey.Add "District heating", "Heating and cooling - commercial", 22.505
          .Series(0).asSankey.Add "District heating", "Heating and cooling - homes", 46.184
          .Series(0).asSankey.Add "Electricity grid", "Over generation / exports", 104.453
          .Series(0).asSankey.Add "Electricity grid", "Heating and cooling - homes", 113.726
          .Series(0).asSankey.Add "Electricity grid", "H2 conversion", 27.14
          .Series(0).asSankey.Add "Electricity grid", "Industry", 342.165
          .Series(0).asSankey.Add "Electricity grid", "Road transport", 37.797
          .Series(0).asSankey.Add "Electricity grid", "Agriculture", 4.412
          .Series(0).asSankey.Add "Electricity grid", "Heating and cooling - commercial", 40.858
          .Series(0).asSankey.Add "Electricity grid", "Losses", 56.691
          .Series(0).asSankey.Add "Electricity grid", "Rail transport", 7.863
          .Series(0).asSankey.Add "Electricity grid", "Lighting & appliances - commercial", 90.008
          .Series(0).asSankey.Add "Electricity grid", "Lighting & appliances - homes", 93.494
          .Series(0).asSankey.Add "Gas imports", "Ngas", 40.719
          .Series(0).asSankey.Add "Gas reserves", "Ngas", 82.233
          .Series(0).asSankey.Add "Gas", "Heating and cooling - commercial", 0.129
          .Series(0).asSankey.Add "Gas", "Losses", 1.401
          .Series(0).asSankey.Add "Gas", "Thermal generation", 151.891
          .Series(0).asSankey.Add "Gas", "Agriculture", 2.096
          .Series(0).asSankey.Add "Gas", "Industry", 48.58
          .Series(0).asSankey.Add "Geothermal", "Electricity grid", 7.013
          .Series(0).asSankey.Add "H2 conversion", "H2", 20.897
          .Series(0).asSankey.Add "H2 conversion", "Losses", 6.242
          .Series(0).asSankey.Add "H2", "Road transport", 20.897
          .Series(0).asSankey.Add "Hydro", "Electricity grid", 6.995
          .Series(0).asSankey.Add "Liquid", "Industry", 121.066
          .Series(0).asSankey.Add "Liquid", "International shipping", 128.69
          .Series(0).asSankey.Add "Liquid", "Road transport", 135.835
          .Series(0).asSankey.Add "Liquid", "Domestic aviation", 14.458
          .Series(0).asSankey.Add "Liquid", "International aviation", 206.267
          .Series(0).asSankey.Add "Liquid", "Agriculture", 3.64
          .Series(0).asSankey.Add "Liquid", "National navigation", 33.218
          .Series(0).asSankey.Add "Liquid", "Rail transport", 4.413
          .Series(0).asSankey.Add "Marine algae", "Bio-conversion", 4.375
          .Series(0).asSankey.Add "Ngas", "Gas", 122.952
          .Series(0).asSankey.Add "Nuclear", "Thermal generation", 839.978
          .Series(0).asSankey.Add "Oil imports", "Oil", 504.287
          .Series(0).asSankey.Add "Oil reserves", "Oil", 107.703
          .Series(0).asSankey.Add "Oil", "Liquid", 611.99
          .Series(0).asSankey.Add "Other waste", "Solid", 56.587
          .Series(0).asSankey.Add "Other waste", "Bio-conversion", 77.81
          .Series(0).asSankey.Add "Pumped heat", "Heating and cooling - homes", 193.026
          .Series(0).asSankey.Add "Pumped heat", "Heating and cooling - commercial", 70.672
          .Series(0).asSankey.Add "Solar PV", "Electricity grid", 59.901
          .Series(0).asSankey.Add "Solar Thermal", "Heating and cooling - homes", 19.263
          .Series(0).asSankey.Add "Solar", "Solar Thermal", 19.263
          .Series(0).asSankey.Add "Solar", "Solar PV", 59.901
          .Series(0).asSankey.Add "Solid", "Agriculture", 0.882
          .Series(0).asSankey.Add "Solid", "Thermal generation", 400.12
          .Series(0).asSankey.Add "Solid", "Industry", 46.477
          .Series(0).asSankey.Add "Thermal generation", "Electricity grid", 525.531
          .Series(0).asSankey.Add "Thermal generation", "Losses", 787.129
          .Series(0).asSankey.Add "Thermal generation", "District heating", 79.329
          .Series(0).asSankey.Add "Tidal", "Electricity grid", 9.452
          .Series(0).asSankey.Add "UK land based bioenergy", "Bio-conversion", 182.01
          .Series(0).asSankey.Add "Wave", "Electricity grid", 19.013
          .Series(0).asSankey.Add "Wind", "Electricity grid", 289.36
    End With
End Sub

Private Sub Form_Load()
Dim Counter
Counter = 0

  With TChart1
    .Aspect.View3D = False
    .RemoveAllSeries
    .Legend.Visible = False
    .AddSeries scSankey
    
    Command3_Click
    
            
    .Series(0).asSankey.NodeFont.Size = 8
            
    .Panel.MarginTop = 0
    .Panel.MarginBottom = 3
    .Panel.MarginLeft = 10
    .Panel.MarginRight = 10

    .Series(0).asSankey.LinkCurvature = 0.7  ' 0.95F
    .Series(0).asSankey.FlowDirection = EFlowDirection.fdLeftToRight
    .Series(0).asSankey.FirstAndLastLabelPosition = flpInward
  End With
End Sub

Private Sub setHighlighting(Active)
    TChart1.Series(0).asSankey.HighlightBrush.Color = vbGreen
    TChart1.Series(0).asSankey.Highlighting = Active
    TChart1.Series(0).asSankey.HighlightMode = hmMouseClick
    TChart1.Series(0).asSankey.UsePalette = LinksOnly
End Sub
                                        


