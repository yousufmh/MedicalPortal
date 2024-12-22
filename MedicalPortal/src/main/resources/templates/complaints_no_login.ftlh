<#import "spring.ftl" as spring />

<html>
<head>
    <title>complaint</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="/images/icons/GU_LOGO.ico"/>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <!--<link rel="stylesheet" type="text/css" href="/css/fresh-bootstrap-table.css">-->
    <link rel="stylesheet" type="text/css" href="/css/mdb.min.css">
    <link rel="stylesheet" type="text/css" href="/css/util.css">
    <link rel="stylesheet" type="text/css" href="complaint_style.css">
    <!--<link rel="stylesheet" type="text/css" href="custom_style.css">-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
    <link href="http://fonts.googleapis.com/css?family=Roboto:400,700,300" rel="stylesheet" type="text/css">
    <!-- MDBootstrap Datatables  -->
    <link rel="stylesheet" type="text/css" href="/css/addons/datatables.min.css">


    <!--===============================================================================================-->
    <style type="text/css">
     @page {
    size: a3 portrait;
    margin: 0mm 0mm 0mm 0mm;
    }


    h2 {
        text-align:center;
    }


.with-chevron[aria-expanded='true'] i {
  display: block;
  transform: rotate(180deg) !important;
}

    .page-header{
    font-size: 30pt;
    text-align: center;
    color: #E2AC6B;
    padding-top: 100px;
    padding-bottom: 60px;
    text-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
    }


    body {

        font-size: 14px;
        background-color: #fffcf0 !important;

    }


    .gold {
    /* background-color: #E2AC6B !important*/
     background-color: #CBA36D !important
 }

     .lighter-gold {
     background-color: #fffcf0 !important
 }


    .content-table{
      width: 99%;
      background-color:#ffff !important;
       margin: 20px 20px 20px 20px;
    }


     .content-table th {
      text-align: center;
      background-color: #E2AC6B !important;

    }
    content-table.table-hover tbody tr:hover {
    background-color: rgba(0, 0, 0, 0.075);
    -webkit-transition: .5s;
    transition: .5s
}
    .content-table td{
      background-color: #ffffff !important;
    padding: 2px;
  }


</style>

</head>

<body >

<h1 class="page-header"><@spring.message "common.complaint"/></h1>
<a type="submit" class="btn" href="/" ><@spring.message "common.home"/></a>

<section>
    <div class="container">

        <div class="contactinfo">

            <div>
                <img id ="logo-img" src="images/GU_LOGO W.png" alt="">
                <h2><@spring.message "complaint.contact" /></h2>
                <ul class="info">
                    <li>
                        <span><img src="images/location.png"></span>
                        <span><@spring.message "complaint.address" /> </span>
                    </li>
                    <li>
                        <span><img src="images/mail.png"></span>
                        <span>complaints@gulfunion-saudi.com</span>
                    </li>
                    <li>
                        <span><img src="images/phone.png"></span>
                        <span>920029926</span>
                    </li>
                </ul>

                <ul class="social">
                    <li><a href="#"><img src="images\facebook.png" alt=""></a></li>
                    <li><a href="#"><img src="images\instagram.png" alt=""></a></li>
                    <li><a href="#"><img src="images\twitter.png" alt=""></a></li>
                    <li><a href="#"><img src="images\linkedin.png" alt=""></a></li>
                </ul>

            </div>
        </div>
        <div class="complaintForm">

            <h2><@spring.message "complaint.fileCom" /></h2>
            <div class="formBox">
                <form   action="/complints" method="post">
                    <div class="row">

                        <div class="inputBox w50">
                            <input type="text" class="form-control form-control-lg" name="name"  required>
                            <span><@spring.message "complaint.fullName" /></span>
                        </div>
                        <div class="inputBox w50">
                            <input type="number" class="form-control form-control-lg" name="id"  required>
                            <span><@spring.message "home.id" /></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="inputBox w50">
                            <input type="number" class="form-control form-control-lg" name="mobile"  required>
                            <span><@spring.message "complaint.mobileNum" /></span>
                        </div>
                        <div class="inputBox w50">
                            <input type="email" class="form-control form-control-lg" name="email"  required>
                            <span><@spring.message "home.email" /></span>
                        </div>
                    </div>
                    <div class="inputBox w100">
                        <textarea rows="5" cols="50" name="body"   required ></textarea>
                        <span><@spring.message "complaint.message" /></span>

                    </div>
                    <div class="inputBox ">
                        <input type="submit" value="<@spring.message 'complaint.send' />" >
                    </div>
                </form>
            </div>
            <p>شركة إتحاد الخليج الأهلية للتأمين التعاوني، خاضعة لرقابة واشراف البنك المركزي السعودي بموجب ترخيص رقم
                ت م ن /20079 /9

                Gulf Union Alahlia Cooperative Insurance Co, Regulated by SAMA , License Number TMN 9/20079
            </p>
        </div>
    </div>

</section>

<script src="/js/jquery.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>


<script src="/js/mdb.min.js"></script>
<script src="/js/addons/datatables.min.js"></script>
<script src="/js/table.js"></script>

</body>

</html>