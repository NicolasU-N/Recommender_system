<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>Bike Store</title>
	
	<!-- Font Awesome  -->
  <script defer src="https://use.fontawesome.com/releases/v5.8.1/js/all.js"
    integrity="sha384-g5uSoOSBd7KkhAMlnQILrecXvzst9TdC09/VM+pjDTCM+1il8RHz5fKANTFFb+gQ"
    crossorigin="anonymous"></script>
	
	<!-- Bootstrap core CSS -->
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Custom styles for this template -->
	<link href="css/shop-homepage.css" rel="stylesheet">
</head>
<body>

	<!-- Navigation -->
	<jsp:include page="navbar.jsp"></jsp:include>

<div class="container" style="margin-left: 70px">
	<div class="col-sm-12" >
		
		<div id="carouselExampleIndicators" class="carousel slide my-4"
	data-ride="carousel" style="margin-left: 70px">
	<ol class="carousel-indicators">
		<li data-target="#carouselExampleIndicators" data-slide-to="0"
			class="active"></li>
		<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
	</ol>
	
	<div class="carousel-inner" role="listbox"style="margin-left: 70px">
		<div class="carousel-item active">
			<img class="d-block img-fluid" src="images/img3.png"
				alt="First slide">
		</div>
		<div class="carousel-item">
			<img class="d-block img-fluid" src="images/img2.png"
				alt="Second slide">
		</div>
		<div class="carousel-item">
			<img class="d-block img-fluid" src="images/img4.png"
				alt="Third slide">
		</div>
		<div class="carousel-item">
			<img class="d-block img-fluid" src="images/img1.png"
				alt="Four slide">
		</div>
	</div>
	<a class="carousel-control-prev" href="#carouselExampleIndicators"
		role="button" data-slide="prev" style="margin-left: 40px"> <span
		class="carousel-control-prev-icon" aria-hidden="true"></span><span
		class="sr-only">Previous</span>
	</a> 
	<a class="carousel-control-next" href="#carouselExampleIndicators"
		role="button" data-slide="next"> <span
		class="carousel-control-next-icon" aria-hidden="true"></span><span
		class="sr-only">Next</span>
	</a>
</div>
		
		
	</div>		
</div>




	

	


<!-- Noticias -->
  <div class="container-fluid" style="background-color: #F78225 ">
    <div>
      <p class="h1 text-center pb-3 pt-3" style="color: white">Acerca del Ciclismo</p>
    </div>
  </div>


  <div class="col-9 mx-auto mt-5">
    <!-- Card deck -->
    <div class="card-deck">

      <!-- Card -->
      <div class="card mb-4">

        <!--Card image-->
        <div class="view overlay">
          <img class="card-img-top" src="images/56547405_1748178251948598_3273246893278232576_n.svg"
            alt="Card image cap">
          <a href="#!">
            <div class="mask rgba-white-slight"></div>
          </a>
        </div>

        <!--Card content-->
        <div class="card-body">

          <!--Title-->
          <h4 class="card-title">Apertura Tienda</h4>
          <!--Text-->
          <p class="card-text">Apertura de la tienda ROSSETTI en Neiva</p>
          <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
          <div class="row justify-content-center">

            <button type="button" class="btn btn-light-blue btn-md stretched-link"><i
                class="fab fa-facebook-f text-white"></i></button>

          </div>
        </div>
      </div>
      <!-- Card -->

      <!-- Card -->
      <div class="card mb-4">

        <!--Card image-->
        <div class="view overlay">
          <img class="card-img-top" src="images/56547405_1748178251948598_3273246893278232576_n.svg"
            alt="Card image cap">
          <a href="#!">
            <div class="mask rgba-white-slight"></div>
          </a>
        </div>

        <!--Card content-->
        <div class="card-body">

          <!--Title-->
          <h4 class="card-title">Apertura Tienda</h4>
          <!--Text-->
          <p class="card-text">Apertura de la tienda ROSSETTI en Neiva</p>
          <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
          <div class="row justify-content-center">

            <button type="button" class="btn btn-light-blue btn-md stretched-link"><i
                class="fab fa-instagram text-white"></i></button>

          </div>

        </div>

      </div>
      <!-- Card -->

      <!-- Card -->
      <div class="card mb-4">

        <!--Card image-->
        <div class="view overlay">
          <img class="card-img-top" src="images/56547405_1748178251948598_3273246893278232576_n.svg"
            alt="Card image cap">
          <a href="#!">
            <div class="mask rgba-white-slight"></div>
          </a>
        </div>

        <!--Card content-->
        <div class="card-body">

          <!--Title-->
          <h4 class="card-title">Apertura Tienda</h4>
          <!--Text-->
          <p class="card-text">Apertura de la tienda ROSSETTI en Neiva</p>
          <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
          <div class="row justify-content-center">

            <button type="button" class="btn btn-light-blue btn-md stretched-link"><i
                class="fab fa-twitter text-white"></i></button>

          </div>

        </div>

      </div>
      <!-- Card -->

    </div>
    <!-- Card deck -->

  </div>

  <!-- Noticias -->



	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="js/ecommerce.js"></script>
	<script src="js/index.js"></script>
	
</body>
</html>