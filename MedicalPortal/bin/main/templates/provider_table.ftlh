<#import "base.ftlh" as basepage>
<#import "spring.ftl" as spring />

<@basepage.base pagename="provider" funname = "/providers">

<!--<a class="btn-mainPage m-l-30 m-b-30" href="/pdf?name=provider_pdf"><@spring.message "common.pdf"/></a>-->
<button class="btn-mainPage m-l-30 m-b-30" onclick="printPage('/pdf?name=provider_pdf');">
    <@spring.message "common.pdf"/>
</button>
<div class="card m-l-30 m-t-30" style="width: 20rem;">
        <div class="card-body">
            <p>
                <@spring.message "provider.dedMin"/>:
                <#if benefit.ded_min == 0>
                Not Applicable
                <#else>
                ${benefit.ded_prcant}% <@spring.message "common.max"/> <@spring.message "common.sr"/> ${benefit.ded_min}
            </#if>
            </p>
            <p><@spring.message "provider.dedMed"/>:
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

            <div id="filter" class="text-center">
                <div class="row text-center" style="margin-left: 400px;">
                    <p class="m-l-50 m-r-50"><@spring.message "provider.filterR"/></p>
                    <p class="m-l-50 m-r-50"><@spring.message "provider.filterC"/></p>
                </div>

            </div>
            <#if lang == 'ar'>
            <table id="dt-filter-select" class=" content-table  table-bordered " dir="rtl">
            <#else>
            <table id="dt-filter-select" class=" content-table  table-bordered ">
            </#if>
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
        <div class="card-footer text-muted">
            <p>** Some Providers requires referral from dispensary / بعض المستشفيات تستوجب التحويل من المستوصفات</p>
        </div>
    </div>



<script>

    function NewTab() {
            window.open(
              "/pdf?name=provider_pdf", "_blank");
        }

</script>



</@basepage.base>