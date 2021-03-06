                        <%@ page import="java.util.List"%>
<%@ page import="br.com.cinexd.models.Filme"%>
<%@ page import="br.com.cinexd.models.Sala" %>
<%@ page import="br.com.cinexd.models.Sessao" %>
<%@ page import="br.com.cinexd.models.PoltronaVendida" %>
<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cine Xd</title>
</head>
<body>


	<jsp:include page="/Views/content/content.jsp"></jsp:include>
	 <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="css/style.css">
	<div class="row">
		<div class="box col-md-12">
			<div class="box-inner">
				<div class="box-header well" data-original-title="">
					<h2>
						<i class="glyphicon glyphicon-edit"></i> Cadastrar Venda
					</h2>
                
				</div>
				<div class="box-content">
					<form role="form" action="/CineXd/VendaController" method="post" id="formulario">
                  <%  Sessao res=(Sessao) request.getAttribute("sessao");%>
                  <div class="form-group">
							<label>Filme :</label>
							<%=res.getFilme().getTitulo() %>
							<label>Género :</label>
							<%=res.getFilme().getGenero() %>
				 </div>	
				  <div class="form-group">
							<label>Faixa etaria :</label>
							<%=res.getFilme().getFaixaEtaria()%>
							<label>Idioma :</label>
							<%=res.getFilme().getIdioma() %>
				 </div>
				 <div class="form-group">
							<label>Duração :</label> 
							<%=res.getFilme().getDuracao() %>
				 </div>			
				 <div class="form-group">
							<label>Sessão :</label> 
							<%=res.getHorario() %>
				 </div>
				 <div class="form-group">
							<label>Valor inteira :</label> 
							<%=res.getValorInteira() %>
							<label>Valor meia:</label> 
							<%= (res.getValorInteira()/2) %>
							
				 </div>
                  <input type="hidden" name="sessao" value="<%=res.getId()%>">
                  <input type="hidden" name="valor" value="<%=res.getValorInteira()%>">
                  <input type="hidden" name="valormeia" value="<%=(res.getValorInteira()/2)%>">
                  <input type="hidden" name="usuario" value="${userAutenticado.id}"> 
                  <input type="hidden" id="quantidade" name="quantidade">
                  <div class="form-group">
							<label>Quantidade Meia :</label> 
							<input type="number" class="form-control"
								name="qtdMeia" placeholder="Ex:2">
							
				 </div>
					<!-- --------------------------inicio  -->	
						
                       
      <div class="hall" id="hall">
  <!-- Высота wrapper это высота зала плюс, его pagging 50px сверху 10px снизу   -->
  <div class="hall__wrapper" style="height: 400px;">
    <div class="hall__box" style="width: 260px;">
      <div class="hall__screen">
        <span class="hall__screen-tip _left">Tela</span>
        <div class="hall__screen-cloth"></div>
        <span class="hall__screen-tip _right">Tela</span>
      </div>
      <div class="hall_places">
        <span class="hall__row">
                         
              <% 
              List<PoltronaVendida> resultPoltronaVendida=(List<PoltronaVendida>) request.getAttribute("poltronaVendida");
              int top=320;  
              for(int f=1;f<=res.getSala().getQuantidadeFileira() ;f++){ 
                    
                  %> 
                         
         <span class="hall__row">
                         
                            <div  class="hall__places-row _left" data-row="<%=f %>" data-tribune="<%=f %>" style="top: <%=top %>px"></div>
                              <% for(int i=1;i<=res.getSala().getQuantidadePoltronaFileira();i++){  int pos=20*i;
                              %>
                              <%  int cont=0;
                                   String classe="";
							      for (PoltronaVendida poltronaVendida : resultPoltronaVendida) { 
							    	  if((poltronaVendida.getFileira()==f)&&(poltronaVendida.getNumero()==i)){ 
							    		 classe="hall__places-item is-busy";
							    		 break;
							    	  }else{  classe="hall__places-item is-free"; } cont++; }
							      if(cont==0){classe="hall__places-item is-free";} %>
							    	
							     <div  class="<%=classe %>"   data-row="<%=f %>" data-column="<%=i %>" data-sector="0" data-tribune="1" data-price-id="1" data-pos-x="<%=i %>" data-pos-y="15" data-state="free" data-price="<%=res.getValorInteira() %>"  data-id="387686" data-building-id="6397" data-hall-id="6398" data-show-id="2821" data-place-size="20" style="left:<%=pos %>px;top: <%=top %>px; ">
                                  <div class="hall__places-chair" data-title="R$ <%=res.getValorInteira() %>" data-toggle="tooltip" data-placement="top"><%=f%>-<%=i %></div>
                              </div>
                              
							    
							    
                               
                              <%  } %>
                            <div class="hall__places-row _right" data-row="<%=f %>" data-tribune="<%=f %>" style="top: <%=top %>px"></div>
          </span>               
           <%  top=top-20;  } %>
      </div>
    </div><span class="hall__row">
    
    
  </span>
  
  </div>
  
  
  <span class="hall__row">
  <div class="hall-info">
    <div class="hall-info__title">
     	Sala <%=res.getSala().getNumero() %>
    </div>
    <div class="hall-info__legend is-dark">
      <div class="hall-info__story is-free">
        <div class="hall-info__story-pointer"></div>
        <div class="hall-info__story-descr">Poltrona Livre</div>
      </div>
      <div class="hall-info__story is-busy">
        <div class="hall-info__story-pointer"></div>
        <div class="hall-info__story-descr">Poltrona Ocupada</div>
      </div>
      <div class="hall-info__story is-checked">
        <div class="hall-info__story-pointer"></div>
        <div class="hall-info__story-descr">Poltrona Escolhida</div>
      </div>
    </div>
  </div>
</span>
</div>

  
  
<span class="hall__row">
<div class="hall-buy">
	 
	  
     <div class="col-xs-15 col-sm-16 col-md-15 hall-buy__places" id='hallPlaces'>
       
      </div>
</div>
</span>
<span class="hall__row">
<div class="hall-buy">
	  <div class="hall-buy__no-data col-xs-12 col-md-8" id='hallNoData'>
	    Selecionar Assentos
	  </div>
	  <div class="hall-buy__data hidden col-xs-12 col-md-8" id='hallData'>
	    <div class="row">
		      <div class="col-xs-12 col-sm-4 col-md-3 hall-buy__overall">
		        Quantidade
		        <br \ />
		        <span class="hall-buy__overall-count" id='hallCountTickets'>0 bilhetes</span>
		      </div> 
	     </div>
	  </div>
 
</div>
</span>
      
        <script src="../../js/index.js"></script>
        <script src="js/index.js"></script>
    
  
						

					<!-- ---------------fimmm -->

						<button type="submit" name="action" value="proximoTerceira" class="btn btn-default">Próximo </button>
					</form>

				</div>
			</div>
		</div>
		<!--/span-->

	</div>
	<!--/row-->
   

	<jsp:include page="/Views/footer/footer.jsp"></jsp:include>

</body>
	<script type="text/javascript" src="js/jquery.validate.js"></script>
	<script type="text/javascript" src="js/validate.js"></script>
</html>                                                                                                                                                                                                                                                                                                                                       