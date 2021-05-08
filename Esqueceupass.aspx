<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Esqueceupass.aspx.cs" Inherits="RicFun.Esqueceupass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Esqueci password</title>
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
        <div class="parallax section db parallax-off">
                 <div class="container">
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
           <asp:Label ID="Label2" runat="server" Text="Insira o email para onde vair ser enviado o link para fazer reset a sua password:" 
                             ForeColor="#D5E0E0" CssClass="table table-bordered table-condensed" BorderStyle="None"></asp:Label>
              <asp:TextBox ID="txtemail" runat="server" Width="560px" TextMode="Email" ForeColor="#D5E0E0" CssClass="table table-bordered table-condensed"></asp:TextBox>
              <asp:Button ID="btnsend" runat="server" Text="Enviar" OnClick="btnsend_Click" Width="97px" />
              <asp:Label ID="lbresult" runat="server" ForeColor="White"></asp:Label>
              <br />
              <asp:TextBox ID="txtcode" runat="server" Width="261px" TextMode="Password" Visible="False"></asp:TextBox>               
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
