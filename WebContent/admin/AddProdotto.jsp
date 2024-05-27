<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<script type="text/javascript" >
var ns6=document.getElementById&&!document.all

function restrictinput(maxlength,e,placeholder){
if (window.event&&event.srcElement.value.length>=maxlength)
return false
else if
(e.target&&e.target==eval(placeholder)&&e.target.value.length>=maxlength){
var pressedkey=/[a-zA-Z0-9.,/]/
if (pressedkey.test(String.fromCharCode(e.which)))
e.stopPropagation()
}
}

function countlimit(maxlength,e,placeholder){
var theform=eval(placeholder)
var lengthleft=maxlength-theform.value.length
var placeholderobj=document.all? document.all[placeholder] :
document.getElementById(placeholder)
if (window.event||e.target&&e.target==eval(placeholder)){
if (lengthleft<0)
theform.value=theform.value.substring(0,maxlength)
placeholderobj.innerHTML=lengthleft
}
}

function displaylimit(theform,thelimit){
var limit_text='<strong><span
id="'+theform.toString()+'">'+thelimit+'</span></strong> caratteri rimanenti'
if (document.all||ns6)
document.write(limit_text)
if (document.all){
eval(theform).onkeypress=function(){ return
restrictinput(thelimit,event,theform)}
eval(theform).onkeyup=function(){ countlimit(thelimit,event,theform)}
}
else if (ns6){
document.body.addEventListener('keypress', function(event) {
restrictinput(thelimit,event,theform) }, true);
document.body.addEventListener('keyup', function(event) {
countlimit(thelimit,event,theform) }, true);
}
}

</script>
<meta charset="ISO-8859-1">
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">

<title>Aggiungi prodotto</title>
</head>
<body>


	<%@ include file="../fragments/header.jsp" %>
	<%@ include file="../fragments/menu.jsp" %>
	
	
	<div id="main" class="clear">
	
		<h2>AGGIUNGI PRODOTTO</h2>

	<form action="../catalogo" method="post" id="myform" name= "formins">
		<input type="hidden" name="action" value="add">
		<input type="hidden" name="page" value="admin/GestioneCatalogo.jsp"><br><br>
		<div class="tableRow">
			<p>Nome:</p>
			<p><input type="text" name="nome" value="" required></p>
		</div>
		<div class="tableRow">
			<p>Descrizione:</p>
			<p><input type="text" name="descrizione" value="" required></p>
		</div>
		<div class="tableRow">
			<p>Iva:</p>
			<p><input type="text" name="iva" value="" required></p>
		</div>
		<div class="tableRow">
			<p>Prezzo:</p>
			<p><input type="text" name="prezzo" value="" required></p>
		</div>		
		<div class="tableRow">
			<p>Data:</p>
			<p><input type="text" name="dataUscita" value="" placeholder = "dd-mm-yyyy" required></p>
		</div>
		<div class="tableRow">
			<p>Quantità:</p>
			<p><input type="number" name="quantità" value="" required></p>
		</div>
		<div class="tableRow">
			<p>Immagine:</p>
			<p><input type="text" name="img" value="" required></p>
		</div>
		<div class="tableRow">
			<p>Piattaforma:</p>
			<p><input type="text" name="piattaforma" value="" required></p>
		</div>
		<div class="tableRow">
			<p>Genere:</p>
			<p><input type="text" name="genere" value="" placeholder="M/F/O" required></p>
		</div>
		<div class="tableRow">	
			<p>Descrizione dettagliata:</p>
			<p><input type="text" name="descDett" value=""></p>
		</div>
		<div class="tableRow">
			<p></p>
			<p><input type="submit" value="aggiungi"></p>
		</div>
	</form>
	
	</div>
<script type="text/javascript" >displaylimit("document.formins.nome",50) </script>
<script type="text/javascript" >displaylimit("document.formins.descDett",150)</script>
<script type="text/javascript" >displaylimit("document.formins.genere",1)</script>
<script type="text/javascript" >displaylimit("document.formins.img",10)</script>
<script type="text/javascript" >displaylimit("document.formins.piattaforma",10)</script>
<script type="text/javascript" >displaylimit("document.formins.dataUscita",8)</script>
<script type="text/javascript" >displaylimit("document.formins.descrizione",)50</script>
	<%@ include file="../fragments/footer.jsp" %>

</body>
</html>