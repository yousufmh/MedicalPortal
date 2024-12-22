<#import "base.ftlh" as base>
<#import "spring.ftl" as spring />
<@base.base pagename="home" funname="/main" >


    <div class="medicalList" >
    <table>
        <tbody>
        <tr>
            <td>
                <div id="card-container" class="p-l-30 ">
                    <h2><@spring.message "main.card"/> </h2>
                    <div class="company-logo">
                        <img class="logo-img m-l-50 " src="images/logo.png" alt="">
                    </div>
                    <#if lang == 'ar'>
                    <div class="card-body1" dir="rtl">
                        <#else>
                        <div class="card-body1">
                        </#if>
                        <p ><strong><@spring.message "main.name"/>: </strong>
                            <#if lang =='ar'>
                            ${customer.arabicName!}
                            <#else>
                            ${customer.englishName!}
                            </#if>
                        </p>

                        <div class="box">


                            <div class="left Side">
                                <p><strong><@spring.message "main.membership"/>: </strong> ${customer.membershipNo!} </p>
                                <p><strong><@spring.message "main.gender"/>: </strong>
                                    <#if lang =='ar'>
                                    ${customer.genderAr!}
                                    <#else>
                                    ${customer.genderEn!}
                                </#if>
                                </p>
                                <p><strong><@spring.message "main.code"/>: </strong> ${customer.employeeNum!0} </p>
                                <p><strong><@spring.message "main.policyNum"/>: </strong> ${customer.policyNumber!} </p>
                                <p><strong><@spring.message "main.startDate"/>: </strong> ${customer.startDate?date!} </p>
                                <p><strong><@spring.message "main.ded"/>: </strong> ${benefit.ded_prcant!0}% <@spring.message "main.dedOnNet"/> ${benefit.ded_min!}<@spring.message "common.sr"/>/${benefit.ded_mid!}<@spring.message "common.sr"/>/${benefit.ded_max!} <@spring.message "common.sr"/></p>

                            </div>

                            <div class="right Side">
                                <p><strong><@spring.message "main.medicalClass"/>: </strong>  ${customer.degree!} </p>
                                <p><strong><@spring.message "main.birthDate"/>: </strong> ${customer.birthDate?date!} </p>
                                <p><strong><@spring.message "main.approvalLimit"/>: </strong> ${benefit.pre_auth_lim!} <@spring.message "common.sr"/>  </p>
                                <p><strong><@spring.message "home.id"/>: </strong> ${customer.ID!} </p>
                                <p><strong><@spring.message "main.endDate"/>: </strong> ${customer.endDate?date!} </p>

                            </div>
                        </div>
                        <p ><strong><@spring.message "main.policyHolder"/>: </strong> ${customer.policyHolderName!} </p>

                    </div>

                    <div class="footer">
                    </div>
                </div>
            </td>
            <td>
                <div class="card m-t-30 m-b-50 m-r-30 m-l-30">
                    <div class="card-header text-center">
                <h2><@spring.message "main.services"/></h2>
                    </div>
                    <div class="card-body">
                <div class="medicalList">
                    <div class="column1">
                        <div class="row">
                            <img class="icon" src="images/benifites.png" alt=""><a class="btn-mainPage" href="/benefit"><@spring.message "common.benefit"/></a>
                        </div>
                        <div class="row">
                            <img class="icon" src="images/Networ.png" alt=""><a class="btn-mainPage" href="/providers"><@spring.message "common.provider"/></a>
                        </div>
                        <div class="row">
                            <img class="icon" src="images/certificate.svg" alt=""><a class="btn-mainPage" href="/certificate"><@spring.message "common.certificate"/></a>
                        </div>
                        <div class="row">

                            <img class="icon" src="images/approval.svg">

                            <span class="border border-warning">
                            <p class="text-center "><strong><@spring.message "main.cchi"/>: </strong>
                                <#if lang =='ar'>
                                ${cchi.statusAr!}
                                <#else>
                                ${cchi.statusEn!}
                            </#if>
                            </p>
                                </span>


                        </div>
                    </div>
                    <div class="column2">
                        <div class="row">
                            <img class="icon2" src="images/complaint.png" alt=""><a class=" btn-mainPage " href="/complints"><@spring.message "common.complaint"/></a>
                        </div>
                        <div class="row">
                            <img class="icon2" src="images/Approval.png" alt=""><a class=" btn-mainPage " href="/approval"><@spring.message "common.approval"/></a>
                        </div>
                        <div class="row">
                            <img class="icon2" src="images/advice.png"><a class=" btn-mainPage " href="/faq"><@spring.message "common.faq"/></a>
                        </div>
                        <div class="row">
                            <img class="icon3" src="images/claim.png" alt=""><a class=" btn-mainPage " href="/claim"><@spring.message "common.claim"/></a>
                        </div>

                    </div>
                </div>
                </div>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</div>


</@base.base>