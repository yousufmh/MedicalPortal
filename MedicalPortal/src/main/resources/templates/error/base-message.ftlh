<#macro base>
<#import "/spring.ftl" as spring />

<html>
<title>Error</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="/images/icons/GU_LOGO.ico"/>
<!--===============================================================================================-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/mdb.min.css">
<link rel="stylesheet" type="text/css" href="/css/util.css">

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

    h1{
    font-size: 40pt;
    text-align: center;
    color: #E2AC6B;
    background:#FCFBF7 ;
    padding-top: 100px;
    padding-bottom: 60px;
    text-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
    }


    body {

        font-size: 14px;
        background-color: #fffcf0 !important;

    }


    .gold {
     background-color: #E2AC6B !important
 }

     .lighter-gold {
     background-color: #fffcf0 !important
 }


</style>

<body>

<#nested>

<script src="/js/jquery.min.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/mdb.min.js"></script>

</body>

</html>

</#macro>