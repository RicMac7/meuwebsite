<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fazerresetpass.aspx.cs" Inherits="RicFun.Fazerresetpass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fazer Reset password</title>
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
                    <a class="navbar-brand" href="default.aspx">                        
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
         <div align="center" class="copyrights">
            
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
        <table class="style1" align="center">
            <tr>
                <td class="style2">
                   <asp:Label ID="Label2" runat="server" Text="Escolha uma nova password, tem que ter pelo menos um numero, uma letra maíuscula, uma minúscula e no mínimo 8 caracteres:" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtpwd" runat="server" Width="210px" MaxLength="50" placeholder="Password" type="password" required="required" TextMode="Password"
                        pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                        title="Tem que ter pelo menos um numero, uma letra maíuscula, uma minúscula e no mínimo 8 caracteres"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label1" runat="server" Text="Confirmar Password:" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtcofrmpwd" runat="server" Width="211px" MaxLength="50" required="required" type="password" placeholder="Insira novamente a Password" TextMode="Password"
                     pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                     title="Tem que ter pelo menos um numero, uma letra maíuscula, uma minúscula e no mínimo 8 caracteres"></asp:TextBox>                   
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;
                </td>
                <td>
                    <asp:Button ID="btnsubmit" runat="server" Text="Alterar" Width="156px" OnClick="btnsubmit_Click" />
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
