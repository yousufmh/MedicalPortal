<!DOCTYPE html>
<#import "spring.ftl" as spring />
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title><@spring.message "home.header"/></title>
    <link rel="icon" type="image/png" href="/images/icons/GU_LOGO.ico"/>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="custom_style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<div id="container1">
    <div class="leftSide">

        <#--<div class="alert alert-success" role="alert"> -->
           <#-- <p> <@spring.message "update.header"/> </p> -->
            <#--<p> <@spring.message "update.change1"/> </p>-->
            <#--<p> <@spring.message "update.change2"/> </p>-->
            <#--<p> <@spring.message "update.change3"/> </p>-->
            <#--<button type="button" class="close" data-dismiss="alert" aria-label="Close">-->
               <#-- <span aria-hidden="true">&times;</span>-->
            <#--</button>-->
       <#-- </div> -->

    </div>
    <div class="rightSide">
        <a class="dropdown-toggle"  data-toggle="dropdown" aria-haspopup="true"
           aria-expanded="false"> <@spring.message "home.lang"/> </a>

        <div class="dropdown-menu">
            <a class="dropdown-item" href="/?lang=en">English</a>
            <a class="dropdown-item" href="/?lang=ar">العربية</a>
        </div>
        <img src="images/logo.png" class = "logo-img" alt="">
       <h1> <@spring.message "home.header"/> </h1>
        <div class="button-box">
            <div class="btn1 active">
                <a  class="btn toggle-btn"> <@spring.message "home.signin"/></a>
            </div>
            <div class="btn2">
                <a class="btn toggle-btn"><@spring.message "home.signup"/></a>
            </div>

        </div>
        <div id="singIn" class="show">
            <#if alertType == 'E'>
            <div class="alert alert-danger" role="alert">
                ${errorLogin!}.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <#elseif alertType == 'V'>
            <div class="alert alert-danger" role="alert">
                ${errorLogin!} <a href="/prepare?eop=E" class="alert-link"><@spring.message "home.sendVerifyEmail"/></a>.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <#elseif alertType == 'I'>
            <div class="alert alert-success" role="alert">
                ${errorLogin!}.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

        </#if>


            <form  class="input-group show" action="/login" method="post">
                <input type="number" name="username" class="input-field" maxlength="10" placeholder="<@spring.message 'home.id'/> " required
                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                >
                <input type="password" name="password" class="input-field" placeholder="<@spring.message 'home.password'/> " required>
                <a type="Button" href="/prepare?eop=P" ><@spring.message "home.forget"/></a>
                <button type="submit" class="btn submit-btn"><@spring.message "home.signin"/></button>
                <p class="center-text">------------------<@spring.message "common.or"/>--------------------</p>
                <a type="submit" class="btn submit-btn" href="/complints" ><@spring.message "common.complaint"/></a>

            </form>


    </div>

        <div id="signUp">
            <#-- <div class="alert alert-danger" role="alert"> -->
                ${errorSignup!}
                ${notFoundError!}
                ${signupServer!}
                ${userError!}
                ${passError!}
                <#--   <button type="button" class="close" data-dismiss="alert" aria-label="Close"> -->
                <#--  <span aria-hidden="true">&times;</span> -->
                <#-- </button> -->
            <#--  </div> -->

            <form  class="input-group" action="/signup" method="post">
                <input type="number" name = "id" class="input-field" maxlength="10" placeholder="<@spring.message 'home.id'/>" required
                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                >
                <input type="number" name = "dob" class="input-field" maxlength="4" placeholder="<@spring.message 'home.yearofbirth'/> " required
                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                >
                <input type="email" name="email" class="input-field" placeholder="<@spring.message 'home.email'/>" required>
                <input type="password" name="password" class="input-field" placeholder="<@spring.message 'home.password'/>" required>
                <input type="password" name="confirm_password" class="input-field" placeholder="<@spring.message 'home.confirmPass'/>" required>
               <#-- <input type="checkbox" name="terms" required><span><@spring.message 'home.term'/></span> -->
                <button type="submit" class="submit-btn"><@spring.message "home.signup"/></button>

            </form>
        </div>

    </div>
</div>

<script src="home_app.js" charset="utf-8"></script>
<script src="/js/jquery.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

</body>
</html>
