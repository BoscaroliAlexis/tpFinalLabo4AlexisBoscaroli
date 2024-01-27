<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master.Master" CodeBehind="frmDetalles.aspx.vb" Inherits="TPFinalLabo4_BoscaroliAlexis.frmDetalles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <!DOCTYPE html>
<html>
<head>
    <title>Búsqueda de Socios</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .search-input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        .search-results {
            display: none;
            margin-top: 10px;
        }

        .search-results table {
            width: 100%;
            border-collapse: collapse;
        }

        .search-results th,
        .search-results td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }

        .search-results th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>


      <div class="container mt-4">
     <asp:Label ID="lblApeyNomSocio" runat="server" Text="" ></asp:Label>

    <ul class="nav nav-tabs" id="myTab" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" id="tab1-tab" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="true">Datos del socio</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="tab2-tab" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false">Grupo familiar</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="tab3-tab" data-toggle="tab" href="#tab3" role="tab" aria-controls="tab3" aria-selected="false">Adicionales socio</a>
      </li>
    </ul>
    <div class="tab-content" id="myTabContent">
      <div class="tab-panel fade show active" id="tab1" role="tabpanel" aria-labelledby="tab1-tab">
            <br />
                        <asp:Panel ID="pnlDatosSocio" runat="server">
                            <div class="row mt-1">
                                <div class="col">

                                    <asp:GridView   ID="gvDatosSocio" 
                                                    runat="server" 
                                                    AutoGenerateColumns="False"
                                                    GridLines="None"
                                                    CellPadding="0" 
                                                    CellSpacing="0" 
                                                    CssClass="gridview-style"
                                                    AllowPaging="True" 
                                                    PageSize="5">
                                                    
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td style="float: right">Dni : </td>
                                                            <td><%# Eval("nro_documento") %></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="float: right">Nacimiento : </td>
                                                            <td><%# Convert.ToDateTime(Eval("fecha_nacimiento")).ToString("dd/MM/yyyy") %></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="float: right">Sexo : </td>
                                                            <td><%# Eval("sexo") %></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="float: right">Socio Nº : </td>
                                                            <td id="nro_socio"><%# Eval("nro_socio") %></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="float: right">Socio Titular Nº : </td>
                                                            <td><%# Eval("nro_socio_titular") %></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="float: right">Parentesco : </td>
                                                            <td><%# Eval("parentesco") %></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="float: right">Categoría : </td>
                                                            <td><%# Eval("categoria") %></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="float: right">Dirección : </td>
                                                            <td><%# Eval("direccion") %></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="float: right">CP : </td>
                                                            <td><%# Eval("cp") %></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="float: right">Teléfonos : </td>
                                                            <td><%# Eval("telefonos") %></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="float: right">Mail : </td>
                                                            <td><%# Eval("mail") %></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="float: right">Estado : </td>
                                                            <td><%# Eval("estado") %></td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <RowStyle CssClass="gridview-row" />
                                        <PagerStyle CssClass="gridview-pager" />
                                    </asp:GridView>

                                </div>
                            </div>
                            <hr />
                        </asp:Panel>
          </div>
        <div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="tab2-tab">
        <div class="container mt-3">
                        <asp:Panel ID="pnlGrupoFamiliar" runat="server">
                            <div class="row mt-1">
                                <div class="col">
                                    <asp:GridView ID="gvGrupoFamiliar" CssClass="table table-sm" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True">
                                        <Columns>
                                            <asp:BoundField DataField="apynom" HeaderText="Nombre">
                                                <HeaderStyle Width="25%"></HeaderStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="nro_socio" HeaderText="Socio Nº">
                                                <HeaderStyle Width="15%"></HeaderStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="telefonos"  HeaderText="Telefono">
                                                <HeaderStyle Width="15%"></HeaderStyle>
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </asp:Panel>
        </div>
      </div>
      <div class="tab-pane fade" id="tab3" role="tabpanel" aria-labelledby="tab3-tab">
        <div class="container mt-3">
                        <asp:Panel ID="pnlAdicionales" runat="server">
                            <div class="row mt-1">
                                <div class="col">
                                    <asp:GridView ID="gvAdicionales" CssClass="table table-sm" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True">
                                        <Columns>
                                            <asp:BoundField DataField="descripcion" HeaderText="Adicional">
                                                <HeaderStyle Width="20%"></HeaderStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="costo_mensual" HeaderText="Costo Mensual" DataFormatString="{0:$ #,##0.00}">
                                                <HeaderStyle Width="20%"></HeaderStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="fecha_ult_modif" HeaderText="Alta" DataFormatString="{0:dd/MM/yyyy}">
                                                <HeaderStyle Width="15%"></HeaderStyle>
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </asp:Panel>
        </div>
      </div>
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>
</asp:Content>
