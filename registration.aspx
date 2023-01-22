<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link rel="icon" href="img/favicon.png">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- animate CSS -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- owl carousel CSS -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<!-- font awesome CSS -->
	<link rel="stylesheet" href="css/all.css">
	<link rel="stylesheet" href="css/nice-select.css">
	<!-- flaticon CSS -->
	<link rel="stylesheet" href="css/flaticon.css">
	<link rel="stylesheet" href="css/themify-icons.css">
	<!-- font awesome CSS -->
	<link rel="stylesheet" href="css/magnific-popup.css">
	<!-- swiper CSS -->
	<link rel="stylesheet" href="css/slick.css">
	<!-- swiper CSS -->
	<link rel="stylesheet" href="css/price_rangs.css">
	<!-- style CSS -->
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
    <form id="form1" runat="server">
        <center>
    <div class="container">
    
		<div class="section-top-border">
			<div class="row">
				<div class="col-lg-8 col-md-8">
					<h3 class="mb-30">Registration Form </h3>
					
						<%--<div class="mt-10">
							<input type="text" name="first_name" placeholder="First Name"
								onfocus="this.placeholder = ''" onblur="this.placeholder = 'First Name'" required
								class="single-input">
						</div>
						<div class="mt-10">
							<input type="text" name="last_name" placeholder="Last Name" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Last Name'" required class="single-input">
						</div>--%>
						<div class="mt-10">
						<%--	<input type="text" name="last_name" placeholder="Last Name" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Last Name'" required class="single-input">--%>
                              <asp:TextBox ID="txtname" runat="server" placeholder="Name" required class="single-input" onfocus="this.placeholder = ''"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Name" ControlToValidate="txtname"></asp:RequiredFieldValidator>

						</div>
						<div class="mt-10">
							<%--<input type="email" name="EMAIL" placeholder="Email address" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Email address'" required class="single-input">--%>
                             <asp:TextBox ID="txtemail" runat="server" placeholder="Email Address" required class="single-input" onfocus="this.placeholder = ''"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Email_id" ControlToValidate="txtemail"></asp:RequiredFieldValidator>
						</div>
                    <div class="mt-10">
							<%--<input type="text" name="PASSWORD" placeholder="Email address" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Email address'" required class="single-input">--%>
                          <asp:TextBox ID="txtpassword" runat="server" placeholder="Password" required class="single-input" onfocus="this.placeholder = ''"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>

						</div>
                    <div class="mt-10">
						<%--	<input type="text" name="last_name" placeholder="Last Name" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Last Name'" required class="single-input">--%>
                              <asp:TextBox ID="txtcontact" runat="server" placeholder="Contact No" required class="single-input" onfocus="this.placeholder = ''"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Mobile No" ControlToValidate="txtcontact"></asp:RequiredFieldValidator>

						</div>
						<div class=" mt-10">
							<div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
							<%--<input type="text" name="address" placeholder="Address" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Address'" required class="single-input">--%>
                             <asp:TextBox ID="txtaddress" runat="server" placeholder="Address" required class="single-input" onfocus="this.placeholder = ''"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Address" ControlToValidate="txtaddress"></asp:RequiredFieldValidator>

						</div>
                    
                      <div class="col-md-12 form-group">
                                   
                             
                                    <asp:Button ID="btnregistration" runat="server" Text="Submit" class="btn_3" OnClick="btnregistration_Click"/>
                                    
                                </div>
					
					
				</div>
			
			</div>
		</div>
        
        <!-- jquery plugins here-->
	<!-- jquery -->
	<script src="js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- easing js -->
	<script src="js/jquery.magnific-popup.js"></script>
	<!-- swiper js -->
	<script src="js/swiper.min.js"></script>
	<!-- carousel js -->
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
            </center>
    </form>
</body>
</html>
