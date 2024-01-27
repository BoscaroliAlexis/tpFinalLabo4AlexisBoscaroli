Public Class frmDetalles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim objSocio As New claSocio
            Dim dtsDataSet As New DataSet
            Dim intRetorno As Integer
            Dim intNroSocioInt As Integer
            Dim strNroSocio As String
            Dim strNroSocioTitular As String
            Dim objDatos As New claSocio
            Dim dtsDatosDataSet As New DataSet
            Dim intDatosRetorno As Integer
            Dim objGrupo As New claSocio
            Dim dtsGrupoDataSet As New DataSet
            Dim intGrupoRetorno As Integer
            Dim objAdicional As New claAdicionales
            Dim dtsAdicionalDataSet As New DataSet
            Dim intAdicionalRetorno As Integer

            Me.lblApeyNomSocio.Text = Request.QueryString("apynom").ToString.Trim
            intNroSocioInt = Request.QueryString("nro_socio_int").Trim

            intRetorno = objSocio.devSocioPorNroInt(dtsDataSet, intNroSocioInt)

            If intRetorno > 0 Then
                Dim socioDataRow = DTSdataSet.Tables(0).Rows(0)

                strNroSocio = socioDataRow(6).ToString.Trim
                strNroSocioTitular = socioDataRow(7).ToString.Trim

                intDatosRetorno = objDatos.devSocioPorNroInt(dtsDatosDataSet, intNroSocioInt) ' Se intenta devolver el socio por numero de socio int

                If intDatosRetorno > 0 Then

                    Me.gvDatosSocio.DataSource = dtsDatosDataSet.Tables("socio") 'Se llena el gridview con los datos del socio
                    Me.gvDatosSocio.DataBind()

                End If

                intGrupoRetorno = objGrupo.devGrupoFamiliar(dtsGrupoDataSet, strNroSocioTitular, strNroSocio) ' Se intenta devolver el grupo familiar por socio

                If intGrupoRetorno > 0 Then

                    Me.gvGrupoFamiliar.DataSource = dtsGrupoDataSet.Tables("grupo") 'Se llena el gridview de adicionales
                    Me.gvGrupoFamiliar.DataBind()

                End If


                intAdicionalRetorno = objAdicional.devAdicionalesPorSocio(dtsAdicionalDataSet, strNroSocio) ' Se intenta devolver adicionales por socio

                If intAdicionalRetorno > 0 Then

                    Me.gvAdicionales.DataSource = dtsAdicionalDataSet.Tables("adicionales") ' Se llena el gridview de adicionales
                    Me.gvAdicionales.DataBind()

                End If

            End If
        End If

    End Sub

End Class