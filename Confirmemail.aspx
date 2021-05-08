<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmemail.aspx.cs" Inherits="RicFun.confirmemail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Confirmação email</title>
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
</head>
<body>
    <form id="form1" runat="server">
          <!-- LOADER -->
        <div id="preloader">
            <div class="loader-container">
                <div class="progress-br float shadow">
                    <div class="progress__item">
                    </div>
                </div>
            </div>
        </div>
        <!-- END LOADER -->

        <!-- Start header -->
        <header class="top-navbar">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand">                        
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-host" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbars-host">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item"><a class="nav-link" href="default.aspx">Pagina Principal</a>
                            </li>                                                       
                        </ul>                       
                    </div>
                </div>
            </nav>
        </header>
        <!-- End header -->
        <div class="copyrights">
           
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>                      
            <table align="center">
                <tr>                    
                    <td >
                        <asp:Label ID="Label1" runat="server" Text="Email Confirmado!" ForeColor="White"></asp:Label>
                        <p>&nbsp;</p>
                        <asp:Label ID="Label2" runat="server" Text="Insira os dados para criar um novo Utilizador:" ForeColor="White"></asp:Label>
                        <p>&nbsp;</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="Txtemail" runat="server" CssClass="form-control" type="email" MaxLength="50" ReadOnly="True"></asp:TextBox>
                   <br/>
                        <asp:Label ID="Label5" runat="server" Text="Nome:" ForeColor="White"></asp:Label>
                        <asp:TextBox ID="Txtnome" runat="server" CssClass="form-control" placeholder="Nome" type="text" MaxLength="50"></asp:TextBox>                       
                    </td>
                </tr>
                <tr>
                    <td>
                      <br/>
                        <asp:Label ID="Label6" runat="server" Text="Username:" ForeColor="White"></asp:Label>
                        <asp:TextBox ID="Txtusername" runat="server" CssClass="form-control" placeholder="Escolha um Username" type="text" required="required" MaxLength="50"></asp:TextBox>
                        <br/>
                    </td>
                </tr>
                <tr>
                    <td>
                         <asp:Label ID="Label3" runat="server" Text="Escolha uma password, tem que ter pelo menos um numero, uma letra maíuscula, uma minúscula e no mínimo 8 caracteres:" ForeColor="White"></asp:Label>
                        
                        <asp:TextBox ID="Txtpass" runat="server" CssClass="form-control" placeholder="Password" type="password" required="required" MaxLength="50"
                            pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                            title="Tem que ter pelo menos um numero, uma letra maíuscula, uma minúscula e no mínimo 8 caracteres"></asp:TextBox>
                        <asp:Label ID="Label4" runat="server" Text="Confirmar Password:" ForeColor="White"></asp:Label>
                        <asp:TextBox ID="Txtpass2" runat="server" CssClass="form-control" placeholder="Insira novamente a Password" type="password" required="required" MaxLength="50"
                            pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                            title="Tem que ter pelo menos um numero, uma letra maíuscula, uma minúscula e no mínimo 8 caracteres"></asp:TextBox>
                        <asp:TextBox ID="txtcode" runat="server" Width="261px" TextMode="Password" Visible="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                      <br/>
                        <asp:CheckBox ID="CheckBox1" runat="server" required="required" AutoPostBack="True" ForeColor="White" Text="Dou permissão para que os meus dados sejam gravados neste servidor"/>
                        <br/>
                    </td>
                </tr>
                <tr>
                    <td >
                         <br/>
                         <br/>
                         <br/>
                        <asp:Button ID="Btcriaruser" runat="server" Text="Criar novo utilizador" CssClass="btn btn-light btn-radius btn-brd grd1" OnClick="Btcriaruser_Click1"/>
                        </td>
                </tr>
            </table>           
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
        </div>
                                            
         <div class="copyrights">
            <div class="container">
                <div class="footer-distributed">
                    <div class="footer-left">
                        <p class="footer-company-name">&copy; 2020 <a href="https://www.linkedin.com/in/ricardo-m-1063b633/">Site criado por Ricardo Machado</a></p>
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