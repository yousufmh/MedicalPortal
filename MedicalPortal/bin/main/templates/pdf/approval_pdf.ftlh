<#import "base-pdf.ftlh" as base>
<#import "/spring.ftl" as spring />

<@base.base pagename="approval" >


    <div class="card m-t-30 m-b-50 m-r-30 m-l-30">
    <div class="card-body">
        <table  class=" content-table  table-bordered ">
        <thead >
        <tr>
            <th ><@spring.message "approval.num" /></th>
            <th ><@spring.message "provider.pName" /></th>
            <th ><@spring.message "approval.diag" /></th>
            <th ><@spring.message "approval.requestDate" /></th>
            <th ><@spring.message "approval.approveDate" /></th>
            <th ><@spring.message "approval.status" /></th>
        </tr>
        </thead>
        <tbody  >

        <#list approvals as approval >
        <tr>
            <td>
                ${approval.approvalNum!}
            </td>

            <td>
                ${approval.provider!}
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