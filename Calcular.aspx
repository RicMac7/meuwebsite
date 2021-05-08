<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calcular.aspx.cs" Inherits="RicFun.Calcular" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calculadora</title>
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
                            <li class="nav-item">
                                <a class="nav-link" href="Enviarmensag.aspx">Enviar Mensagem</a>
                            </li>                                                                                                    
                            <li class="nav-item active">
                                <a class="nav-link">Calculadora</a>
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
                    <h3>Calculadora</h3>
                    <p>
                        <asp:Calendar ID="Calendar1" runat="server" Width="343px" BorderStyle="None" Font-Bold="True" ForeColor="#D5E0E0" BackColor="#333333" CellPadding="4" DayNameFormat="Shortest" FirstDayOfWeek="Monday" Font-Names="Verdana" Font-Size="8pt" Height="181px">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <TitleStyle ForeColor="#333333" BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#646905" />
                        </asp:Calendar>
                    </p>
                    <p>
                        <strong>
                            <asp:Label ID="Label1" runat="server" Text="Nº dias de formação:" BorderStyle="None" Width="272px" Style="font-size: x-large" ForeColor="#D5E0E0"></asp:Label>
                            <asp:DropDownList ID="cbdias" runat="server" Style="font-weight: bold; font-size: xx-large" Width="67px">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>13</asp:ListItem>
                                <asp:ListItem>14</asp:ListItem>
                                <asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>16</asp:ListItem>
                                <asp:ListItem>17</asp:ListItem>
                                <asp:ListItem>18</asp:ListItem>
                                <asp:ListItem>19</asp:ListItem>
                                <asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>21</asp:ListItem>
                                <asp:ListItem>22</asp:ListItem>
                                <asp:ListItem>23</asp:ListItem>
                                <asp:ListItem>24</asp:ListItem>
                                <asp:ListItem>25</asp:ListItem>
                            </asp:DropDownList>
                        </strong>
                    </p>
                    <p>
                        <strong>
                            <asp:Label ID="Label2" runat="server" Text="Nº Faltas:" BorderStyle="None" Width="271px" Style="font-size: x-large" ForeColor="#D5E0E0"></asp:Label>
                            <asp:DropDownList ID="cdfaltas" runat="server" Style="font-weight: bold; font-size: xx-large" Width="67px">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>13</asp:ListItem>
                                <asp:ListItem>14</asp:ListItem>
                                <asp:ListItem>15</asp:ListItem>
                            </asp:DropDownList>
                        </strong>
                    </p>
                    <p>
                        <strong>
                            <asp:Label ID="Label9" runat="server" Text="Nº de horas:" BorderStyle="None" Width="274px" Style="font-size: x-large" ForeColor="#D5E0E0"></asp:Label>
                            <asp:TextBox ID="txthoras" runat="server" Width="68px" Style="font-size: x-large; font-weight: bold" TextMode="Number">6</asp:TextBox>
                        </strong>
                    </p>
                    <p>
                        <asp:CheckBox ID="chkbolsa" runat="server" BorderStyle="None" Checked="True" EnableTheming="True" Style="font-size: x-large" ForeColor="#D5E0E0" Text="Bolsa:" OnCheckedChanged="chkbolsa_CheckedChanged" AutoPostBack="True" Font-Bold="True" />
                        <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lbbolsa" runat="server" Text="0" Style="font-size: x-large" ForeColor="#D5E0E0"></asp:Label>
                        </strong>
                    </p>
                    <p>
                        <strong>
                            <asp:Label ID="Label5" runat="server" Text="Alimentação:" BorderStyle="None" Width="278px" Style="font-size: x-large" ForeColor="#D5E0E0"></asp:Label>
                            <asp:Label ID="lbalimen" runat="server" Text="0" Style="font-size: x-large" ForeColor="#D5E0E0"></asp:Label>
                        </strong>
                    </p>
                    <p>
                        <strong>
                            <asp:Label ID="Label7" runat="server" Text="Transporte:" BorderStyle="None" Width="274px" Style="font-size: x-large" ForeColor="#D5E0E0"></asp:Label>
                            <asp:TextBox ID="txttransp" runat="server" Width="68px" Style="font-size: x-large; font-weight: bold" TextMode="Number">0</asp:TextBox>
                        </strong>
                    </p>
                    <p>
                        <strong>
                            <asp:Label ID="Label8" runat="server" Text="Total a receber:" BorderStyle="None" Width="278px" Style="font-size: x-large" ForeColor="#D5E0E0"></asp:Label>
                            <asp:Label ID="lbtotal" runat="server" Text="0" Style="font-size: x-large" ForeColor="#D5E0E0"></asp:Label>
                        </strong>
                    </p>
                    <p>
                        &nbsp;
                    </p>
                    <p>
                        <strong>
                            <asp:Button ID="btlimpar" runat="server" Text="Limpar" CssClass="btn btn-danger" Height="42px" Width="107px" OnClick="btlimpar_Click" Style="font-weight: bold; font-size: medium" />
                        </strong>
                        </p>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <p>
                     <strong>
                    <asp:Button ID="btcalcular" runat="server" Text="Calcular" CssClass="btn btn-big btn-primary" Width="171px" Height="45px" OnClick="btcalcular_Click" Style="font-size: large; font-weight: bold" />
                </strong>
                    </p>
                    <p>
                        &nbsp;
                    </p>
                    <p>
                        &nbsp;
                    </p>
                </div>
                </div>
                <!-- end title -->   
       

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
