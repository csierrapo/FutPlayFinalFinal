<%@page import="Modelo.Propietario"%>
<%
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    Propietario objPropietario = (Propietario)session.getAttribute("PropietarioIngresado");
    try{      
        if(session.getAttribute("PropietarioIngresado").equals("")){
            response.sendRedirect("/FutPlayFinal/index.html");
        }
        else{
%>
<div class="sidebar" data-active-color="red" data-background-color="black" data-image="/FutPlayFinal/GaiaTemplate/assets/img/campofooter.jpg">
    <div class="logo">
        <a href="http://localhost:8080/FutPlayFinal/material-dashboard/pages/propietario/indexPropietario.jsp" class="simple-text">
            PAIZOUN
        </a>
    </div>
    <div class="logo logo-mini">
        <a href="http://localhost:8080/FutPlayFinal/material-dashboard/pages/propietario/indexPropietario.jsp" class="simple-text">
            <img src="../../assets/img/favicon.png" style="width:35px;height: 35px;"/>
        </a>
    </div>
    <div class="sidebar-wrapper">
        <div class="user">
            <div class="photo">
                <%if(objPropietario.getPersona().getAvatar().length()>=100){%>
                    <img class="img" src="<%=objPropietario.getPersona().getAvatar()%>">
                <%}else{%>
                    <img class="img" src="/FutPlayFinal/material-dashboard/assets/img/avatares/<%=objPropietario.getPersona().getAvatar()%>">
                <%}%>
            </div>
            <div class="info">
                <a data-toggle="collapse" href="#opcionesPerfil" class="collapsed">
                    <%=objPropietario.getPersona().getNombres()+" "+objPropietario.getPersona().getApellidos()%>
                    <b class="caret"></b>
                </a>
                <div class="collapse" id="opcionesPerfil">
                    <ul class="nav">
                        <li id="verperfil">
                            <a href="/FutPlayFinal/material-dashboard/pages/propietario/verPerfilPropietario.jsp">Ver perfil</a>
                        </li>
                        <li id="editarperfil">
                            <a href="/FutPlayFinal/material-dashboard/pages/propietario/editarPerfilPropietario.jsp">Editar perfil</a>
                        </li>
                        <li>
                            <a href="#">Ajustes</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <ul class="nav">
            <li id="inicio">
                <a href="/FutPlayFinal/material-dashboard/pages/propietario/indexPropietario.jsp">
                    <i class="material-icons">dashboard</i>
                    <p>Inicio</p>
                </a>
            </li>
            <li id="campos">
                <a data-toggle="collapse" href="#camposOptions">
                    <i class="material-icons">aspect_ratio</i>
                    <p>Campos
                        <b class="caret"></b>
                    </p>
                </a>
                <div class="collapse" id="camposOptions">
                    <ul class="nav">
                        <li id="registrarcampos">
                            <a href="http://localhost:8080/FutPlayFinal/material-dashboard/pages/campo/registrarCampo.jsp">Agregar campo</a>
                        </li>
                        <li id="administrarcampos">
                            <a href="#" class="btnVerCampos">Administrar campos</a>
                            <input type="text" name="idVerCampos" id="idVerCampos" hidden value="<%=objPropietario.getIdPropietario()%>"/>
                        </li>
                    </ul>
                </div>
            </li>
            <!--<li>
                <a data-toggle="collapse" href="#formsExamples">
                    <i class="material-icons">content_paste</i>
                    <p>Torneos
                        <b class="caret"></b>
                    </p>
                </a>
                <div class="collapse" id="formsExamples">
                    <ul class="nav">
                        <li>
                            <a href="./forms/regular.html">Regular Forms</a>
                        </li>
                    </ul>
                </div>
            </li>-->
            <li id="cronograma">
                <a href="#" class="btnVerCanchas">
                    <i class="material-icons">today</i>
                    <p>Cronograma</p>
                </a>
            </li>
            <li id="encuentros">
                <a href="/FutPlayFinal/material-dashboard/pages/encuentro/encuentrosEspera.jsp">
                    <i class="material-icons">flash_on</i>
                    <p>Encuentros</p>
                </a>
            </li>
        </ul>
    </div>
</div>
<%        }
    }  
    catch(NullPointerException ex){
        response.sendRedirect("/FutPlayFinal/index.html");
    }
%>