<%
'=============================
' VBScript constants for use
' with TeeChart Pro AX v2018
'=============================

'== EAnnotationPosition
const ppLeftTop = 0 
const ppLeftBottom = 1
const ppRightTop = 2 
const ppRightBottom = 3
const ppCenter = 4

'== EArrowHeadStyle
const ahNone = 0
const ahLine = 1
const ahSolid = 2

'== EAxisArrowToolPosition
const aaStart = 0 
const aaEnd = 1 
const aaBoth = 2

'== EAxisLabelAlign
const alDefault = 0 
const alOpposite = 1

'== EAxisLabelStyle
const talAuto = 0
const talNone = 1
const talValue = 2
const talMark = 3
const talText = 4

'== EAxisType
const atLeft = 0
const atTop = 1
const atRight = 2
const atBottom = 3
const atDepth = 4
const atCustom = 5

'== EBackImageMode 
const pbmStretch = 0
const pbmTile = 1
const pbmCenter = 2
const pbmCustom = 3

'== EBarStyle
const bsRectangle = 0
const bsPyramid = 1
const bsInvPyramid = 2
const bsCilinder = 3
const bsEllipse = 4
const bsArrow = 5
const bsRectGradient = 6
const bsCone = 7
const bsBevel = 8
const bsSlantCube = 9
const bsDiamond = 10
const bsInvArrow = 11
const bsInvCone = 12

'== EBezierStyle
const bsWindows = 0
const bsBezier3 = 1
const bsBezier4 = 2

'== EBorderStyle
const bsNone = 0
const bsSingle = 1

'== EBrushStyle
const bsSolid = 0
const bsClear = 1
const bsHorizontal = 2
const bsVertical = 3
const bsFDiagonal = 4
const bsBDiagonal = 5
const bsCross = 6
const bsDiagCross = 7
const bsFill80 = 8
const bsFill60 = 9 
const bsFill40 = 10
const bsFill20 = 11
const bsFill10 = 12
const bsZigZag = 13
const bsVertSmall = 14 
const bsHorizSmall = 15
const bsDiagSmall = 16
const bsBackDiagSmall = 17
const bsCrossSmall = 18
const bsBackCrossSmall = 19

'== ECandleColorStyle
const cssRelativeToOpen = 0
const cssRelativeToClose = 1

'== ECandleStyle 
const csCandleStick = 0
const csCandleBar = 1
const csOpenClose = 2
const csLine = 3

'== ECanvas3DPlane
const cpX = 0
const cpY = 1
const cpZ = 2

'== ECanvasBackMode
const cbmNone = 0
const cbmTransparent = 1
const cbmOpaque = 2

'== ECanvasTextAlign
const ctaLeft = 0
const ctaCenter = 1
const ctaRight = 2

'== EChartGridShow
const cgsAuto = 0
const cgsNo = 1
const cgsYes = 2

'== EChartObjectShapeStyle
const fosRectangle = 0
const fosRoundRectangle = 1

'== EChartPenStyle
const psSolid = 0
const psDash = 1
const psDot = 2
const psDashDot = 3
const psDashDotDot = 4
const psClear = 5
const psInsideFrame = 6
const psSmallDots = 7

'== EChartScroll
const pmNone = 0	
const pmHorizontal = 1
const pmVertical = 2
const pmBoth = 3

'== EChartTheme
const ctDefault = 0
const ctExcel = 1
const ctClassic = 2
const ctBusiness = 3
const ctWeb = 4
const ctWindowsXP = 5
const ctBlueSky = 6
const ctFacts = 7

'== ECheckBoxesStyle
const cbsCheck = 0
const cbsRadio = 1

'== EColorLineStyle
const clCustom = 0 
const clMaximum = 1
const clCenter = 2 
const clMinimum = 3

'== EColorPalette
const cpTeeChart = 0
const cpExcel = 1
const cpVictorian = 2
const cpPastel = 3
const cpSolid = 4
const cpClassic = 5
const cpWeb = 6
const cpModern = 7
const cpRainbow = 8
const cpWindowsXP = 9
const cpDefault = 10
const cpMacOS = 11
const cpWinVista = 12

'== ECompressionPeriod
const ocDay = 0
const ocWeek = 1
const ocMonth = 2
const ocBiMonth = 3
const ocQuarter = 4
const ocYear = 5

'== EConstants
const clTeeColor = 536870912
const clNone = 536870911

'== ECursorToolStyle
const cssHorizontal = 0
const cssVertical = 1
const cssBoth = 2
const cssScope = 3

'== ECustomSeriesStack
const cssNone = 0 
const cssOverlap = 1 
const cssStack = 2 
const cssStack100 = 3

'== EDatasourceType
const dstAllRecords = 0 
const dstSingleRecord = 1

'== EDateTimeStep
const dtOneMicrosecond = 0
const dtOneMillisecond = 1
const dtOneSecond = 2
const dtFiveSeconds = 3
const dtTenSeconds = 4
const dtFifteenSeconds = 5
const dtThirtySeconds = 6
const dtOneMinute = 7
const dtFiveMinutes = 8
const dtTenMinutes = 9
const dtFifteenMinutes = 10
const dtThirtyMinutes = 11
const dtOneHour = 12
const dtTwoHours =13
const dtSixHours = 14
const dtTwelveHours = 15
const dtOneDay = 16
const dtTwoDays = 17
const dtThreeDays = 18
const dtOneWeek = 19
const dtHalfMonth = 20
const dtOneMonth = 21
const dtTwoMonths = 22
const dtThreeMonths =23 
const dtFourMonths = 24
const dtSixMonths = 25
const dtOneYear = 26
const dtNone = 27

'== EDeltaImageStyle
const disSmiles = 0
const disHands = 1

'== EDownSampleMethod
const dsDouglas = 0
const dsMax = 1
const dsMin = 2
const dsMinMax = 3
const dsAverage = 4

'== EDragMode
const dmManual = 0
const dmAutomatic = 1

'== EDragPointStyle
const dsX = 0
const dsY = 1
const dsBoth = 2

'== EDragState 
const dsDragEnter = 0
const dsDragLeave = 1
const dsDragMove = 2

'== EDrawLineStyle
const dlLine = 0
const dlHorizParallel = 1
const dlVertParallel = 2
const dlRectangle = 3
const dlEllipse = 4

'== EErrorSeriesStyle
const essLeft = 0
const essRight = 1
const essLeftRight = 2
const essTop = 3
const essBottom = 4
const essTopBottom = 5

'== EErrorWidthUnits 
const ewuPercent = 0
const ewuPixels= 1

'== EFaderStyle
const fsFadeIn = 0
const fsFadeOut = 1

'== EFilterClass
const fcConvolve = 0
const fcBlur = 1
const fcResize = 2
const fcCrop = 3
const fcInvert = 4
const fcGrayScale = 5
const fcFlip = 6
const fcReverse = 7
const fcAmount = 8
const fcMosaic = 9
const fcBrightness = 10
const fcContrast = 11
const fcColor = 12
const fcHueLumSat = 13
const fcSharpen = 14
const fcEmboss = 15
const fcSoften = 16
const fcGammaCorrection = 17
const fcRotate = 18
const fcMirror = 19
const fcTile = 20
const fcBevel = 21
const fcZoom = 22


'== EFunctionPeriodAlign
const paFirst = 0
const paCenter = 1
const paLast = 2

'== EFunctionPeriodStyle
const psNumPoints = 0
const psRange = 1

'== EFunctionType
const tfCopy = 0
const tfAdd = 1
const tfSubtract = 2
const tfMultiply = 3
const tfDivide = 4
const tfAverage = 5
const tfHigh = 6
const tfLow = 7
const tfMovavg = 8
const tfExpavg = 9
const tfMomentum = 10
const tfCurveFit = 11
const tfRSI = 12
const tfTrend = 13
const tfStdDeviation = 14
const tfCumulative = 15
const tfCount = 16
const tfExpTrend = 17
const tfExpMovAvg = 18
const tfMomentumDiv = 19
const tfRMS = 20
const tfMACD = 21
const tfStochastic = 22
const tfBollinger = 23
const tfADX = 24
const tfSmoothing = 25
const tfCustom = 26
const tfCompress = 27
const tfCrossPoints = 28
const tfCLV = 29
const tfOBV = 30
const tfCCI = 31
const tfPVO = 32
const tfPerformance = 33
const tfMode = 34
const tfMedian = 35
const tfCorrelation = 36
const tfVariance = 37
const tfPerimeter = 38
const tfDownSampleFun = 39
const tfSubset = 40
const tfHistogram = 41
const tfSAR = 42

'== EGanttToolPartBar
const pbStart = 0
const pbAll = 1
const pbEnd = 2

'== EGIFColorReduction
const rmNone = 0 
const rmWindows20 = 1 
const rmWindows256 = 2 
const rmWindowsGray = 3 
const rmMonochrome = 4 
const rmGrayScale = 5 
const rmNetscape = 6 
const rmQuantize = 7 
const rmQuantize256 = 8

'== EGIFCompression
const gcLZW = 0 
const gcRLE = 1

'== EGIFDitherMode
const dmNearest = 0 
const dmFloydSteinberg = 1 
const dmStucki = 2 
const dmSierra = 3 
const dmJaJuNI = 4 
const dmSteveArche = 5 
const dmBurkes = 6

'== EGradientDirection 
const gdTopBottom = 0
const gdBottomTop = 1
const gdLeftRight = 2
const gdRightLeft = 3
const gdFromCenter = 4
const gdFromTopLeft = 5
const gdFromBottomLeft = 6
const gdRadial = 7
const gdDiagonalUp = 8
const gdDiagonalDown = 9

'== EGrayMethod
const gmSimple = 0
const gmEye = 1
const gmEye2 = 2

'== EGroupFormula
const gfCount = 0
const gfSum = 1

'== EHandStyle
const hsLine = 0
const hsTriangle = 1

'== EHorizontalAxis
const aTopAxis = 0
const aBottomAxis = 1
const aBothHorizAxis = 2
const aCustomHorizAxis = 3

'== EJPEGPerformance
const jpegBestQuality = 0
const jpegBestSpeed = 1

'== ELegendAlignment
const laLeft = 0
const laRight = 1
const laTop = 2
const laBottom = 3

'== ELegendPaletteAxis
const laDefault = 0
const laOther = 1
const laBoth = 2

'== ELegendStyle
const lsAuto = 0
const lsSeries = 1
const lsValues = 2
const lsLastValues = 3
const lsSeriesGroups = 4

'== ELegendSymbolPosition
const spLeft = 0 
const spRight = 1

'== ELegendSymbolSize
const lcsPercent = 0 
const lcsPixels = 1

'== ELegendTextStyle
const ltsPlain = 0
const ltsLeftValue =1
const ltsRightValue =2
const ltsLeftPercent = 3
const ltsRightPercent = 4
const ltsXValue = 5
const ltsValue = 6
const ltsPercent = 7
const ltsXAndValue = 8
const ltsXAndPercent = 9

'== ELightStyle
const lsLinear = 0
const lsSpotLight = 1

'== ELoadMode
const lmClear = 0
const lmAppend = 1

'== EMarginUnits
const muPercent = 0 
const muPixels = 1

'== EMarkStyle
const smsValue = 0
const smsPercent = 1
const smsLabel = 2
const smsLabelPercent = 3
const smsLabelValue = 4
const smsLegend = 5
const smsPercentTotal = 6
const smsLabelPercentTotal = 7
const smsXValue = 8
const smsXY = 9
const smsSeriesTitle = 10
const smsPointIndex = 11

'== EMarkToolMouseAction
const mtmMove = 0
const mtmClick = 1

'== EMirrorDirection
const mdDown = 0
const mdUp = 1
const mdRight = 2
const mdLeft = 3

'== EMouseButton
const mbLeft = 1
const mbRight = 2
const mbMiddle = 4

'== EMultiArea
const maNone = 0
const maStacked = 1
const maStacked100 = 2

'== EMultiBar
const mbNone = 0
const mbSide = 1
const mbStacked = 2
const mbStacked100 = 3
const mbSideAll = 4
const mbSelfStack = 5

'== EMUltiPie
const mpAutomatic = 0
const mpDisabled = 1

'== ENearestToolStyle
const hsNone = 0 
const hsCircle = 1
const hsRectangle = 2
const hsDiamond = 3

'== EOrgLineStyle
const unsigned lsSquared = 0
const unsigned lsDiagonal = 1

'== EPaletteStyle
const psPale = 0
const psStrong = 1
const psGrayScale = 2
const psInvGray = 3
const psRainbow = 4
const psCustom = 5

'== EPanelBevel
const bvNone = 0
const bvLowered = 1
const bvRaised = 2

'== EPenEndStyle 
const esRound = 0
const esSquare = 1
const esFlat = 2

'== EPenLineMode
const lmLine = 0
const lmCylinder = 1
const lmRectangle = 2

'== EPenMode
const pmBlack = 0
const pmWhite = 1
const pmNop = 2
const pmNot = 3
const pmCopy = 4
const pmNotCopy = 5
const pmMergePenNot = 6
const pmMaskPenNot = 7
const pmMergeNotPen = 8
const pmMaskNotPen = 9
const pmMerge = 10
const pmNotMerge = 11
const pmMask = 12
const pmNotMask = 13
const pmXor = 14
const pmNotXor = 15

'== EPieOtherStyle 
const poNone = 0
const poBelowPercent = 1
const poBelowValue = 2

'== EPieToolStyle
const ptFocus = 0
const ptExplode = 1

'== EPixelFormat
const pfDevice = 0
const pf1bit = 1
const pf4bit = 2
const pf8bit = 3
const pf15bit = 4
const pf16bit = 5
const pf24bit = 6
const pf32bit = 7

'== EPointerStyle
const psRectangle = 0
const psCircle = 1
const psTriangle = 2
const psDownTriangle = 3
const psCross = 4
const psDiagCross = 5
const psStar = 6
const psDiamond = 7
const psSmallDot = 8
const psNothing = 9
const psLeftTriangle = 10
const psRightTriangle = 11
const psHexagon = 12

'== EPositionUnits
const puPercent = 0
const puPixels = 1

'== EPrinterOrientation
const poPortrait = 0
const poLandscape = 1

'== ERotateToolStyle
const rsAll = 0
const rsRotation = 1
const rsElevation = 2

'== ERSIStyle
const rsiOpenClose = 0 
const rsiClose = 1

'== EScopeCursorStyle
const scsRectangle = 0
const scsCircle = 1
const scsDiamond = 2
const scsEmpty = 3
const scsCamera = 4

'== EScrollBarDrawStyle
const dsAlways = 0
const dsWhenNeeded = 1

'== EScrollDirection
const sdRightLeft = 0
const sdLeftRight = 1

'== EScrollThumbStyle
const stsCustom = 0
const stsThumb1 = 1
const stsThumb2 = 2
const stsThumb3 = 3

'== ESeriesAnimationLoop
const salNo = 0
const salOneWay = 1
const salCircular = 2

'== ESeriesClass
const scLine = 0
const scBar = 1
const scHorizBar = 2
const scArea = 3
const scPoint = 4
const scPie = 5
const scFastLine = 6
const scShape = 7
const scGantt = 8
const scBubble = 9
const scArrow = 10
const scCandle = 11
const scPolar = 12
const scSurface = 13
const scVolume = 14
const scErrorBar = 15
const scBezier = 16
const scContour = 17
const scError = 18
const scPoint3D = 19
const scRadar = 20
const scClock = 21 
const scWindRose= 22  
const scBar3D = 23  
const scImageBar = 24  
const scDonut = 25 
const scTriSurface = 26 
const scBox = 27 
const scHorizBox = 28 
const scHistogram = 29 
const scColorGrid = 30 
const scBarJoin = 31 
const scHighLow = 32 
const scWaterfall = 33 
const scSmith = 34 
const scPyramid = 35 
const scMap = 36
const scHorizLine = 37
const scFunnel = 38
const scCalendar = 39
const scHorizArea = 40
const scPointFigure = 41
const scGauge = 42
const scVector3D = 43
const scTower = 44
const scPolarBar = 45
const scBubble3D = 46
const scHorizHistogram = 47
const scVolumePipe = 48
const scIsoSurface = 49
const scDarvas = 50
const scHighLowLine = 51
const scPolarGrid = 52
const scDeltaPoint = 53
const scImagePoint = 54
const scOrganizational = 55
const scWorld = 56
const scTagCloud = 57
const scKagi = 58
const scRenko = 59

'== ESeriesGroupActive
const gaYes = 0
const gaNo = 1
const gaSome = 2

'== EShapeStyle
const chasRectangle = 0
const chasCircle = 1
const chasVertLine = 2
const chasHorizLine = 3
const chasTriangle = 4
const chasInvertTriangle = 5
const chasLine = 6
const chasDiamond = 7
const chasCube = 8
const chasCross = 9
const chasDiagCross = 10
const chasStar = 11
const chasPyramid = 12
const chasInvertPyramid = 13

'== EShapeXYStyle
const xysPixels = 0
const xysAxis = 1
const xysAxisOrigin = 2

'== EShiftState
const ssShift = 1
const ssAlt = 2
const ssCtrl = 4
const ssNone = 0

'== ESnapStyle
const ssDefault = 0
const ssHorizontal = 1
const ssVertical = 2

'== EStreamType
const stJpeg = 0
const stTeeTemplate = 1

'== ETagCloudOrder
const toText = 0
const toValue = 1
const toNone = 2

'== ETeeCommanderControls
const tcbNormal = 0 
const tcbSeparator = 1
const tcbRotate = 2 
const tcbMove = 3 
const tcbZoom = 4 
const tcbDepth = 5 
const tcbEdit = 6 
const tcbPrintPreview = 7
const tcbCopy = 8 
const tcbSave = 9 
const tcbLabel = 10
const tcb3D = 11

'== ETeeEditorPage
const epMain = 0
const epGeneral = 1
const epAxis = 2
const epTitles = 3
const epLegend = 4
const epPanel = 5
const epPaging = 6
const epWalls = 7
const epAspect = 8
const epSeriesGeneral = 9
const epSeriesMarks = 10 
const epAllSeries = 11 
const epSeriesData = 12 
const epExport = 13 
const epTools = 14 
const epPrintPreview = 15
const epOpenGL = 16

'== ETeePreviewPanelOrientation
const ppoDefault = 0
const ppoPortrait = 1
const ppoLandscape = 2

'== ETeeVertAlign
const vaTop = 0 
const vaCenter = 1 
const vaBottom = 2

'== ETeeZoomDirection
const tzdHorizontal = 0
const tzdVertical = 1
const tzdBoth = 2

'== ETextAlignment
const aLeft = 0
const aRight = 1
const aCenter = 2

'== ETitleAlignment
const taLeftJustify = 0
const taRightJustify = 1
const taCenter = 2

'== EToolClass
const tcCursor = 0 
const tcDragMarks = 1 
const tcAxisArrow = 2 
const tcDrawLine = 3 
const tcNearest = 4 
const tcColorband = 5 
const tcColorLine = 6 
const tcRotate = 7
const tcMarksTip = 8
const tcChartImage = 9
const tcAnnotate = 10
const tcPageNumber = 11
const tcGridTranspose = 12
const tcExtraLegend = 13
const tcSeriesAnimation = 14
const tcGantt = 15
const tcGridBand = 16
const tcPie = 17
const tcDragPoint = 18
const tcLegendScrollBar = 19
const tcLight = 20
const tcSurfaceNearest = 21
const tcAxisScroll = 22
const tcSeriesBand = 23
const tcSelector = 24
const tcRectangle = 25
const tcDataTable = 26
const tcClipSeries = 27
const tcSeriesStats = 28
const tcVideo = 29
const tcVideoPlayer = 30
const tcTransposeSeries = 31
const tcSeriesRegion = 32
const tcAntiAlias = 33
const tcFader = 34
const tcFrame = 35
const tcMagnify = 36
const tcLegendPalette = 37
const tcBanner = 38
const tcText3D = 39
const tcSubChart = 40


'== ETowerStyle
const tsCube = 0
const tsRectangle = 1
const tsCover = 2
const tsCylinder = 3
const tsArrow = 4
const tsCone = 5
const tsPyramid = 6
const tsSlantCube = 7

'== ETreatNullsStyle
const tnDontPaint = 0 
const tnSkip = 1
const tnIgnore = 2

'== ETypeFitting
const cfPolynomial = 0
const cfLogarithmic = 1
const cfExponential = 2

'== EValueListOrder
const loNone = 0
const loAscending = 1
const loDescending = 2

'== EVerticalAxis
const aLeftAxis = 0
const aRightAxis = 1
const aBothVertAxis = 2
const aCustomVertAxis = 3

'== EWorldMap
const wmWorld = 0
const wmAfrica = 1
const wmAsia = 2
const wmAustralia = 3
const wmCentralAmerica = 4
const wmEurope = 5
const wmEurope15 = 6
const wmEurope27 = 7
const wmSpain = 8
const wmMiddleEast = 9
const wmNorthAmerica = 10
const wmSouthAmerica = 11
const wmUSA = 12
const wmUSAHawaiiAlaska = 13

%>
