


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
		
<%
	String category_id = request.getParameter("id");
	if (category_id == null){
		category_id = "1";	
	}
	
	int user_id=0;
	try {
	user_id =(int)session.getAttribute("user_id");
	System.out.println("-----------> "+user_id);
	} 
	catch (Exception e) {
		//System.out.println("Error: " + e.toString());
		user_id=-1; // Para que me recomiende algo
	}
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>Shop Homepage - Start Bootstrap Template</title>
	
	<!-- Bootstrap core CSS -->
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Custom styles for this template -->
	<link href="css/shop-homepage.css" rel="stylesheet">
</head>
<body>
	<!-- Navigation -->
	<jsp:include page="navbar.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<h1 class="my-4">Shop Name</h1>
				<div class="list-group" id="div_categories"></div>
			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">
				<!-- Navigation -->
				<jsp:include page="carousel.jsp"></jsp:include>
	
				<div class="row" id="div_products"></div>
				
				<hr>
				<h2 class="my-4">Recommended products</h2>
				
				<div class="row" id="div_recommended"></div>
				<!-- /.row -->
			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
	
	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="js/ecommerce.js"></script>
	<script src="js/index.js"></script>



	<script>
	  	$(document).ready(function(){
	  		var category_id = <%= category_id %>;	
			getCategories(category_id);
			getProducts(category_id);
			
			updateItemsCount();
			
	  		
	  		var url="";
	  		
	  		if(<%= user_id %> < 0){
	  			url="http://127.0.0.1:5000/new"	
	  		}else{
	  			url="http://127.0.0.1:5000/user/"+<%= user_id %>
	  		}
	  								
				//Función para recomendar usuario NEW
			$.getJSON(url, function(data){
				
				console.log(data);
				var cadena_falsk = data.recommendedProducts.toString();
				
			    var arrayDeCadenas = cadena_falsk.split("|");
			    console.log(cadena_falsk);
			    console.log("|");
			    console.log(arrayDeCadenas.length);

			    //$('#div_recommended').empty();
			    for (var i=0; i < arrayDeCadenas.length; i++) { 
			    	console.log(arrayDeCadenas[i]);
			    	var id_primary = arrayDeCadenas[i];			    	
			    	
			    	$.getJSON("services/product/" + id_primary, function(result){
			        	data = result.data; 
			        	//$('#div_recommended').empty();
			        	for(var row=0; row<data.length; row=row+1){
			        		var id = data[row].id;
			        		var name = data[row].name;
			        		var pricing = data[row].pricing;
			        		var short_description = data[row].short_description;
			        		var icon = data[row].icon;
			        		
			        		var dp = '';
			        		dp += '<div class="col-lg-4 col-md-6 mb-4">';
			        		dp += '<div class="card h-100">';
			        		dp += '<a href="#"><img class="card-img-top" src="images/' + icon + '" alt=""></a>';
			        		dp += '<div class="card-body">';
			        		dp += '<h4 class="card-title">';
			        		dp += '<a href="item.jsp?id=' + id + '">' + name + '</a>';
			        		dp += '</h4>';
			        		dp += '<h5>$' + pricing.toFixed(2) + '</h5>';
			        		dp += '<p class="card-text">' + short_description + '</p>';
			        		//dp += '<button type="button" class="btn btn-primary btn-sm">Buy</button>';
			        		dp += '<a href="javascript:addToCart(' + id + ');" class="btn btn-info" role="button">Buy</a>';
			        		dp += '</div>';
			        		dp += '<div class="card-footer">';
			        		dp += '<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>';
			        		dp += '</div>';
			        		dp += '</div>';
			        		dp += '</div>';
			        		
			        		$("#div_recommended").append(dp);       	
			        	}
			        });    	
			    				    	
			     
			    }
			  						  
				$.each(data, function(key, val){
				    alert("Productos Recomendados: "+data.recommendedProducts); 
				});
			});

						
			/** funciona...
			$.getJSON(url, function(data){
				
				console.log(data);
				var cadena_falsk = data.recommendedProducts.toString();
				
			    var arrayDeCadenas = cadena_falsk.split("|");
			    console.log(cadena_falsk);
			    console.log("|");
			    console.log(arrayDeCadenas.length);

			    for (var i=0; i < arrayDeCadenas.length; i++) { 
			    	console.log(arrayDeCadenas[i]);
			    }
			  						  
				$.each(data, function(key, val){
				    alert(data.recommendedProducts); 
				});
			});			
			**/
							
		});
	</script>

</body>
</html>