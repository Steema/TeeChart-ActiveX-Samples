Public Class AxHostConverter
    Inherits AxHost

    Private Sub New()
        MyBase.New("")
    End Sub

    Public Shared Function ImageToPictureDisp(ByVal image As Image) As stdole.IPictureDisp
        Return CType(GetIPictureDispFromPicture(image), stdole.IPictureDisp)
    End Function

    Public Shared Function PictureDispToImage(ByVal pictureDisp As stdole.IPictureDisp) As Image
        Return GetPictureFromIPicture(pictureDisp)
    End Function

End Class
