<#import "internal_base.ftlh" as base>
<#import "spring.ftl" as spring />

<@base.base pagename="change email" >

<div class="card m-t-150 m-b-50 m-r-200 m-l-200">
    <h5 class="card-header h5">change Email </h5>
    <div class="card-body">
        <form action="/internal/update-email" method="post">
            <div class="md-form">
                <input type="number" id="user1" class="form-control " maxlength="10" name="username" required
                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                >
                <label for="user1" class="" style="color:BF7E04;"><@spring.message 'home.id' /></label>
            </div>
            <input type="submit" class="btn btn-mainPage" value="<@spring.message 'complaint.send' />">
            <a class="btn-mainPage " href="/"><@spring.message 'common.back' /></a>
        </form>
    </div>
</div>

</@base.base>


