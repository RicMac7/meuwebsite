<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="RicFun.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Utilizadores</title>
    <!-- Basic -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>   
   
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
 
     <!-- Site Metas -->   
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png"/>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <!-- Site CSS -->
    <link rel="stylesheet" href="style.css"/>
    <!-- ALL VERSION CSS -->
    <link rel="stylesheet" href="css/versions.css"/>
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css"/>
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css"/>

    <!-- Modernizer for Portfolio -->
    <script src="js/modernizer.js"></script>

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .auto-style1 {
            margin-right: 0px;
        }
    </style>
</head>
<body class="host_version">
    <form id="form1" runat="server">
          <!-- LOADER -->
        <div id="preloader">
            <div class="loader-container">
                <div class="progress-br float shadow">
                    <div class="progress__item"></div>
                </div>
            </div>
        </div>
        <!-- END LOADER -->
        <!-- Start header -->
        <header class="top-navbar">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" >                        
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-host" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbars-host">
                        <ul class="nav navbar-nav navbar-left">
                            <li class="nav-item">                                
                                <asp:Label ID="Label2" CssClass="nav-link" runat="server" Text="ricmac"></asp:Label>                                                               
                            </li>
                        </ul>
                     <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="Areaadmin.aspx">Area do Admin</a>
                            </li>                                                                                                      
                            <li class="nav-item">
                                <a class="nav-link" href="Enviarmensag.aspx">Enviar Mensagem</a>
                            </li>                                                                                                    
                            <li class="nav-item">
                                <a class="nav-link" href="Calcular.aspx">Calculadora</a>
                            </li>   
                          <li class="nav-item active">
                                <a class="nav-link">Utilizadores</a>
                            </li> 
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="nav-item">                               
                               <!--<a class="nav-link" href="Indice.aspx">Logout</a> -->  
                                <asp:LinkButton ID="Btlogout" CssClass="nav-link" runat="server" OnClick="Btlogout_Click">Logout</asp:LinkButton>                               
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <!-- End header -->
       
   <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="table-responsive">                                                
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" 
                BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="Id" DataSourceID="SqlDataSource1" GridLines="None" Width="104px" CssClass="table table-bordered table-condensed">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                    <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
                    <asp:BoundField DataField="pass" HeaderText="pass" SortExpression="pass" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                </Columns>
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:CosmosfunConnectionString %>" DeleteCommand="DELETE FROM [Utilizadores] WHERE [Id] = @original_Id AND (([nome] = @original_nome) OR ([nome] IS NULL AND @original_nome IS NULL)) AND [login] = @original_login AND [pass] = @original_pass AND [email] = @original_email" InsertCommand="INSERT INTO [Utilizadores] ([nome], [login], [pass], [email]) VALUES (@nome, @login, @pass, @email)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Utilizadores]" UpdateCommand="UPDATE [Utilizadores] SET [nome] = @nome, [login] = @login, [pass] = @pass, [email] = @email WHERE [Id] = @original_Id AND (([nome] = @original_nome) OR ([nome] IS NULL AND @original_nome IS NULL)) AND [login] = @original_login AND [pass] = @original_pass AND [email] = @original_email">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_nome" Type="String" />
                    <asp:Parameter Name="original_login" Type="String" />
                    <asp:Parameter Name="original_pass" Type="String" />
                    <asp:Parameter Name="original_email" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="login" Type="String" />
                    <asp:Parameter Name="pass" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="login" Type="String" />
                    <asp:Parameter Name="pass" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_nome" Type="String" />
                    <asp:Parameter Name="original_login" Type="String" />
                    <asp:Parameter Name="original_pass" Type="String" />
                    <asp:Parameter Name="original_email" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
                     <br />
                     <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" 
                         AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" Width="335px" CssClass="table table-bordered table-condensed">
                         <AlternatingRowStyle BackColor="White" />
                         <Columns>
                             <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                             <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                             <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
                             <asp:BoundField DataField="assunto" HeaderText="assunto" SortExpression="assunto" />
                             <asp:BoundField DataField="dataref" HeaderText="dataref" SortExpression="dataref" />
                             <asp:BoundField DataField="mensagem" HeaderText="mensagem" SortExpression="mensagem" />
                         </Columns>
                         <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                         <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                         <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                         <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                         <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                         <SortedAscendingCellStyle BackColor="#FDF5AC" />
                         <SortedAscendingHeaderStyle BackColor="#4D0000" />
                         <SortedDescendingCellStyle BackColor="#FCF6C0" />
                         <SortedDescendingHeaderStyle BackColor="#820000" />
                     </asp:GridView>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" 
                         ConnectionString="<%$ ConnectionStrings:CosmosfunConnectionString %>" DeleteCommand="DELETE FROM [Mensagem] WHERE [Id] = @original_Id AND [login] = @original_login AND [assunto] = @original_assunto AND [dataref] = @original_dataref AND [mensagem] = @original_mensagem" InsertCommand="INSERT INTO [Mensagem] ([login], [assunto], [dataref], [mensagem]) VALUES (@login, @assunto, @dataref, @mensagem)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Mensagem]" UpdateCommand="UPDATE [Mensagem] SET [login] = @login, [assunto] = @assunto, [dataref] = @dataref, [mensagem] = @mensagem WHERE [Id] = @original_Id AND [login] = @original_login AND [assunto] = @original_assunto AND [dataref] = @original_dataref AND [mensagem] = @original_mensagem">
                         <DeleteParameters>
                             <asp:Parameter Name="original_Id" Type="Int32" />
                             <asp:Parameter Name="original_login" Type="String" />
                             <asp:Parameter Name="original_assunto" Type="String" />
                             <asp:Parameter DbType="Date" Name="original_dataref" />
                             <asp:Parameter Name="original_mensagem" Type="String" />
                         </DeleteParameters>
                         <InsertParameters>
                             <asp:Parameter Name="login" Type="String" />
                             <asp:Parameter Name="assunto" Type="String" />
                             <asp:Parameter DbType="Date" Name="dataref" />
                             <asp:Parameter Name="mensagem" Type="String" />
                         </InsertParameters>
                         <UpdateParameters>
                             <asp:Parameter Name="login" Type="String" />
                             <asp:Parameter Name="assunto" Type="String" />
                             <asp:Parameter DbType="Date" Name="dataref" />
                             <asp:Parameter Name="mensagem" Type="String" />
                             <asp:Parameter Name="original_Id" Type="Int32" />
                             <asp:Parameter Name="original_login" Type="String" />
                             <asp:Parameter Name="original_assunto" Type="String" />
                             <asp:Parameter DbType="Date" Name="original_dataref" />
                             <asp:Parameter Name="original_mensagem" Type="String" />
                         </UpdateParameters>
                     </asp:SqlDataSource>                        
            </div>
          </div>
        </div>
       </div>
                               
         <div class="copyrights">
            <div class="container">
                <div class="footer-distributed">
                    <div class="footer-left">
                        <p class="footer-company-name">&copy; 2020 <a href="https://www.linkedin.com/in/ricardo-m-1063b633/">Site criado por Ricardo Machado</a></p>
                        <asp:Label ID="Label1" runat="server" Text="Ti4On5H8O977vW1xCJlTXDNpdkYBb034eDVMdgU9IdShQkRxM" Visible="False"></asp:Label>
                    </div>
                    <div class="footer-right">
                        <ul class="footer-links-soi">
                            <li><a href="https://github.com/RicMac7"><i class="fa fa-github"></i></a></li>
                        </ul>
                        <!-- end links -->
                    </div>
                </div>
            
            <!-- end container -->
        </div>
            </div>
        <!-- end copyrights -->
        <a href="#" id="scroll-to-top" class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>

       

        <!-- ALL JS FILES -->
        <script src="js/all.js"></script>
        <!-- ALL PLUGINS -->
        <script src="js/custom.js"></script>
    </form>
</body>
</html>
