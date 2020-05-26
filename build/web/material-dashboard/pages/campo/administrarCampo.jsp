<%@page import="Modelo.Canchas"%>
<%@page import="Controlador.canchas"%>
<%@page import="Controlador.canchas"%>
<%@page import="Modelo.Campos"%>
<%@page import="java.util.List"%>
<%@page import="Controlador.campos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    try{      
        if(session.getAttribute("PropietarioIngresado").equals("")){
            response.sendRedirect("/FutPlayFinal/index.html");
        }
        else{
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PAIZOUN</title>
        <%@include file="../includes/importsCSS.jsp"%>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="../includes/notificacionesPropietario.jsp" %>
            <%@include file="../includes/sidebarPropietario.jsp"%>
            <div class="main-panel">
                <%@include file="../includes/headerPropietario.jsp"%>
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <%
                                campos cc = new campos();
                                List<Campos> listC = cc.getAll(request,response);
                            %>
                            <%for (Campos lc : listC) {
                                String horario [] = lc.getHorario().split("/");
                            %>
                            <div class="col-lg-5" style="margin-left:60px;">
                                <div class="card card-product">
                                    <div class="card-image" data-header-animation="true">
                                        <img src="/FutPlayFinal/Imagenes/<%=lc.getFoto()%>">
                                        <span class="card-title"><%=lc.getNombre()%></span>                                   
                                    </div>
                                    <div class="card-content">
                                        <div class="card-actions">  
                                            <button type="button" class="btn btn-info btn-simple btnModalCancha" rel="tooltip" data-placement="bottom" title="Añadir canchas" value="<%=lc.getIdCampo()%>">
                                                 <i class="material-icons" style="font-size: 30px;">add</i>
                                            </button>  
                                            <button type="button" class="btn btn-warning btn-simple btnAdminCancha" rel="tooltip" data-placement="bottom" title="Administrar canchas" value="<%=lc.getIdCampo()%>">
                                                 <i class="material-icons" style="font-size: 30px;">list</i>
                                            </button>      
                                            <!-- Classic Modal -->
                                            <div class="modal fade" id="canchaModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content col-lg-9 col-lg-offset-2">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                                <i class="material-icons">clear</i>
                                                            </button>
                                                            <h4 class="modal-title">Administrar canchas</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="material-">
                                                                <div class="table-responsive">
                                                                    <table class="table">
                                                                        <thead class="text-primary">
                                                                            <th>Numero</th>
                                                                            <th>Tipo</th>
                                                                            <th>Acciones</th>
                                                                        </thead>
                                                                        <tbody id="tblCanchas">
                                                                            
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <button class="btn btn-success btn-simple actualizarCampo" rel="tooltip" data-placement="bottom" title="Actualizar campo" value="<%=lc.getIdCampo()%>">
                                            <i class="material-icons" style="font-size:25px;">mode_edit</i>
                                            </button>
                                            <button class="btn btn-danger btn-simple eliminarCampo" rel="tooltip" data-placement="bottom" title="Eliminar campo" value="<%=lc.getIdCampo()%>">
                                            <i class="material-icons" style="font-size:25px;">delete</i>
                                            </button>
                                            <button class="btn btn-primary btn-simple btnMapCampo" rel="tooltip" data-placement="bottom" title="Ubicacion en Google maps" value="<%=lc.getUbicacion()%>">
                                                <i class="material-icons" style="font-size: 25px;">location_on</i>
                                            </button>
                                            <button type="button" class="btn btn-danger btn-simple fix-broken-card" rel="tooltip" data-placement="bottom" title="Ver de nuevo">
                                                <i class="material-icons" style="font-size: 25px;">loop</i>
                                            </button>
                                        </div>
                                        <p><i class="material-icons" style="font-size:20px;">subdirectory_arrow_right</i> Direccion: <%=lc.getDireccion()%></p>
                                        <p><i class="material-icons" style="font-size:20px;">schedule</i> Horario de apertura: <%=horario[0]%></p>
                                        <p><i class="material-icons" style="font-size:20px;">schedule</i> Horario de cierre: <%=horario[1]%></p>
                                        <p><i class="material-icons" style="font-size:20px;">face</i> Propietario: <%=lc.getPropietario().getPersona().getNombres()+" "+lc.getPropietario().getPersona().getApellidos()%></p> 
                                    </div>                                      
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- small modal -->
        <div class="modal fade" id="añadirCancha" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-small ">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="material-icons">clear</i></button>
                    </div>
                    <div class="modal-body text-center">
                        <form method="post" id="frmCancha">
                            <h5>Numero</h5>
                            <input type="number" class="form-control" name="numeroCancha" id="numeroCancha" required>
                            <h5>Tipo de cancha </h5>
                            <select class="form-control" name="cmbTipoCancha" id="cmbTipoCancha" required>
                                <option disabled="" selected=""></option>
                                <option value="Futbol 5">Futbol 5</option>
                                <option value="Futbol 8">Futbol 8</option>
                                <option value="Futbol12">Futbol 12</option>
                            </select>
                        </form>
                    </div>
                    <div class="modal-footer text-center">
                        <button type="submit" class="btn btn-danger btn-simple btnAñadirCancha">Añadir</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Classic Modal -->
        <div class="modal fade" id="mapModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            <i class="material-icons">clear</i>
                        </button>
                        <h4 class="modal-title">Ubicación</h4>
                    </div>
                    <div class="modal-body">
                        <div style="width: 100%; height: 300px;" id="map-canvas"></div>
                    </div>
                    <div class="modal-footer">
                        
                    </div>
                </div>
            </div>
        </div>                
        <%@include file="../includes/importsJS.jsp"%>
        <script type="text/javascript">
            $("#nombrepagina").text("Administrar campos");
            $("#campos").addClass("active");
            $("#administrarcampos").addClass("active");
            $("#camposOptions").addClass("in");
            
            CargarNotificacionesPropietario();
        </script>
    </body>
</html>
<%        }
    }  
    catch(NullPointerException ex){
        response.sendRedirect("/FutPlayFinal/index.html");
    }
%>
