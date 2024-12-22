<#import "base-pdf.ftlh" as base>
<#import "/spring.ftl" as spring />
<@base.base pagename="provider">

<div class="card m-l-30 m-t-30" style="width: 10rem;">
    <div class="card-body">
        <p>
            <@spring.message "provider.dedMin"/>:
            <#if benefit.ded_min == 0>
            Not Applicable
            <#else>
            ${benefit.ded_prcant}% <@spring.message "common.max"/> <@spring.message "common.sr"/> ${benefit.ded_min}
        </#if>
        </p>
        <p>
            <@spring.message "provider.dedMed"/>:
            <#if benefit.ded_mid == 0>
            Not Applicable
            <#else>
            ${benefit.ded_prcant}% <@spring.message "common.max"/> <@spring.message "common.sr"/> ${benefit.ded_mid}
        </#if>
        </p>
        <p>
            <@spring.message "provider.dedMax"/>:
            <#if benefit.ded_max == 0>
            Not Applicable
            <#else>
            ${benefit.ded_prcant}% <@spring.message "common.max"/> <@spring.message "common.sr"/> ${benefit.ded_max}
        </#if>
        </p>
    </div>
</div>

<div class="card m-t-30 m-b-50 m-r-30 m-l-30">
    <div class="card-body">
        <p>** Some Providers requires referral from dispensary / بعض المستشفيات تستوجب التحويل من المستوصفات</p>

        </div>
        <table  class=" content-table  table-bordered ">
            <thead >
            <tr>
                <th >#</th>
                <th ><@spring.message "provider.pName"/> </th>
                <th ><@spring.message "provider.region"/></th>
                <th ><@spring.message "provider.city"/></th>
                <th ><@spring.message "provider.phone"/></th>
                <th ><@spring.message "provider.dedType"/></th>
                <th ><@spring.message "provider.type"/></th>
            </tr>
            </thead>
            <tbody id="table_body" class="table-hover table-striped">

            <#list providers as provider >

            <tr>
                <td>
                    <#if provider.networkType == 97>
                    **
                </#if>
                ${provider?counter?c}
                </td>

                <td>
                    <#if lang =='ar'>
                    ${provider.nameAr}
                    <#else>
                    ${provider.nameEn}
                </#if>

                </td>
                <td>
                    ${provider.region!}
                </td>

                <td>
                    <#if lang =='ar'>
                    ${provider.cityAr!}
                    <#else>
                    ${provider.cityEn!}
                </#if>

                </td>

                <td>
                    ${provider.telNo!}
                </td>
                <td>
                    <#if lang =='ar'>
                    ${provider.deductAr!}
                    <#else>
                    ${provider.deductEn!}
                </#if>
                </td>

                <td>
                    <#if lang =='ar'>
                    ${provider.typeOfProviderAr!}
                    <#else>
                    ${provider.typeOfProviderEn!}
                </#if>
                </td>

            </tr>
            <#else>
            <tr>
                <td>        <p>No Data Found</p>
                </td>
            </tr>
            </#list>
            </tbody>

        </table>
    </div>

</div>


</@base.base>