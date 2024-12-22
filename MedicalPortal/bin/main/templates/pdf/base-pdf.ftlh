<#macro base pagename>
<#import "/spring.ftl" as spring />
<html>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

<title>${pagename}</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="/images/icons/GU_LOGO.ico"/>
<!--===============================================================================================-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<!--<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" media="print">-->
<!--<link rel="stylesheet" type="text/css" href="/css/mdb.min.css">-->
<link rel="stylesheet" type="text/css" href="/css/util.css">

<!--===============================================================================================-->
<style type="text/css">
     @page {
    size: a2 portrait;
    margin: 0mm 0mm 0mm 0mm;
    }
 @font-face {
     font-family: GE_SS_Text_Light;
    src: ("/fonts/GE_SS_Text_Light.ttf");
    }

@media print {

   h2 {
        text-align:center;
    }
}




   body {
        font-family: GE_SS_Text_Light
        font-size: 14px;
        background-color: #fffcf0 !important;

    }
  .content-table{
      font-size: 14px;
      width:100%;
      background-color:#ffff !important;
      border-collapse: collapse;

    }
    .content-table tr:nth-child(even){background-color: #f2f2f2;}

     .content-table th {
      text-align: center;
      background-color: #BF7E04 !important;
      border: 1px solid  #ddd !important;

    }
    .content-table td{
      background-color: #ffffff !important;
    padding: 2px;
      border: 1px solid  #ddd;
  }

    .gold {
     background-color: #E2AC6B !important
 }

@media print {
lighter-gold {
     background-color: #fffcf0 !important
 }
 }





</style>


<body >

    <img src="images\letterhead-header.png" style="width: 100%;" >
    <h2 class="page-header"><@spring.message "common."+pagename /></h2>
<#nested>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

</body>

</html>

</#macro>