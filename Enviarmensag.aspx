<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Enviarmensag.aspx.cs" Inherits="RicFun.Enviarmensag" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Enviar mensagem</title>
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
            display: block;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-clip: padding-box;
            border-radius: .25rem;
            transition: none;
            border: 1px solid #ced4da;
            background-color: #fff;
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
                    <a class="navbar-brand">                        
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-host" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbars-host">
                        <ul class="nav navbar-nav navbar-left">
                            <li class="nav-item">                                
                                <asp:Label ID="Label3" CssClass="nav-link" runat="server" Text="Label"></asp:Label>                                                               
                            </li>
                        </ul>
                       <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="Areacliente.aspx">Area do Cliente</a>
                            </li>                                                                                                      
                            <li class="nav-item active">
                                <a class="nav-link">Enviar Mensagem</a>
                            </li>                                                                                                    
                            <li class="nav-item">
                                <a class="nav-link" href="Calcular.aspx">Calculadora</a>
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
        <div class="parallax section db parallax-off">
                 <div class="container">
            <br />
            <asp:Label ID="Label1" runat="server" Text="Qual o assunto desta mensagem:" ForeColor="White"></asp:Label>
            <asp:RadioButtonList ID="Rdassunto" runat="server" ForeColor="White" >
                <asp:ListItem>Eliminar a minha conta e todos os meus dados</asp:ListItem>
                <asp:ListItem>Pedido Informação</asp:ListItem>
                <asp:ListItem Selected="True">Outros</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Data para referencia:" ForeColor="White" ></asp:Label>                     
                     <br />
            <asp:TextBox ID="Txtdata" runat="server" CssClass="auto-style1" MaxLength="200" Width="195px" TextMode="Date" required=""></asp:TextBox>
                     <br />
                     <br />            
            <br />
            <asp:TextBox ID="Txtmensagem" runat="server" MaxLength="500" Width="742px" CssClass="table table-bordered table-condensed" ForeColor="#D5E0E0" 
                placeholder="Escreva a sua mensagem" required="" Height="203px" TextMode="MultiLine" ></asp:TextBox>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Btregistar" runat="server" CssClass="btn btn-light btn-radius btn-brd grd1" Text="Enviar" Height="64px" Width="150px" OnClick="Btregistar_Click" />         
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
</div>
          <div class="copyrights">
            <div class="container">
                <div class="footer-distributed">
                    <div class="footer-left">
                        <p class="footer-company-name">&copy; 2020 <a href="https://www.linkedin.com/in/ricardo-m-1063b633/">Site criado por Ricardo Machado</a></p>
                        <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
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
