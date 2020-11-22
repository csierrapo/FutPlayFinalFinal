<%@page import="Modelo.Equipo"%>
<%@page import="Modelo.Notificacion"%>
<%@page import="Controlador.notificacion"%>
<%@page import="Modelo.Canchas"%>
<%@page import="Modelo.Canchas"%>
<%@page import="Controlador.canchas"%>
<%@page import="java.util.List"%>
<%@page import="Controlador.campos"%>
<%@page import="Modelo.Campos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>PAIZOUN - Cronograma Encuentros</title>
        <%@include file="../includes/importsCSS.jsp" %>
        <style>
            .fc h2{
                font-size:20px;
                text-transform: uppercase;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="../includes/notificaciones.jsp" %>
            <%@include file="../includes/sidebarJugador.jsp" %>            
            <div class="main-panel">
                <%@include file="../includes/header.jsp" %>
                <div class="content">
                    <div class="container-fluid">
                        <div id="external-events">                           
                            <div class="col-md-12">
                                <div class="card card-calendar">
                                    <div class="card-content ps-child">
                                        <div id="calendar"></div>
                                    </div>
                                </div>
                            </div>                    
                        </div>                         
                   </div>
                </div>
            </div>
        </div>                
        <%@include file="../includes/importsJS.jsp"%> 
        <script src="../../assets/lang/es.js"></script>          		
        <script src="../../assets/js/jugadorCalendar.js"></script>
        <script type="text/javascript">            
            $("#nombrepagina").text("Cronograma");
            $("#cronograma").addClass("active");
            $("#encuentrosOptions").addClass("in");
            CargarNotificaciones();

            /*AJUSTAR PARA QUE SE ENVIE EL ID DEL EQUIPO DEL USUARIO EN SESION*/
            //recargarEventosJugador(1);            
        </script>
    </body>
</html>
