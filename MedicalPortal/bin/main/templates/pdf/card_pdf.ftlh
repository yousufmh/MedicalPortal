<#import "base-pdf.ftlh" as base>
<#import "/spring.ftl" as spring />
<@base.base pagename="home" >


<div class="medicalList">
                <div id="card-container" class="p-l-30 ">
                    <h2><@spring.message "main.card"/> </h2>
                    <div class="company-logo">
                        <img class="logo-img m-l-50 " src="images/logo.png" alt="">
                    </div>
                    <div class="card-body1">
                        <p class="m-l-22"><strong><@spring.message "main.name"/>: </strong>
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
                                <p><strong><@spring.message "main.ded"/>: </strong> ${benefit.ded_prcant!0}% <@spring.message "main.dedOnNet"/> <@spring.message "common.sr"/>${benefit.ded_min!}/<@spring.message "common.sr"/>${benefit.ded_mid!}/<@spring.message "common.sr"/>${benefit.ded_max!} </p>
                            </div>

                            <div class="right Side">
                                <p><strong><@spring.message "main.medicalClass"/>: </strong>  ${customer.degree!} </p>
                                <p><strong><@spring.message "main.birthDate"/>: </strong> ${customer.birthDate?date!} </p>
                                <p><strong><@spring.message "main.approvalLimit"/>: </strong> ${benefit.pre_auth_lim!} </p>
                                <p><strong><@spring.message "home.id"/>: </strong> ${customer.ID!} </p>
                                <p><strong><@spring.message "main.endDate"/>: </strong> ${customer.endDate?date!} </p>
                            </div>
                        </div>
                        <p class="m-l-22"><strong><@spring.message "main.policyHolder"/>: </strong> ${customer.policyHolderName!} </p>

                    </div>

                    <div class="footer">
                    </div>
                </div>
</div>


</@base.base>