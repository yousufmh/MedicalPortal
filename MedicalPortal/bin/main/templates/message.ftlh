<#import "base-message.ftlh" as base>
<#import "spring.ftl" as spring />

<@base.base >

<div class="card m-t-30 m-b-50 m-r-200 m-l-200">
    <h5 class="card-header h5 text-center">${title}</h5>
    <div class="card-body">
        <p class="card-text text-center">${message}</p>
        <div class="text-center">
        <a href="/" class="btn-mainPage "><@spring.message "common.return" /></a>
        </div>
    </div>
</div>

</@base.base>