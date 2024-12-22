<#import "spring.ftl" as spring />
<#macro base pagename funname>

<html>
<head>
<title>${pagename}</title>
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



<!--Main Navigation-->
<header >

    <nav class="navbar fixed-top navbar-expand-lg navbar-dark gold scrolling-navbar">
        <a class="navbar-brand m-l-0 m-t-0 m-b-0 " href="/main"><img src="images/logonav1.png" style="width:60px;height:60px;"> </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto ">
                <#if pagename == 'home'>
                <li class="nav-item active">
                    <#else>
                <li class="nav-item">
                </#if >
                    <a class="nav-link" href="/main"><@spring.message "common.home"/> </a>
                </li>
                <#if pagename == 'provider'>
                <li class="nav-item active">
                    <#else>
                <li class="nav-item">
                </#if>
                    <a class="nav-link" href="/providers"><@spring.message "common.provider"/></a>
                </li>
                <#if pagename == 'benefit'>
                <li class="nav-item active">
                    <#else>
                <li class="nav-item">
                </#if>
                    <a class="nav-link" href="/benefit"><@spring.message "common.benefit"/></a>
                </li>
                <#if pagename == 'approval'>
                <li class="nav-item active">
                    <#else>
                <li class="nav-item">
                </#if>
                    <a class="nav-link" href="/approval"><@spring.message "common.approval"/></a>
                </li>
                <#if pagename == 'claim'>
                <li class="nav-item active">
                    <#else>
                <li class="nav-item">
                </#if>
                    <a class="nav-link" href="/claim"><@spring.message "common.claim"/></a>
                </li>
                <#if pagename == 'complaint'>
                <li class="nav-item active">
                    <#else>
                <li class="nav-item">
                </#if>
                    <a class="nav-link" href="/complints"><@spring.message "common.complaint"/></a>
                </li>
                <#if pagename == 'certificate'>
                <li class="nav-item active">
                    <#else>
                <li class="nav-item">
                </#if>
                    <a class="nav-link" href="/certificate"><@spring.message "common.certificate"/></a>
                </li>
                <#if pagename == 'faq'>
                <li class="nav-item active">
                    <#else>
                <li class="nav-item">
                </#if>
                    <a class="nav-link" href="/faq"><@spring.message "common.faq"/></a>
                </li>

                <#if user.hasDependents=="T">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDependentsDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false"><@spring.message "common.family"/></a>
                    <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDependentsDropdownMenuLinknavbarDependentsDropdownMenuLink">
                       <#list dependents as dependent>
                        <#if lang =='ar'>
                        <a class="dropdown-item" href="/pre-main?id=${dependent.nationalID!}">${dependent.name!} - ${dependent.insurerTypeAr!}</a>
                        <#else >
                        <a class="dropdown-item" href="/pre-main?id=${dependent.nationalID!}">${dependent.name!} - ${dependent.insurerTypeEn!}</a>
                        </#if>
                        </#list>
                    </div>
                </li>
                </#if>
            </ul>
            <ul class="navbar-nav nav-flex-icons">

                <li class="nav-item">
                    <a class="nav-link" href="/profile"><i class="far fa-user fa-2x"></i></a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false"><i class="fas fa-language fa-2x"></i></a>
                    <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="${funname}?lang=en">English</a>
                        <a class="dropdown-item" href="${funname}?lang=ar">العربية</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/" about="Logout"><i class="fas fa-sign-out-alt fa-2x"></i></a>
                </li>
            </ul>
        </div>
    </nav>

</header>
<!--Main Navigation-->


    <h1 class="page-header"><@spring.message "common."+pagename /></h1>

<#nested>

<script type="text/javascript">
function closePrint () {
  document.body.removeChild(this.__container__);
}

function setPrint () {
  this.contentWindow.__container__ = this;
  this.contentWindow.onbeforeunload = closePrint;
  this.contentWindow.onafterprint = closePrint;
  this.contentWindow.focus(); // Required for IE
  this.contentWindow.print();
}

function printPage (sURL) {
  var oHiddFrame = document.createElement("iframe");
  oHiddFrame.onload = setPrint;
  oHiddFrame.style.position = "fixed";
  oHiddFrame.style.right = "0";
  oHiddFrame.style.bottom = "0";
  oHiddFrame.style.width = "0";
  oHiddFrame.style.height = "0";
  oHiddFrame.style.border = "0";
  oHiddFrame.src = sURL;
  document.body.appendChild(oHiddFrame);
}
</script>
<script src="/js/jquery.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>


<script src="/js/mdb.min.js"></script>
<script src="/js/addons/datatables.min.js"></script>
<script src="/js/table.js"></script>

<script type="text/javascript">

    $(document).ready(function () {
  $('#dataTab').DataTable();
  $('.dataTables_length').addClass('bs-select');
});

</script>
<script type="text/javascript">

    var MAX_FILE_SIZE = 3 * 1024 * 1024; // 3MB
$(document).ready(function() {
    $('#uploadFile’).change(function() {
        fileSize = this.files[0].size;
        if (fileSize > MAX_FILE_SIZE) {
            this.setCustomValidity("File must not exceed 5 MB!");
            this.reportValidity();
        } else {
            this.setCustomValidity("");
        }
    });
});

</script>



</div>

</html>

</#macro>