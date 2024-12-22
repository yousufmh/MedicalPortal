<#import "base.ftlh" as base>
<#import "spring.ftl" as spring />

<@base.base pagename="approval" funname = "/approval">

<button class="btn-mainPage m-l-30 m-b-30" onclick="printPage('/pdf?name=approval_pdf');">
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

            <tr >
            <th ><@spring.message "approval.num" /></th>
            <th ><@spring.message "provider.pName" /></th>
            <th ><@spring.message "approval.diag" /></th>
            <th ><@spring.message "approval.requestDate" /></th>
            <th ><@spring.message "approval.approveDate" /></th>
            <th ><@spring.message "approval.status" /></th>
        </tr>
        </thead>
           <tbody >

        <#list approvals as approval >

            <tr >
            <td>
                ${approval.approvalNum?c!}
            </td>

            <td>
                <#if lang == 'ar' >
                ${approval.providerAR!}
                <#else >
                ${approval.providerEN!}
            </#if>
            </td>
            <td>
                ${approval.diagnosis!}
            </td>
            <td>
                ${approval.requestedDate?datetime!}
            </td>

            <td>
                ${approval.approvalDate?date!}, ${approval.approvalTime!}
            </td>

            <td>
                ${approval.status!}
            </td>

        </tr>

        </#list>
        </tbody>

    </table>
    </div>

    </div>
</@base.base>