<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="Gradient Able Bootstrap admin template made using Bootstrap 4. The starter version of Gradient Able is completely free for personal project." />
<meta name="keywords" content=", Flat ui, Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
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
							<h5 class="m-b-10">Add Product</h5>

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
											<form method="post" action="../AdminController" enctype="multipart/form-data" id="hiddenForm">
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">Product Category</label>
													<div class="col-sm-10">
														<select name="productcategory" class="form-control" id="dropdown">
															<option value="opt1">-----Select product category-----</option>
															<option value="men">Men</option>
															<option value="women">Women</option>
															<option value="kids">Kids</option>
															<option value="accessories">Accessories</option>
														</select>
													</div>
												</div>
											
											    <div class="form-group row">
													<label class="col-sm-2 col-form-label">Product Type</label>
													<div class="col-sm-10">
														<select name="producttype" class="form-control" id="producttype">
															<option value="opt1">-----Select product type-----</option>
															<option value="shirt">Shirt</option>
															<option value="t-shirt">T-Shirt</option>
															<option value="jeanspant">Jeans Pant</option>
															<option value="cottonpant">Cotton Pant</option>
															<option value="dress">Dress</option>
															<option value="jacket">Jacket</option>
														</select>
													</div>
												</div>
												
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">Product Name</label>
													<div class="col-sm-10">
														<input type="text" class="form-control form-control-round"
															placeholder="Product Name" name="productname">
													</div>
												</div>
												
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">Original Price (INR)</label>
													<div class="col-sm-10">
														<input type="number" class="form-control form-control-round"
															placeholder="Product Original Price" name="originalprice">
													</div>
												</div>
												
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">Selling Price (INR)</label>
													<div class="col-sm-10">
														<input type="number" class="form-control form-control-round"
															placeholder="Product Selling Price" name="sellingprice">
													</div>
												</div>

												<div class="form-group row">
													<label class="col-sm-2 col-form-label">Product Image</label>
													<div class="col-sm-10">
														<input type="file" class="form-control" name="image">
													</div>
												</div>
												
												<button type="submit" class="form-bg-primary" style="width:150px;  height: 50px;" value="addproduct" name="action">Add Product</button>
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