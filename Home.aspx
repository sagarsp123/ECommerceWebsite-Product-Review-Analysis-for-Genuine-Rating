﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
  
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <!--::header part start::-->
    <header class="main_menu home_menu">
        <div class="container-fluid">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-11">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <a class="navbar-brand" href="index.html"> <img src="img/logo.png" alt="logo"> </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="menu_icon"><i class="fas fa-bars"></i></span>
                        </button>

                        <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="Home.aspx">Home</a>
                                </li>
                           
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_3"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Shop
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
                                        <a class="dropdown-item" href="category.aspx?cat_id=1"> 
                                            Male
                                            
                                        </a>
                                        <a class="dropdown-item" href="category.aspx?cat_id=2">Female</a>
                                        <a class="dropdown-item" href="category.aspx?cat_id=3">Kids</a>
                                      
                                    </div>
                                </li>
                                    <%-- <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_1"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Shop
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                        <a class="dropdown-item" href="category.aspx?cat_id=1">Male</a>
                                    </div>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                        <a class="dropdown-item" href="category.aspx?cat_id=2">Female</a>
                                    </div>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                        <a class="dropdown-item" href="category.aspx?cat_id=3">Kids</a>
                                    </div>
                                </li>--%>
                               
                              <%--  <li class="nav-item">
                                    <a class="nav-link" href="contact.html">Contact</a>
                                </li>--%>
                                 <li class="nav-item">
                                    <a class="nav-link" href="viewuser_review.aspx">View Review</a>
                                </li>
                                 <li class="nav-item">
                                    <a class="nav-link" href="userlogin.aspx">Login</a>
                                </li>
                                 <%--<li class="nav-item">
                                    <a class="nav-link" href="Home.aspx">Logout</a>
                                </li>--%>
                            </ul>
                        </div>
                        <div class="hearer_icon d-flex">
                            <div>
                               <%-- <a class="dropdown-toggle" href="cart_details.aspx" id="navbarDropdown3" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="ti-bag"></i>
                                </a>--%>
                                <a href="cart_details.aspx"><i class="ti-bag"></i></a>
                            </div>
                       <%--     <a id="search_1" href="javascript:void(0)"><i class="ti-search"></i></a>--%>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
         </header>
    <!-- Header part end-->

    <!-- banner part start-->
    <section class="banner_part">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-7">
                    <div class="banner_slider">
                        <div class="single_banner_slider">
                            <div class="banner_text">
                                <div class="banner_text_iner">
                                    <h1>Fashion Collection 2019</h1>
                                    <a href="category.html" class="btn_1">shop now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- banner part start-->

    <!-- feature_part start-->
    <section class="feature_part pt-4">
        <div class="container-fluid p-lg-0 overflow-hidden">
            <div class="row align-items-center justify-content-between">
                <div class="col-lg-4 col-sm-6">
                    <div class="single_feature_post_text">
                        <img src="img/feature_1.png" alt="#">
                        <div class="hover_text">
                            <a href="category.aspx?cat_id=1" class="btn_2">shop for male</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_feature_post_text">
                        <img src="img/feature_2.png" alt="#">
                        <div class="hover_text">
                            <a href="category.aspx?cat_id=2" class="btn_2">shop for female</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_feature_post_text">
                        <img src="img/feature_4.png" alt="#">
                        <div class="hover_text">
                            <a href="category.aspx?cat_id=3" class="btn_2">shop for kids</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- upcoming_event part start-->

   

    
    <!-- subscribe_area part start-->
    <section class="instagram_photo">
        <div class="container-fluid>
            <div class="row">
                <div class="col-lg-12">
                    <div class="instagram_photo_iner">
                        <div class="single_instgram_photo">
                            <img src="img/instagram/inst_1.png" alt="">
                            <a href="#"></a> 
                        </div>
                        <div class="single_instgram_photo">
                            <img src="img/instagram/inst_2.png" alt="">
                            <a href="#"></a> 
                        </div>
                        <div class="single_instgram_photo">
                            <img src="img/instagram/inst_3.png" alt="">
                            <a href="#"></a> 
                        </div>
                        <div class="single_instgram_photo">
                            <img src="img/instagram/inst_4.png" alt="">
                            <a href="#"></a> 
                        </div>
                        <div class="single_instgram_photo">
                            <img src="img/instagram/inst_5.png" alt="">
                            <a href="#"></a> 
                        </div>
                    </div>
                </div>
            </div>
      
    </section>
    <!--::subscribe_area part end::-->

    <!--::footer_part start::-->
    <footer class="footer_part">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-sm-6 col-lg-2">
                    <div class="single_footer_part">
                        <h4>Category</h4>
                        <ul class="list-unstyled">
                            <li><a href="productm.html">Male</a></li>
                            <li><a href="productf.html">Female</a></li>
                            <li><a href="soes.html">Shoes</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="single_footer_part">
                        <h4>Company</h4>
                        <ul class="list-unstyled">
                            <li><a href="">About</a></li>
                            <li><a href="">News</a></li>
                            <li><a href="">FAQ</a></li>
                            <li><a href="">Contact</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="single_footer_part">
                        <h4>Contact</h4>
                        <ul class="list-unstyled">
                            <li><a href="#">9892417997/9869315112</a></li>
                            <li><a>prabhusagar1305@gmail.com</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4">
                    <div class="single_footer_part">
                        <h4>Newsletter</h4>
                        <div id="mc_embed_signup">
                            <form target="_blank"
                                action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                                method="get" class="subscribe_form relative mail_part">
                                <input type="email" name="email" id="newsletter-form-email" placeholder="Email Address"
                                    class="placeholder hide-on-focus" onfocus="this.placeholder = ''"
                                    onblur="this.placeholder = ' Email Address '">
                                <button type="submit" name="submit" id="newsletter-submit"
                                    class="email_icon newsletter-submit button-contactForm">subscribe</button>
                                <div class="mt-10 info"></div>
                            </form>
                        </div>
                        <div class="social_icon">
                            <a href="#"><i class="ti-facebook"></i></a>
                            <a href="#"><i class="ti-twitter-alt"></i></a>
                            <a href="#"><i class="ti-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            
    </footer>
    <!--::footer_part end::-->

    <!-- jquery plugins here-->
    <script src="js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- easing js -->
    <script src="js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="js/swiper.min.js"></script>
    <!-- swiper js -->
    <script src="js/mixitup.min.js"></script>
    <!-- particles js -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <!-- slick js -->
    <script src="js/slick.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>
    <!-- custom js -->
    <script src="js/custom.js"></script>
    </div>
    </form>
</body>
</html>
