<%
//=============================
//== JScript constants for use
//== with TeeChart Pro AX v2024
//=============================

//== EAnnotationPosition
var ppLeftTop = 0; 
var ppLeftBottom = 1;
var ppRightTop = 2; 
var ppRightBottom = 3;
var ppCenter = 4;

//== EArrowHeadStyle
var ahNone = 0;
var ahLine = 1;
var ahSolid = 2;

//== EAxisArrowToolPosition
var aaStart = 0; 
var aaEnd = 1; 
var aaBoth = 2;

//== EAxisLabelAlign
var alDefault = 0; 
var alOpposite = 1;

//== EAxisLabelStyle
var talAuto = 0;
var talNone = 1;
var talValue = 2;
var talMark = 3;
var talText = 4;

//== EAxisType
var atLeft = 0;
var atTop = 1;
var atRight = 2;
var atBottom = 3;
var atDepth = 4;
var atCustom = 5;

//== EBackImageMode 
var pbmStretch = 0;
var pbmTile = 1;
var pbmCenter = 2;
var pbmCustom = 3;

//== EBarStyle
var bsRectangle = 0;
var bsPyramid = 1;
var bsInvPyramid = 2;
var bsCilinder = 3;
var bsEllipse = 4;
var bsArrow = 5;
var bsRectGradient = 6;
var bsCone = 7;
var bsBevel = 8;
var bsSlantCube = 9;
var bsDiamond = 10;
var bsInvArrow = 11;
var bsInvCone = 12;

//== EBezierStyle
var bsWindows = 0;
var bsBezier3 = 1;
var bsBezier4 = 2;

//== EBorderStyle
var bsNone = 0;
var bsSingle = 1;

//== EBrushStyle
var bsSolid = 0;
var bsClear = 1;
var bsHorizontal = 2;
var bsVertical = 3;
var bsFDiagonal = 4;
var bsBDiagonal = 5;
var bsCross = 6;
var bsDiagCross = 7;
var bsFill80 = 8;
var bsFill60 = 9; 
var bsFill40 = 10;
var bsFill20 = 11;
var bsFill10 = 12;
var bsZigZag = 13;
var bsVertSmall = 14; 
var bsHorizSmall = 15;
var bsDiagSmall = 16;
var bsBackDiagSmall = 17;
var bsCrossSmall = 18;
var bsBackCrossSmall = 19;

//== ECandleColorStyle
var cssRelativeToOpen = 0;
var cssRelativeToClose = 1;

//== ECandleStyle 
var csCandleStick = 0;
var csCandleBar = 1;
var csOpenClose = 2;
var csLine = 3;

//== ECanvas3DPlane
var cpX = 0;
var cpY = 1;
var cpZ = 2;

//== ECanvasBackMode
var cbmNone = 0;
var cbmTransparent = 1;
var cbmOpaque = 2;

//== ECanvasTextAlign
var ctaLeft = 0;
var ctaCenter = 1;
var ctaRight = 2;

//== EChartGridShow
var cgsAuto = 0;
var cgsNo = 1;
var cgsYes = 2;

//== EChartObjectShapeStyle
var fosRectangle = 0;
var fosRoundRectangle = 1;

//== EChartPenStyle
var psSolid = 0;
var psDash = 1;
var psDot = 2;
var psDashDot = 3;
var psDashDotDot = 4;
var psClear = 5;
var psInsideFrame = 6;
var psSmallDots = 7;

//== EChartScroll
var pmNone = 0;	
var pmHorizontal = 1;
var pmVertical = 2;
var pmBoth = 3;

//== EChartTheme
var ctDefault = 0;
var ctExcel = 1;
var ctClassic = 2;
var ctBusiness = 3;
var ctWeb = 4;
var ctWindowsXP = 5;
var ctBlueSky = 6;
var ctFacts = 7;

//== ECheckBoxesStyle
var cbsCheck = 0;
var cbsRadio = 1;

//== EColorLineStyle
var clCustom = 0; 
var clMaximum = 1;
var clCenter = 2; 
var clMinimum = 3;

//== EColorPalette
var cpTeeChart = 0;
var cpExcel = 1;
var cpVictorian = 2;
var cpPastel = 3;
var cpSolid = 4;
var cpClassic = 5;
var cpWeb = 6;
var cpModern = 7;
var cpRainbow = 8;
var cpWindowsXP = 9;
var cpDefault = 10;
var cpMacOS = 11;
var cpWinVista = 12;

//== ECompressionPeriod
var ocDay = 0;
var ocWeek = 1;
var ocMonth = 2;
var ocBiMonth = 3;
var ocQuarter = 4;
var ocYear = 5;

//== EConstants
var clTeeColor = 536870912;
var clNone = 536870911;

//== ECursorToolStyle
var cssHorizontal = 0;
var cssVertical = 1;
var cssBoth = 2;
var cssScope = 3;

//== ECustomSeriesStack
var cssNone = 0; 
var cssOverlap = 1; 
var cssStack = 2; 
var cssStack100 = 3;

//== EDatasourceType
var dstAllRecords = 0; 
var dstSingleRecord = 1;

//== EDateTimeStep
var dtOneMicrosecond = 0;
var dtOneMillisecond = 1;
var dtOneSecond = 2;
var dtFiveSeconds = 3;
var dtTenSeconds = 4;
var dtFifteenSeconds = 5;
var dtThirtySeconds = 6;
var dtOneMinute = 7;
var dtFiveMinutes = 8;
var dtTenMinutes = 9;
var dtFifteenMinutes = 10;
var dtThirtyMinutes = 11;
var dtOneHour = 12;
var dtTwoHours =13;
var dtSixHours = 14;
var dtTwelveHours = 15;
var dtOneDay = 16;
var dtTwoDays = 17;
var dtThreeDays = 18;
var dtOneWeek = 19;
var dtHalfMonth = 20;
var dtOneMonth = 21;
var dtTwoMonths = 22;
var dtThreeMonths =23; 
var dtFourMonths = 24;
var dtSixMonths = 25;
var dtOneYear = 26;
var dtNone = 27;

//== EDeltaImageStyle
var disSmiles = 0;
var disHands = 1;

//== EDownSampleMethod
var dsDouglas = 0;
var dsMax = 1;
var dsMin = 2;
var dsMinMax = 3;
var dsAverage = 4;

//== EDragMode
var dmManual = 0;
var dmAutomatic = 1;

//== EDragPointStyle
var dsX = 0;
var dsY = 1;
var dsBoth = 2;

//== EDragState 
var dsDragEnter = 0;
var dsDragLeave = 1;
var dsDragMove = 2;

//== EDrawLineStyle
var dlLine = 0;
var dlHorizParallel = 1;
var dlVertParallel = 2;
var dlRectangle = 3;
var dlEllipse = 4;

//== EErrorSeriesStyle
var essLeft = 0;
var essRight = 1;
var essLeftRight = 2;
var essTop = 3;
var essBottom = 4;
var essTopBottom = 5;

//== EErrorWidthUnits 
var ewuPercent = 0;
var ewuPixels= 1;

//== EFaderStyle
var fsFadeIn = 0;
var fsFadeOut = 1;

//== EFilterClass
var fcConvolve = 0;
var fcBlur = 1;
var fcResize = 2;
var fcCrop = 3;
var fcInvert = 4;
var fcGrayScale = 5;
var fcFlip = 6;
var fcReverse = 7;
var fcAmount = 8;
var fcMosaic = 9;
var fcBrightness = 10;
var fcContrast = 11;
var fcColor = 12;
var fcHueLumSat = 13;
var fcSharpen = 14;
var fcEmboss = 15;
var fcSoften = 16;
var fcGammaCorrection = 17;
var fcRotate = 18;
var fcMirror = 19;
var fcTile = 20;
var fcBevel = 21;
var fcZoom = 22;


//== EFunctionPeriodAlign
var paFirst = 0;
var paCenter = 1;
var paLast = 2;

//== EFunctionPeriodStyle
var psNumPoints = 0;
var psRange = 1;

//== EFunctionType
var tfCopy = 0;
var tfAdd = 1;
var tfSubtract = 2;
var tfMultiply = 3;
var tfDivide = 4;
var tfAverage = 5;
var tfHigh = 6;
var tfLow = 7;
var tfMovavg = 8;
var tfExpavg = 9;
var tfMomentum = 10;
var tfCurveFit = 11;
var tfRSI = 12;
var tfTrend = 13;
var tfStdDeviation = 14;
var tfCumulative = 15;
var tfCount = 16;
var tfExpTrend = 17;
var tfExpMovAvg = 18;
var tfMomentumDiv = 19;
var tfRMS = 20;
var tfMACD = 21;
var tfStochastic = 22;
var tfBollinger = 23;
var tfADX = 24;
var tfSmoothing = 25;
var tfCustom = 26;
var tfCompress = 27;
var tfCrossPoints = 28;
var tfCLV = 29;
var tfOBV = 30;
var tfCCI = 31;
var tfPVO = 32;
var tfPerformance = 33;
var tfMode = 34;
var tfMedian = 35;
var tfCorrelation = 36;
var tfVariance = 37;
var tfPerimeter = 38;
var tfDownSampleFun = 39;
var tfSubset = 40;
var tfHistogram = 41;
var tfSAR = 42;

//== EGanttToolPartBar
var pbStart = 0;
var pbAll = 1;
var pbEnd = 2;

//== EGIFColorReduction
var rmNone = 0; 
var rmWindows20 = 1; 
var rmWindows256 = 2; 
var rmWindowsGray = 3; 
var rmMonochrome = 4; 
var rmGrayScale = 5; 
var rmNetscape = 6; 
var rmQuantize = 7; 
var rmQuantize256 = 8;

//== EGIFCompression
var gcLZW = 0; 
var gcRLE = 1;

//== EGIFDitherMode
var dmNearest = 0; 
var dmFloydSteinberg = 1; 
var dmStucki = 2; 
var dmSierra = 3; 
var dmJaJuNI = 4; 
var dmSteveArche = 5; 
var dmBurkes = 6;

//== EGradientDirection 
var gdTopBottom = 0;
var gdBottomTop = 1;
var gdLeftRight = 2;
var gdRightLeft = 3;
var gdFromCenter = 4;
var gdFromTopLeft = 5;
var gdFromBottomLeft = 6;
var gdRadial = 7;
var gdDiagonalUp = 8;
var gdDiagonalDown = 9;

//== EGrayMethod
var gmSimple = 0;
var gmEye = 1;
var gmEye2 = 2;

//== EGroupFormula
var gfCount = 0;
var gfSum = 1;

//== EHandStyle
var hsLine = 0;
var hsTriangle = 1;

//== EHorizontalAxis
var aTopAxis = 0;
var aBottomAxis = 1;
var aBothHorizAxis = 2;
var aCustomHorizAxis = 3;

//== EJPEGPerformance
var jpegBestQuality = 0;
var jpegBestSpeed = 1;

//== ELegendAlignment
var laLeft = 0;
var laRight = 1;
var laTop = 2;
var laBottom = 3;

//== ELegendPaletteAxis
var laDefault = 0;
var laOther = 1;
var laBoth = 2;

//== ELegendStyle
var lsAuto = 0;
var lsSeries = 1;
var lsValues = 2;
var lsLastValues = 3;
var lsSeriesGroups = 4;

//== ELegendSymbolPosition
var spLeft = 0; 
var spRight = 1;

//== ELegendSymbolSize
var lcsPercent = 0; 
var lcsPixels = 1;

//== ELegendTextStyle
var ltsPlain = 0;
var ltsLeftValue =1;
var ltsRightValue =2;
var ltsLeftPercent = 3;
var ltsRightPercent = 4;
var ltsXValue = 5;
var ltsValue = 6;
var ltsPercent = 7;
var ltsXAndValue = 8;
var ltsXAndPercent = 9;

//== ELightStyle
var lsLinear = 0;
var lsSpotLight = 1;

//== ELoadMode
var lmClear = 0;
var lmAppend = 1;

//== EMarginUnits
var muPercent = 0; 
var muPixels = 1;

//== EMarkStyle
var smsValue = 0;
var smsPercent = 1;
var smsLabel = 2;
var smsLabelPercent = 3;
var smsLabelValue = 4;
var smsLegend = 5;
var smsPercentTotal = 6;
var smsLabelPercentTotal = 7;
var smsXValue = 8;
var smsXY = 9;
var smsSeriesTitle = 10;
var smsPointIndex = 11;

//== EMarkToolMouseAction
var mtmMove = 0;
var mtmClick = 1;

//== EMirrorDirection
var mdDown = 0;
var mdUp = 1;
var mdRight = 2;
var mdLeft = 3;

//== EMouseButton
var mbLeft = 1;
var mbRight = 2;
var mbMiddle = 4;

//== EMultiArea
var maNone = 0;
var maStacked = 1;
var maStacked100 = 2;

//== EMultiBar
var mbNone = 0;
var mbSide = 1;
var mbStacked = 2;
var mbStacked100 = 3;
var mbSideAll = 4;
var mbSelfStack = 5;

//== EMUltiPie
var mpAutomatic = 0;
var mpDisabled = 1;

//== ENearestToolStyle
var hsNone = 0; 
var hsCircle = 1;
var hsRectangle = 2;
var hsDiamond = 3;

//== EOrgLineStyle
const unsigned lsSquared = 0;
const unsigned lsDiagonal = 1;

//== EPaletteStyle
var psPale = 0;
var psStrong = 1;
var psGrayScale = 2;
var psInvGray = 3;
var psRainbow = 4;
var psCustom = 5;

//== EPanelBevel
var bvNone = 0;
var bvLowered = 1;
var bvRaised = 2;

//== EPenEndStyle 
var esRound = 0;
var esSquare = 1;
var esFlat = 2;

//== EPenLineMode
var lmLine = 0;
var lmCylinder = 1;
var lmRectangle = 2;

//== EPenMode
var pmBlack = 0;
var pmWhite = 1;
var pmNop = 2;
var pmNot = 3;
var pmCopy = 4;
var pmNotCopy = 5;
var pmMergePenNot = 6;
var pmMaskPenNot = 7;
var pmMergeNotPen = 8;
var pmMaskNotPen = 9;
var pmMerge = 10;
var pmNotMerge = 11;
var pmMask = 12;
var pmNotMask = 13;
var pmXor = 14;
var pmNotXor = 15;

//== EPieOtherStyle 
var poNone = 0;
var poBelowPercent = 1;
var poBelowValue = 2;

//== EPieToolStyle
var ptFocus = 0;
var ptExplode = 1;

//== EPixelFormat
var pfDevice = 0;
var pf1bit = 1;
var pf4bit = 2;
var pf8bit = 3;
var pf15bit = 4;
var pf16bit = 5;
var pf24bit = 6;
var pf32bit = 7;

//== EPointerStyle
var psRectangle = 0;
var psCircle = 1;
var psTriangle = 2;
var psDownTriangle = 3;
var psCross = 4;
var psDiagCross = 5;
var psStar = 6;
var psDiamond = 7;
var psSmallDot = 8;
var psNothing = 9;
var psLeftTriangle = 10;
var psRightTriangle = 11;
var psHexagon = 12;

//== EPositionUnits
var puPercent = 0;
var puPixels = 1;

//== EPrinterOrientation
var poPortrait = 0;
var poLandscape = 1;

//== ERotateToolStyle
var rsAll = 0;
var rsRotation = 1;
var rsElevation = 2;

//== ERSIStyle
var rsiOpenClose = 0; 
var rsiClose = 1;

//== EScopeCursorStyle
var scsRectangle = 0;
var scsCircle = 1;
var scsDiamond = 2;
var scsEmpty = 3;
var scsCamera = 4;

//== EScrollBarDrawStyle
var dsAlways = 0;
var dsWhenNeeded = 1;

//== EScrollDirection
var sdRightLeft = 0;
var sdLeftRight = 1;

//== EScrollThumbStyle
var stsCustom = 0;
var stsThumb1 = 1;
var stsThumb2 = 2;
var stsThumb3 = 3;

//== ESeriesAnimationLoop
var salNo = 0;
var salOneWay = 1;
var salCircular = 2;

//== ESeriesClass
var scLine = 0;
var scBar = 1;
var scHorizBar = 2;
var scArea = 3;
var scPoint = 4;
var scPie = 5;
var scFastLine = 6;
var scShape = 7;
var scGantt = 8;
var scBubble = 9;
var scArrow = 10;
var scCandle = 11;
var scPolar = 12;
var scSurface = 13;
var scVolume = 14;
var scErrorBar = 15;
var scBezier = 16;
var scContour = 17;
var scError = 18;
var scPoint3D = 19;
var scRadar = 20;
var scClock = 21; 
var scWindRose= 22;  
var scBar3D = 23;  
var scImageBar = 24;  
var scDonut = 25; 
var scTriSurface = 26; 
var scBox = 27; 
var scHorizBox = 28; 
var scHistogram = 29; 
var scColorGrid = 30; 
var scBarJoin = 31; 
var scHighLow = 32; 
var scWaterfall = 33; 
var scSmith = 34; 
var scPyramid = 35; 
var scMap = 36;
var scHorizLine = 37;
var scFunnel = 38;
var scCalendar = 39;
var scHorizArea = 40;
var scPointFigure = 41;
var scGauge = 42;
var scVector3D = 43;
var scTower = 44;
var scPolarBar = 45;
var scBubble3D = 46;
var scHorizHistogram = 47;
var scVolumePipe = 48;
var scIsoSurface = 49;
var scDarvas = 50;
var scHighLowLine = 51;
var scPolarGrid = 52;
var scDeltaPoint = 53;
var scImagePoint = 54;
var scOrganizational = 55;
var scWorld = 56;
var scTagCloud = 57;
var scKagi = 58;
var scRenko = 59;

//== ESeriesGroupActive
var gaYes = 0;
var gaNo = 1;
var gaSome = 2;

//== EShapeStyle
var chasRectangle = 0;
var chasCircle = 1;
var chasVertLine = 2;
var chasHorizLine = 3;
var chasTriangle = 4;
var chasInvertTriangle = 5;
var chasLine = 6;
var chasDiamond = 7;
var chasCube = 8;
var chasCross = 9;
var chasDiagCross = 10;
var chasStar = 11;
var chasPyramid = 12;
var chasInvertPyramid = 13;

//== EShapeXYStyle
var xysPixels = 0;
var xysAxis = 1;
var xysAxisOrigin = 2;

//== EShiftState
var ssShift = 1;
var ssAlt = 2;
var ssCtrl = 4;
var ssNone = 0;

//== ESnapStyle
var ssDefault = 0;
var ssHorizontal = 1;
var ssVertical = 2;

//== EStreamType
var stJpeg = 0;
var stTeeTemplate = 1;

//== ETagCloudOrder
var toText = 0;
var toValue = 1;
var toNone = 2;

//== ETeeCommanderControls
var tcbNormal = 0; 
var tcbSeparator = 1;
var tcbRotate = 2; 
var tcbMove = 3; 
var tcbZoom = 4; 
var tcbDepth = 5; 
var tcbEdit = 6; 
var tcbPrintPreview = 7;
var tcbCopy = 8; 
var tcbSave = 9; 
var tcbLabel = 10;
var tcb3D = 11;

//== ETeeEditorPage
var epMain = 0;
var epGeneral = 1;
var epAxis = 2;
var epTitles = 3;
var epLegend = 4;
var epPanel = 5;
var epPaging = 6;
var epWalls = 7;
var epAspect = 8;
var epSeriesGeneral = 9;
var epSeriesMarks = 10; 
var epAllSeries = 11; 
var epSeriesData = 12; 
var epExport = 13; 
var epTools = 14; 
var epPrintPreview = 15;
var epOpenGL = 16;

//== ETeePreviewPanelOrientation
var ppoDefault = 0;
var ppoPortrait = 1;
var ppoLandscape = 2;

//== ETeeVertAlign
var vaTop = 0; 
var vaCenter = 1; 
var vaBottom = 2;

//== ETeeZoomDirection
var tzdHorizontal = 0;
var tzdVertical = 1;
var tzdBoth = 2;

//== ETextAlignment
var aLeft = 0;
var aRight = 1;
var aCenter = 2;

//== ETitleAlignment
var taLeftJustify = 0;
var taRightJustify = 1;
var taCenter = 2;

//== EToolClass
var tcCursor = 0; 
var tcDragMarks = 1; 
var tcAxisArrow = 2; 
var tcDrawLine = 3; 
var tcNearest = 4; 
var tcColorband = 5; 
var tcColorLine = 6; 
var tcRotate = 7;
var tcMarksTip = 8;
var tcChartImage = 9;
var tcAnnotate = 10;
var tcPageNumber = 11;
var tcGridTranspose = 12;
var tcExtraLegend = 13;
var tcSeriesAnimation = 14;
var tcGantt = 15;
var tcGridBand = 16;
var tcPie = 17;
var tcDragPoint = 18;
var tcLegendScrollBar = 19;
var tcLight = 20;
var tcSurfaceNearest = 21;
var tcAxisScroll = 22;
var tcSeriesBand = 23;
var tcSelector = 24;
var tcRectangle = 25;
var tcDataTable = 26;
var tcClipSeries = 27;
var tcSeriesStats = 28;
var tcVideo = 29;
var tcVideoPlayer = 30;
var tcTransposeSeries = 31;
var tcSeriesRegion = 32;
var tcAntiAlias = 33;
var tcFader = 34;
var tcFrame = 35;
var tcMagnify = 36;
var tcLegendPalette = 37;
var tcBanner = 38;
var tcText3D = 39;
var tcSubChart = 40;


//== ETowerStyle
var tsCube = 0;
var tsRectangle = 1;
var tsCover = 2;
var tsCylinder = 3;
var tsArrow = 4;
var tsCone = 5;
var tsPyramid = 6;
var tsSlantCube = 7;

//== ETreatNullsStyle
var tnDontPaint = 0 ;
var tnSkip = 1;
var tnIgnore = 2;

//== ETypeFitting
var cfPolynomial = 0;
var cfLogarithmic = 1;
var cfExponential = 2;

//== EValueListOrder
var loNone = 0;
var loAscending = 1;
var loDescending = 2;

//== EVerticalAxis
var aLeftAxis = 0;
var aRightAxis = 1;
var aBothVertAxis = 2;
var aCustomVertAxis = 3;

//== EWorldMap
var wmWorld = 0;
var wmAfrica = 1;
var wmAsia = 2;
var wmAustralia = 3;
var wmCentralAmerica = 4;
var wmEurope = 5;
var wmEurope15 = 6;
var wmEurope27 = 7;
var wmSpain = 8;
var wmMiddleEast = 9;
var wmNorthAmerica = 10;
var wmSouthAmerica = 11;
var wmUSA = 12;
var wmUSAHawaiiAlaska = 13;

%>
