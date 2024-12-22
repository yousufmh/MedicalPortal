<#import "base-message.ftlh" as base>
<#import "spring.ftl" as spring />

<@base.base >

<div class="card">
    <h5 class="card-header h5"><@spring.message 'resetPassword' /></h5>
    <div class="card-body">
        <form action="/resetpassword" method="post">

            <label >${passError!}</label>
            <div class="inputBox w50">
                <input type="password" class="form-control form-control-lg" name="password" required>
                <span><@spring.message "home.password" /></span>
            </div>
            <div class="inputBox w50">
                <input type="password" class="form-control form-control-lg" name="confirm_password"  required>

                <span><@spring.message "home.confirmPass" /></span>
            </div>
            <input type="submit" class="btn btn-mainPage" value="<@spring.message 'resetPassword' />">
            <a class="btn-mainPage " href="/"><@spring.message 'common.back' /></a>

        </form>
    </div>
</div>

</@base.base>