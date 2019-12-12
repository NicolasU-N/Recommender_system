<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>Shop Homepage - Start Bootstrap Template</title>
	
	<!-- Font Awesome  -->
  <script defer src="https://use.fontawesome.com/releases/v5.8.1/js/all.js"
    integrity="sha384-g5uSoOSBd7KkhAMlnQILrecXvzst9TdC09/VM+pjDTCM+1il8RHz5fKANTFFb+gQ"
    crossorigin="anonymous"></script>
	
	<!-- Bootstrap core CSS -->
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Custom styles for this template -->
	<link href="css/shop-homepage.css" rel="stylesheet">
	
	<link href="css/cart.css" rel="stylesheet">
</head>

<body>
	<!-- Navigation -->
	<jsp:include page="navbar.jsp"></jsp:include>

	<!-- Page Content -->
	<!-- <script src="https://use.fontawesome.com/c560c025cf.js"></script>c
	<!--<br/>-->
	<div class="container m-5">
	   <div class="card shopping-cart">
	            <div class="card-header bg-dark text-light">
	                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
	                Shopping cart
	                <a href="./home_tienda.jsp" class="btn btn-outline-info btn-sm pull-right" style="margin-left: 800px" >Continue shopping</a>
	                <div class="clearfix"></div>
	            </div>
	            <div id="div_items" class="card-body">        
	                <div class="pull-right" style="margin: 5px">
	                    <a href="" class="btn btn-outline-secondary pull-right" >
	                        Update shopping cart
	                    </a>
	                </div>
	            </div>
	            <div class="card-footer">	                
	                <div class="pull-right" style="margin: 10px">
	                    <a href="javascript:checkout();" id="checkout" class="btn btn-success pull-right">Comprar</a>
	                    <div class="pull-right" style="margin: 5px">
	                        Precio Total: <b id="total">$0.00</b>
	                    </div>
	                </div>
	            </div>
	        </div>
	</div>
	
	<br/>
	<br/>
		
	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="js/ecommerce.js"></script>
	<script src="js/cart.js"></script>
	
	<script>
	$(document).ready(function(){
		getItems();
		updateItemsCount();
	});
	</script>

</body>
</html>