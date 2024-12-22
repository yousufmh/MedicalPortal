<#import "base-pdf.ftlh" as base>
<#import "/spring.ftl" as spring />

<@base.base pagename="claim" >


    <div class="card m-t-30 m-b-50 m-r-30 m-l-30">
    <div class="card-body">
        <table class=" content-table  table-bordered ">
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
                ${claim.provider!}
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