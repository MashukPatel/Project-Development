<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description"
	content="Gradient Able Bootstrap admin template made using Bootstrap 4. The starter version of Gradient Able is completely free for personal project." />
<meta name="keywords"
	content=", Flat ui, Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="codedthemes">
<!-- Favicon icon -->
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
<!-- Google font-->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600"
	rel="stylesheet">
<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap/css/bootstrap.min.css">
<!-- themify-icons line icon -->
<link rel="stylesheet" type="text/css"
	href="assets/icon/themify-icons/themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="assets/icon/font-awesome/css/font-awesome.min.css">
<!-- ico font -->
<link rel="stylesheet" type="text/css"
	href="assets/icon/icofont/css/icofont.css">
<!-- Style.css -->
<link rel="stylesheet" type="text/css" href="assets/css/style.css">
<link rel="stylesheet" type="text/css"
	href="assets/css/jquery.mCustomScrollbar.css">

</head>
<body>
	<%@ include file="design.jsp"%>

	<div class="pcoded-content">
		<div class="pcoded-inner-content">

			<!-- Main-body start -->
			<div class="main-body">
				<div class="page-wrapper">
					<!-- Page-header start -->
					<div class="page-header card">
						<div class="card-block">
							<h5 class="m-b-10">Add Product Details</h5>

						</div>
					</div>
					<!-- Page-header end -->

					<!-- Page body start -->
					<div class="page-body">
						<div class="row">
							<div class="col-sm-12">
								<!-- Basic Form Inputs card start -->
								<div class="card">
									<div class="card-header">
										<div class="card-block">
											<h4 class="sub-title">Product Details</h4>
											<form action="" method="post" id="myForm">
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">Product Category</label>
													<div class="col-sm-10">
														<select id="selectcategory" class="form-control" name="selectcategory">
															<option value="-1">-----Select Product Category-----</option>
															<option value="men">Men</option>
															<option value="women">Women</option>
															<option value="kids">Kids</option>
															<option value="Accessories">Accessories</option>
														</select>

													</div>
												</div>

												<div class="form-group row">
													<label class="col-sm-2 col-form-label">Sub Product Category</label>
													<div class="col-sm-10">
														<select id="selectsubcategory" class="form-control" name="selectsubcategory">
															<option value="-1">-----Select Sub Product Category-----</option>
															<option value="shirt">Shirt</option>
															<option value="t-shirt">T-shirt</option>
															<option value="dress">Dress</option>
															<option value="jacket">Jacket</option>
															<option value="jeanspant">Jeans</option>
														</select>

													</div>
												</div>
												
												<button type="submit" class="form-bg-primary" style="width:150px;  height: 50px;" value="filldetails" name="action">Fill Details</button>
											</form>

    									</div>
									</div>
								</div>
								<!-- Page body end -->
							</div>
						</div>
						<!-- Main-body end -->
						<div id="styleSelector"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	
	<script>
        // Get the dropdown element and the form
        var category = document.getElementById("selectcategory");
        var subcategory = document.getElementById("selectsubcategory");
        var form = document.getElementById("myForm");

        // Add event listener to the dropdown
        form.addEventListener("submit", function(event) {
            // Prevent the default form submission
            event.preventDefault();

            // Get the selected values from both dropdowns
            var selectedOption1 = selectcategory.value;
            var selectedOption2 = selectsubcategory.value;

            // Redirect based on selected values
            if (((selectedOption1 === "men") || (selectedOption1 === "women")) && ((selectedOption2 === "shirt") || selectedOption2 ==="t-shirt")) {
                window.location.href = "addshirtdetail.jsp?selectcategory="+ selectedOption1+"&selectsubcategory="+selectedOption2;
            }
            else if (((selectedOption1 === "men") || (selectedOption1 === "women")) && selectedOption2 === "jeanspant") {
                window.location.href = "addjeansdetail.jsp?selectcategory="+ selectedOption1+"&selectsubcategory="+selectedOption2;
            }
            else if (((selectedOption1 === "men") || (selectedOption1 === "women")) && selectedOption2 === "jacket") {
                window.location.href = "addjacketdetail.jsp?selectcategory="+ selectedOption1+"&selectsubcategory="+selectedOption2;
            }
            else if (selectedOption1 === "women"&& selectedOption2 === "dress") {
                window.location.href = "adddressdetail.jsp?selectcategory="+ selectedOption1+"&selectsubcategory="+selectedOption2;
            }
            else {
                alert("Please select valid options.");
            }
        });   
     </script>

	<script type="text/javascript" src="assets/js/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="assets/js/jquery-ui/jquery-ui.min.js"></script>
	<script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>
	<script type="text/javascript"
		src="assets/js/bootstrap/js/bootstrap.min.js"></script>
	<!-- jquery slimscroll js -->
	<script type="text/javascript"
		src="assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
	<!-- modernizr js -->
	<script type="text/javascript" src="assets/js/modernizr/modernizr.js"></script>
	<script type="text/javascript"
		src="assets/js/modernizr/css-scrollbars.js"></script>

	<!-- Custom js -->
	<script type="text/javascript" src="assets/js/script.js"></script>
	<script src="assets/js/pcoded.min.js"></script>
	<script src="assets/js/vartical-demo.js"></script>
	<script src="assets/js/jquery.mCustomScrollbar.concat.min.js"></script>

</body>
</html>