<%@page import="org.eclipse.jdt.internal.compiler.util.HashtableOfObjectToInt"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ashion | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
<%
int count=0;
%>

<script>
        function sendData(id) {
            // Get the value from the input field
            var cid = id;

            // Create a new XMLHttpRequest object
            var xhr = new XMLHttpRequest();

            // Configure the AJAX request
            xhr.open("POST", "CartController?cartid=" + cid, true);

            // Define the onload callback function
            

            // Send the AJAX request
            xhr.send();
            location.reload();
        }
        function minusValue(id){
        	
        	var value1=document.getElementById(id).value;
        	var intvalue=parseInt(value1);
        	var newvalue=intvalue-1;
        	
        	var itemvalue=document.getElementById("item").innerText;
        	var intitem=parseInt(itemvalue);
        	var item=intitem-1;
        	
        	var value2=document.getElementById("cartprice").innerText;
        	var intcartprice=parseInt(value2);
        	var temp=id+"oprice";
        	var value3=document.getElementById(temp).innerText;
        	var intoprice=parseInt(value3);
        	
        	var cartprice=intcartprice - intoprice;
        	
        	var value4=document.getElementById("discount").innerText;
        	var intdiscountprice=parseInt(value4);
        	var temp1=id+"price";
         	var value5=document.getElementById(temp1).innerText;
         	var sprice=parseInt(value5);
        	var disvalue=intoprice - sprice;
        	var discount= intdiscountprice - disvalue;
        	
        	var value6=document.getElementById("deliverycharge").innerText;
        	var deliverycharge=parseInt(value6);
        	
        	
        	
        	
        	if(newvalue>=0)
        		{
        		document.getElementById(id).value=newvalue;	
        		document.getElementById("item").textContent=item;
        		document.getElementById("cartprice").innerText=cartprice;
            	document.getElementById("discount").innerText=discount;
            	document.getElementById("save").innerText=discount;
            	
        		if(item<=1)
        			{
        			document.getElementById("ses").textContent="item)";
        			}
        		else
        			{
        			document.getElementById("ses").textContent="items)";
        			}
        		
        		if(newvalue===0)
        			{
        			var newde=deliverycharge - 40;
        			deliverycharge=newde;
            		document.getElementById("deliverycharge").innerText=newde;
        			}
        		
        		var totalamount= (cartprice + deliverycharge) - discount;
        		document.getElementById("totalamount").innerText=totalamount;	
        		}
        	else
        		{
        		document.getElementById(id).value="0";
        		}
        	
        	
        }
        
         function plusValue(id){
       
        	var chargetemp=1;
        	var value1=document.getElementById(id).value;
        	var intvalue=parseInt(value1);
        	if(intvalue===0)
        		{
        		chargetemp=0;
        		}
        	var newvalue=intvalue+1;
        	
        	var itemvalue=document.getElementById("item").innerText;
        	var intitem=parseInt(itemvalue);
        	var item=intitem+1;
        	
        	var value2=document.getElementById("cartprice").innerText;
        	var intcartprice=parseInt(value2);
        	var temp=id+"oprice";
        	var value3=document.getElementById(temp).innerText;
        	var intoprice=parseInt(value3);
        	var cartprice=intcartprice + intoprice;
        	
        	var value4=document.getElementById("discount").innerText;
        	var intdiscountprice=parseInt(value4);
        	var temp1=id+"price";
         	var value5=document.getElementById(temp1).innerText;
         	var sprice=parseInt(value5);
        	var disvalue=intoprice - sprice;
        	var discount= intdiscountprice + disvalue;
        	
        	var value6=document.getElementById("deliverycharge").innerText;
        	var deliverycharge=parseInt(value6);
        	
        	if(chargetemp==0)
   		    {
   		     var newde=deliverycharge + 40;
   		     deliverycharge=newde;
    		 document.getElementById("deliverycharge").innerText=newde;
    		 chargetemp=1;
   		    }
        	var totalamount= (cartprice + deliverycharge) - discount;
        	
        	document.getElementById("cartprice").innerText=cartprice;
        	document.getElementById("discount").innerText=discount;
        	document.getElementById("totalamount").innerText=totalamount;
        	document.getElementById("save").innerText=discount;
        	
            document.getElementById(id).value=newvalue; 
        	document.getElementById("item").textContent=item;
        	if(item<=1)
			{
			document.getElementById("ses").textContent="item)";
			}
		    else
			{
			document.getElementById("ses").textContent="items)";
			}
			
        	
        }
         
         function showtotalprice(id){
        	 
        	var value1=document.getElementById(id).value;
         	var qty=parseInt(value1);
         	
         	var temp=id+"price";
         	var value2=document.getElementById(temp).innerText;
         	var price=parseInt(value2);
         	var totalprice=price * qty;
         	
         	var temp2=id+"totalprice";
         	document.getElementById(temp2).innerText=totalprice;
         	
         }
    </script>

<style type="text/css">
	.discount_text
	{
		display:inline;
		color: green;
		font-size: 14px;
		font-weight: bold;
	}
</style>

</head>
<body>
<%@ include file="cust-header.jsp" %>

<!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <span>Shopping cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shop Cart Section Begin -->
    <section class="shop-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shop__cart__table">
                        <table >
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Quantity</th>                      
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                        
                                        <%
                                        int cartprice=0,dprice=0,tamount=0,dcharge=0;
                                        Object id=session.getAttribute("customerid");
                                        int cid=((Integer) id).intValue();
                                        Connection con=new DBUtil().getConnectionData();
                                        String query="";
                                        query="select * from customercart where customerid=?";
                                        PreparedStatement st;
                                        ResultSet rs;
                                        st=con.prepareStatement(query);
                                        st.setInt(1,cid);
                                        rs=st.executeQuery();
                                        while(rs.next())
                                        {
                                        	count++;
                                        	cartprice=cartprice + rs.getInt(10);
                                        	dprice=(rs.getInt(10) - rs.getInt(5)) + dprice; 
                                        	
                                        %>
                                        <tr>
                                    <td class="cart__product__item">
                                
                                        <img src="productimages/<%=rs.getString(9)%>" alt="" style="width: 100px; height: 120px;">
                                        <div class="cart__product__item__title">
                                            <h6><%=rs.getString(4) %></h6>
                                            <h6>Size: <%=rs.getString(6) %>  |  Color: <%=rs.getString(7) %></h6>
                                            <div class="rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="cart__price" id="price"><del style="font-size: 13px;">&#8377; <span id="<%=rs.getInt(1)%>oprice"><%=rs.getInt(10) %></span></del> <p class="cart__price">&#8377; <span id="<%=rs.getInt(1)%>price" sty><%=rs.getInt(5) %></span> &nbsp; <span class="discount_text"><%=rs.getString(11) %> off</span> </p> </td>
                                    <td class="cart__quantity">
                                        <div>
                                            <span class="dec qtybtn" style="cursor: pointer;" onclick="minusValue('<%=rs.getInt(1)%>'); showtotalprice('<%=rs.getInt(1)%>');">-</span>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="text" value="1" id="<%=rs.getInt(1)%>" style="width: 28px; border: none;">
                                            &nbsp;&nbsp;&nbsp;
                                            <span class="inc qtybtn" style="cursor: pointer;" onclick="plusValue('<%=rs.getInt(1)%>'); showtotalprice('<%=rs.getInt(1)%>');">+</span>
                                        </div>
                                    </td>
                                    <td class="cart__total">&#8377; <span id="<%=rs.getInt(1)%>totalprice"> <%=rs.getInt(5) %> </span></td>
                                    <td class="cart__close"><span class="icon_close" onclick="sendData('<%=rs.getInt(1)%>')"></span></td>
                                </tr>
                                
                                <%
                                        }
                                        con.close();
                                        dcharge=count * 40;
                                        tamount= (cartprice + dcharge) - dprice;
                                %>
                                
                            </tbody>
                        </table>
           
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="cart__btn">
                        <a href="#">Continue Shopping</a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="cart__btn update__btn">
                        <a href="#"><span class="icon_loading"></span> Update cart</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="discount__content">
                        <h6>Discount codes</h6>
                        <form action="#">
                            <input type="text" placeholder="Enter your coupon code">
                            <button type="submit" class="site-btn">Apply</button>
                        </form>
                    </div>
                </div>
                <div class="col-lg-4 offset-lg-2">
                    <div class="cart__total__procced">
                        <h6>Price Details</h6>
                        <ul>
                        <br>
                            <li>Price (<label id="item"><%=count %></label> <%String i=""; if(count>1){i="items)";} else {i="item)";}%><label id="ses"><%=i %></label> <span> &#8377; <label id="cartprice"><%=cartprice %></label></span></li>
                            <li>Discount <span style="color: green;">-&#8377; <label id="discount"><%=dprice %></label> </span></li>
                            <li>Delivery Charges <span>&#8377; <label id="deliverycharge"><%=dcharge %></label> </span></li>
                            <li style="font-weight: bold; font-size: 18px;"><label>Total Amount</label> <span>&#8377; <label id="totalamount"><%=tamount %> </label> </span></li>
                            <li style="color: green; font-size: 15px;">You will save &#8377;<label id="save"><%=dprice %></label> on this order</li>
                        </ul>
                        <a href="#" class="primary-btn">Place Order</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Cart Section End -->

    <!-- Instagram Begin -->
    <div class="instagram">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="img/instagram/insta-1.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="img/instagram/insta-2.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="img/instagram/insta-3.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="img/instagram/insta-4.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="img/instagram/insta-5.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="img/instagram/insta-6.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Instagram End -->

    <!-- Footer Section Begin -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-7">
                    <div class="footer__about">
                        <div class="footer__logo">
                            <a href="./index.html"><img src="img/logo.png" alt=""></a>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                        cilisis.</p>
                        <div class="footer__payment">
                            <a href="#"><img src="img/payment/payment-1.png" alt=""></a>
                            <a href="#"><img src="img/payment/payment-2.png" alt=""></a>
                            <a href="#"><img src="img/payment/payment-3.png" alt=""></a>
                            <a href="#"><img src="img/payment/payment-4.png" alt=""></a>
                            <a href="#"><img src="img/payment/payment-5.png" alt=""></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-5">
                    <div class="footer__widget">
                        <h6>Quick links</h6>
                        <ul>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Blogs</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">FAQ</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-4">
                    <div class="footer__widget">
                        <h6>Account</h6>
                        <ul>
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Orders Tracking</a></li>
                            <li><a href="#">Checkout</a></li>
                            <li><a href="#">Wishlist</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-8 col-sm-8">
                    <div class="footer__newslatter">
                        <h6>NEWSLETTER</h6>
                        <form action="#">
                            <input type="text" placeholder="Email">
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                        <div class="footer__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-youtube-play"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    <div class="footer__copyright__text">
                        <p>Copyright &copy; <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
                    </div>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search End -->


<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>