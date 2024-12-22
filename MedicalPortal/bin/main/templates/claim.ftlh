<#import "base.ftlh" as base>
<#import "spring.ftl" as spring />

<@base.base pagename="claim" funname="/claim">

<button class="btn-mainPage m-l-30 m-b-30" onclick="printPage('/pdf?name=claim_pdf');">
    <@spring.message "common.pdf"/>
</button>
    <div class="card m-t-30 m-b-50 m-r-30 m-l-30">
    <div class="card-body">
        <#if lang == 'ar'>
        <table id="dt-filter-select" class=" content-table  table-bordered " dir="rtl">
            <#else>
            <table id="dt-filter-select" class=" content-table  table-bordered ">
            </#if>
            <thead >
        <tr>
            <th ><@spring.message "claim.num" /></th>
            <th ><@spring.message "provider.pName" /> </th>
            <th ><@spring.message "claim.diag" /> </th>
            <th ><@spring.message "claim.requetedAmount" /></th>
            <th ><@spring.message "claim.invoiceDate" /></th>
        </tr>
        </thead>
        <tbody >

        <#list claims as claim >
        <tr>
            <td>
                ${claim.claimNum?c!}
            </td>
            <td>
                <#if lang == 'ar' >
                ${claim.providerAR!}
                <#else >
                ${claim.providerEN!}
                </#if>
            </td>
            <td>
                ${claim.diagnosis!}
            </td>
            <td>
                ${claim.requestedAmount!}
            </td>


            <td>
                ${claim.invoiceDate?date!}
            </td>


        </tr>

        </#list>
        </tbody>

    </table>
    </div>

    </div>
</@base.base>