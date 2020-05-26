<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PAIZOUN - Jugadores Sobresalientes</title>
        <%@include file="../includes/importsCSS.jsp"%>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="../includes/notificaciones.jsp" %>
            <%@include file="../includes/sidebarJugador.jsp" %>
            <div class="main-panel">
                <%@include file="../includes/header.jsp" %>
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-product">
                                    <div class="card-image" data-header-animation="true">
                                        <img src="/FutPlayFinal/material-dashboard/assets/img/jugadorimg/jugadoresdestacados.jpg" class="responsive-img">
                                        <!--<span class="card-title">Los mejores campos</span>-->
                                        <div class="ripple-container"></div>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-actions">
                                            <a class="btn btn-danger btn-simple fix-broken-card" rel="tooltip" data-placement="bottom" title="" data-original-title="Ver de nuevo">
                                                <i class="material-icons" style="font-size: 25px;">replay</i>
                                                <div class="ripple-container"></div>
                                            </a>
                                            <a href="#" data-toggle="modal" data-target="#noticeModal" class="btn btn-default btn-simple btn-success" rel="tooltip" data-placement="bottom" title="" data-original-title="Buscar Equipo">
                                                <i class="material-icons" style="font-size: 25px;">search</i>
                                                <div class="ripple-container"></div>
                                            </a>
                                            
                                        </div>
                                        <div class="card-title">
                                            <h5><span>Jugadores Sobresalientes</span></h5>
                                        </div>
                                        <!-- NO OLVIDAR HACER EL BUSCADOR°°°°°°°°°°°°°°°°°° -->
                                        <div class="card-description">
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <div class="col-lg-4">
                                                        <div class="card card-pricing card-raised">
                                                            <div class="content">
                                                                <h6 class="category">pepe10</h6>
                                                                <div class="icon icon-rose">
                                                                    <img class="avatar" src="../../assets/img/avatares/av.jpg" style="width: 150px;height: 150px;">
                                                                </div>
                                                                <h3 class="card-title">Defensor</h3>
                                                                <i class="material-icons" style="font-size: 25px; color: #d8bb21">stars</i>
                                                                <i class="material-icons" style="font-size: 25px; color: #d8bb21">stars</i>
                                                                <i class="material-icons" style="font-size: 25px; color: #d8bb21">stars</i>
                                                                <i class="material-icons" style="font-size: 25px; color: #d8bb21">stars</i>
                                                                <i class="material-icons" style="font-size: 25px; color: #d8bb21">stars</i><br>
                                                                <a href="/FutPlayFinal/jugador/verjugador/13" class="btn btn-danger btn-round">Ver perfil</a><br>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../includes/importsJS.jsp" %>
        <script>
            $("#iniciojugador").addClass('active');
            CargarNotificaciones();
        </script>
    </body>
</html>
