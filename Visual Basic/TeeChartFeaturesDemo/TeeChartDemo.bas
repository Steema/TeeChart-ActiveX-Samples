Attribute VB_Name = "Module1"
Public PenColor As OLE_COLOR
Public PenWidth As Integer
Public PenVisible As Boolean
Public PenStyle As Integer
Public PenCancel As Boolean
Public BrushColor As OLE_COLOR
Public BrushStyle As Integer
Public BrushCancel As Boolean
Public FirstTime As Boolean

Declare Function GetDeviceCaps Lib "gdi32" _
(ByVal hdc As Long, ByVal nIndex As Long) As Long


Public Function GetTokenCount(ByVal StringExpr As String, Optional Separator As String = ";") As Long
Dim nTokenCount As Long
Dim i As Long
    
    nTokenCount = IIf(Len(StringExpr) > 0, 1, 0)
    For i = 1 To Len(StringExpr)
        If Mid$(StringExpr, i, 1) = Separator Then
            nTokenCount = nTokenCount + 1
        End If
    Next i
    
    GetTokenCount = nTokenCount

End Function

Public Function GetToken(ByVal StringExpr As String, TokenNr As Integer, Optional Separator As String = ";") As String
Dim sTmp As String
Dim sToken As String
Dim nPos As Integer
Dim i As Integer

    nPos = 1
    sTmp = StringExpr
    For i = 1 To TokenNr
        If nPos > 0 Then
            nPos = InStr(nPos, sTmp, Separator)
        End If
        If nPos > 0 Then
            sToken = Left(sTmp, nPos - 1)
            sTmp = Mid(sTmp, nPos + 1)
            nPos = 1
        Else
            sToken = sTmp
            sTmp = ""
        End If
    Next
    
    GetToken = sToken

End Function



