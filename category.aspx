<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="category.aspx.cs" Inherits="_Default" EnableEventValidation="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!--================Category Product Area =================-->
    <section class="cat_product_area section_padding border_top">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="left_sidebar_area">
                        <aside class="left_widgets p_filter_widgets sidebar_box_shadow">
                            <div class="l_w_title">
                                <h3>Browse Categories</h3>
                            </div>
                            <div class="widgets_inner">
                                <ul class="list">
                                    <li>
                                        <a href="category.aspx?cat_id=1">Men</a>
                                    </li>
                                    
                                    <li>
                                        <a href="category.aspx?cat_id=2">Women</a>
                                    </li>
                                    
                                    <li>
                                        <a href="category.aspx?cat_id=3">Kids</a>
                                    </li>
                                    
                                </ul>
                            </div>
                        </aside>

                        <aside class="left_widgets p_filter_widgets sidebar_box_shadow">
                            <div class="l_w_title">
                                <h3>Product filters</h3>
                            </div>
                            <div class="widgets_inner">
                                <ul class="list">
                                    <p>Brands</p>
                                    <li>
                                     
                                          <asp:CheckBox ID="chkArmani" Text="Armani" runat="server" aria-label="Radio button for following text input"/>
                                    </li>
                                    <li>
                                     
                                         <asp:CheckBox ID="chkLevis" Text="Levis" runat="server" aria-label="Radio button for following text input"/>
                                    </li>
                                   
                                    <li>
                                     
                                         <asp:CheckBox ID="chkLacoste" Text="Lacoste" runat="server" aria-label="Radio button for following text input"/>
                                    </li>
                                    <li>
                                       
                                         <asp:CheckBox ID="chkNike" Text="Nike" runat="server" aria-label="Radio button for following text input"/>
                                    </li>
                                </ul>
                                <ul class="list">
                                    <p>color</p>
                                     
                                    <li>
                                        
                                          <asp:CheckBox ID="chkblack" Text="Black" runat="server" aria-label="Radio button for following text input"/>
                                    </li>
                                
                                    <li>
                                        
                                          <asp:CheckBox ID="chkred" Text="Red" runat="server" aria-label="Radio button for following text input"/>
                                    </li>
                                    <li>
                                       
                                           <asp:CheckBox ID="chkblue" Text="Blue" runat="server" aria-label="Radio button for following text input"/>
                                    </li>
                                    <li>
                                       
                                         <asp:CheckBox ID="chkgold" Text="Gold" runat="server" aria-label="Radio button for following text input"/>
                                    </li>
                                  
                                </ul>
                            </div>
                        </aside>

                        <aside class="left_widgets p_filter_widgets price_rangs_aside sidebar_box_shadow">
                            <div class="l_w_title">
                                <h3>Price Filter</h3>
                            </div>
                            <div class="widgets_inner">
                                <div class="range_item">
                                     <%--<div id="slider-range"></div> --%>
                                    <input type="text" class="js-range-slider" value="" />
                                    <div class="d-flex align-items-center">
                                        <div class="price_text">
                                            <p>Price :</p>
                                        </div>
                                        <div class="price_value d-flex justify-content-center">
                                          <%--  <input type="text" class="js-input-from" id="amount" readonly />--%>
                                             <asp:TextBox ID="txtamt1" runat="server"  class="js-input-from"></asp:TextBox>
                                            <span>to</span>
                                           <%-- <input type="text" class="js-input-to" id="amount" readonly />--%>
                                               <asp:TextBox ID="txtamt2" runat="server"  class="js-input-to"></asp:TextBox>
                                        </div>
                                    </div>
                                       <div class="col-md-12 form-group">
                                   
                                    <asp:Button ID="btnfilter" runat="server" Text="Filter" class="btn_3" OnClick="btnfilter_Click" />
                                    
                                </div>
                                </div>
                            </div>
                        </aside>
                    </div>
                </div>
                <div class="col-lg-9">
                   <div class="row">
                      
                                    <%--<img src="img/category/category_2.png" alt="">
                                    <div class="category_social_icon">
                                        <ul>
                                            <li><a href="#"><i class="ti-heart"></i></a></li>
                                            <li><a href="#"><i class="ti-bag"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="category_product_text">
                                        <a href="single-product.html"><h5>Men's Sports Wear</h5></a>
                                        <p>$150.00</p>
                                    </div>--%>
                                    
                             <% if (flag == true)
                               {
                                   foreach (System.Data.DataRow row in dt1.Rows)
                                   { %>
                                     <div class="col-lg-4 col-sm-6">
                            <div class="single_category_product">
                                <div class="single_category_img">

                                    <img src="<%=row["image"]%>" alt="<%=row["name"]%>" />
                                    <div class="category_social_icon">
                                        <ul>
                                            <li><a href="#"><i class="ti-heart"></i></a></li>
                                            <li><a href="#"><i class="ti-bag"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="category_product_text">
                                       <a href="single_product.aspx?id=<%=row["product_id"]%>" class="block2-name dis-block s-text3 p-b-5"><%=row["name"]%>
                                    </a><%--<span class="block2-price m-text6 p-r-5"><%=row["price"]%></span>--%>
                                        <p>Rs.<%=row["price"]%></p>
                                    </div>
                                 
                                    </div>

                            </div>

                                     </div>

                                                    <%  }
                               }%>
                                </div>
                            </div>
                      
            </div>
        </div>
       
    </section>
    <!--================End Category Product Area =================-->
    
</asp:Content>

