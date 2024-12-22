<#import "base-message.ftlh" as base>
<#import "/spring.ftl" as spring />

<@base.base  >

<div class="card m-t-30 m-b-50 m-r-200 m-l-200">
    <h5 class="card-header h5 text-center"><@spring.message "error.notfound" /></h5>
    <div class="card-body">
        <p class="card-text text-center"><@spring.message "error.notfound404" /></p>
        <div class="text-center">
            <a href="/" class="btn "><@spring.message "common.return" /></a>
        </div>
    </div>
</div>

</@base.base>