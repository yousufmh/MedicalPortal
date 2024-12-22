<#import "internal_base.ftlh" as base>
<#import "spring.ftl" as spring />

<@base.base pagename="change_email" >

<div class="card m-t-150 m-b-50 m-r-200 m-l-200">
    <h5 class="card-header h5">Email Change</h5>
    <div class="card-body">


        <p class="card-text text-center"> ${error!} </p>
        <p class="card-text text-center"> <@spring.message 'home.id'/>: ${id!} </p>
        <p class="card-text text-center"> <@spring.message 'main.name'/>: ${name!} </p>
        <p class="card-text text-center"> <@spring.message 'home.email'/>: ${email!} </p>
        <p class="card-text text-center"> <@spring.message 'home.verified'/>: ${verfied!} </p>

        <p class="card-text text-center"> <@spring.message 'home.changeEmail'/> </p>
        <form class="card-text text-center" action="/internal/update-email" method="post">
            <input type="email" name="email" class="input-field" placeholder="<@spring.message 'home.email'/>" required>
            <br>
            <input type="submit" class="btn btn-mainPage" value="<@spring.message 'complaint.send' />">
            <a class="btn-mainPage " href="/"><@spring.message 'common.back' /></a>
            <br>
            <p class="card-text text-center">------------------<@spring.message "common.or"/>--------------------</p>
            <a class="text-center btn-mainPage " href="/emailverification?eop=E"><@spring.message 'home.sendVerifyEmail' /></a>
        </form>


    </div>
</div>

</@base.base>


