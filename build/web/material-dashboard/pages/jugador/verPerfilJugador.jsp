<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    Jugador objJugadorVisto = (Jugador) request.getSession().getAttribute("JugadorVisto");
    Persona objPersonaVisto = (Persona) request.getSession().getAttribute("UsuarioVisto");
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PAIZOUN - Ver perfil</title>
        <%@include file="../includes/importsCSS.jsp" %>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="../includes/notificaciones.jsp" %>
            <%@include file="../includes/sidebarJugador.jsp" %>
            <%if(objJugador != null & objPersona != null){%>
            <div class="main-panel">
                <%@include file="../includes/header.jsp" %>
                <div class="content">
                    <div class="container-fluid">
                        <div class="col-md-8 col-md-offset-2">
                            <div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <%if(objPersona.getAvatar().length()>=100){%>
                                            <img class="img" src="<%=objPersona.getAvatar()%>">
                                        <%}else{%>
                                            <img class="img" src="/FutPlayFinal/material-dashboard/assets/img/avatares/<%=objPersona.getAvatar()%>">
                                        <%}%>
                                    </a>
                                </div>
                                <div class="card-content">
                                    <h6 class="category text-gray"><%=objJugador.getPosicion()%></h6>
                                    <h4 class="card-title"><%=objJugador.getAlias()%></h4>
                                    <p class="description"><%=objJugador.getDescripcion()%></p>
                                    
                                    <%
                                        int likes = 0;
                                        int dislike = 0;
                                        double rankingUsuariosFinal=0;
                                        
                                        String calificado [] = objJugador.getRankingUsers().split("/");
                                        System.out.println("EEEEEEEERRRRRROOOOOORRRRR VER PERFIL JUGADOR °°°°°°° ---> " + calificado[0]);
                                        if (calificado[0].equals("")) {
                                            System.out.println("entró");
                                        }else{
                                        
                                            System.out.println("no entro");
                                            for (int i = 0; i < calificado.length; i++) {

                                                String[] ranking = calificado[i].split("~");
                                                if (ranking[1] == "1") {

                                                    likes++;

                                                }else if (ranking[1] == "0") {

                                                    dislike++;
                                                }
                                            }
                                        }
                                        /////////// COMPLETAR LAS CONDICIONES PARA EL RATING ///////
                                        if (likes <= 5 & dislike <= 5) {

                                            rankingUsuariosFinal=20;

                                        }else if (likes > 5 & likes <= 10 & dislike <=5) {
                                            rankingUsuariosFinal=25;
                                        }

                                        double rankingFinal = (objJugador.getRankingSystem() + rankingUsuariosFinal) / 2;
                                        if (rankingFinal >0 & rankingFinal <= 20) {%>
                                        
                                            <i class="material-icons" style="font-size: 30px; color: #d8bb21">stars</i>
                                            <i class="material-icons" style="font-size: 30px; color: #999999">stars</i>
                                            <i class="material-icons" style="font-size: 30px; color: #999999">stars</i>
                                            <i class="material-icons" style="font-size: 30px; color: #999999">stars</i>
                                            <i class="material-icons" style="font-size: 30px; color: #999999">stars</i><br>
                                        
                                        <%}else if(rankingFinal > 20 & rankingFinal <=40){%>
                                            <i class="material-icons" style="font-size: 30px; color: #d8bb21">stars</i>
                                            <i class="material-icons" style="font-size: 30px; color: #d8bb21">stars</i>
                                            <i class="material-icons" style="font-size: 30px; color: #999999">stars</i>
                                            <i class="material-icons" style="font-size: 30px; color: #999999">stars</i>
                                            <i class="material-icons" style="font-size: 30px; color: #999999">stars</i><br>
                                        <%}else if(rankingFinal > 40 & rankingFinal <= 60){%>
                                            <i class="material-icons" style="font-size: 30px; color: #d8bb21">stars</i>
                                            <i class="material-icons" style="font-size: 30px; color: #d8bb21">stars</i>
                                            <i class="material-icons" style="font-size: 30px; color: #d8bb21">stars</i>
                                            <i class="material-icons" style="font-size: 30px; color: #999999">stars</i>
                                            <i class="material-icons" style="font-size: 30px; color: #999999">stars</i><br>
                                        <%}else if(rankingFinal > 60 & rankingFinal <= 80){%>
                                            <i class="material-icons" style="font-size: 30px; color: #d8bb21">stars</i>
                                            <i class="material-icons" style="font-size: 30px; color: #d8bb21">stars</i>
                                            <i class="material-icons" style="font-size: 30px; color: #d8bb21">stars</i>
                                            <i class="material-icons" style="font-size: 30px; color: #d8bb21">stars</i>
                                            <i class="material-icons" style="font-size: 30px; color: #999999">stars</i><br>
                                        <%}else if(rankingFinal > 80 & rankingFinal <= 100){%>
                                            <i class="material-icons" style="font-size: 30px; color: #d8bb21">stars</i>
                                            <i class="material-icons" style="font-size: 30px; color: #d8bb21">stars</i>
                                            <i class="material-icons" style="font-size: 30px; color: #d8bb21">stars</i>
                                            <i class="material-icons" style="font-size: 30px; color: #d8bb21">stars</i>
                                            <i class="material-icons" style="font-size: 30px; color: #d8bb21">stars</i><br>
                                        <%}%>
                                    <!--<i class="material-icons" style="font-size: 30px; color: #d8bb21">stars</i>
                                    <i class="material-icons" style="font-size: 30px; color: #d8bb21">stars</i>
                                    <i class="material-icons" style="font-size: 30px; color: #d8bb21">stars</i>
                                    <i class="material-icons" style="font-size: 30px; color: #d8bb21">stars</i>
                                    <i class="material-icons" style="font-size: 30px; color: #d8bb21">stars</i><br>-->
                                    
                                    <a href="../jugador/editarPerfilJugador.jsp" class="btn btn-danger btn-round">Editar perfil</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8 col-md-offset-2">
                            <div class="card">
                                <div class="card-content">
                                    <input type="text" id="txtIdUsuarioComentado" value="<%=objJugador.getIdJugador()%>" hidden>
                                    <h3 class="card-title">Comentarios</h3>
                                    <ul class="list-group" id="contenedorComentarios"></ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><%}%>
        </div>
    
        <%@include file="../includes/importsJS.jsp" %>
        <script>
            $("#nombrepagina").text("Mi perfil");
            window.onload = function (){                
                CargarNotificaciones();
                VerComentarios();
            }
        </script>
    </body>
</html>
