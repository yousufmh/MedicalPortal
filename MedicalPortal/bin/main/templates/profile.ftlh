<#import "base.ftlh" as base>
<#import "spring.ftl" as spring />

<@base.base pagename="profile" funname="/profile">
    <section>
    <div class="container">
        
        <div class="contactinfo">

            <div>
                <img id ="logo-img" src="images/GU_LOGO W.png" alt="">
                <h2><@spring.message "complaint.contact" /></h2>
                <ul class="info">
                    <li>
                        <span><img src="images/location.png"></span>
                        <span><@spring.message "complaint.address" /></span>
                    </li>
                    <li>
                        <span><img src="images/mail.png"></span>
                        <span>complaints@gulfunion-saudi.com</span>
                    </li>
                    <li>
                        <span><img src="images/phone.png"></span>
                        <span>920029926</span>
                    </li>
                </ul>
            
                    <ul class="social">
                        <li><a href="#"><img src="images\facebook.png" alt=""></a></li>
                        <li><a href="#"><img src="images\instagram.png" alt=""></a></li>
                        <li><a href="#"><img src="images\twitter.png" alt=""></a></li>
                        <li><a href="#"><img src="images\linkedin.png" alt=""></a></li>
                    </ul>
                
            </div>
        </div>
        <div class="complaintForm">

                    <#if lang == 'ar'>
                   <table dir="rtl">
                       <#else>
                       <table>
                       </#if>
                       <tbody>
                       <tr>
                           <th>
                               <p class=" p-r-5 p-l-5 border-bottom border-warning"> <@spring.message "complaint.fullName" />:</p>
                           </th>
                           <td>
                               <p class="border-bottom border-left border-warning p-r-5 p-l-5">  <#if lang =='ar'>
                                   ${customer.arabicName!}
                                   <#else>
                                   ${customer.englishName!}
                               </#if>
                               </p>
                           </td>

                       </tr>
                       <tr>
                           <th>
                               <p class="p-r-5 p-l-5 "> <@spring.message "home.email" />: </p>

                           </th>
                           <td>
                               <p class="p-r-5 p-l-5 border-left border-warning">${user.email!} </p>

                           </td>
                           <th>
                               <p class="p-r-5 p-l-5 border-left border-warning"> <@spring.message "home.id" />: </p>

                           </th>
                           <td>
                               <p class="p-r-5 p-l-5 border-left border-warning">${customer.ID!} </p>
                           </td>
                       </tr>
                       </tbody>
                   </table>


        <div class="formBox">
    <div class="row">
        ${passError!}
                <form   action="/profile" method="post">
                <div class="inputBox w100">
                    <input type="password" class="form-control form-control-lg" name="password"  required>
                    <span><@spring.message "home.password" /></span>
                </div>
                <div class="inputBox w100">
                    <input type="password" class="form-control form-control-lg" name="confirm_password"  required>
                    <span><@spring.message "home.confirmPass" /></span>
                </div>
                    <div class="inputBox ">
                        <input type="submit"  value="<@spring.message 'resetPassword' />" >
                    </div>
                </form>
    </div>
        </div>
    </div>
</section>
</@base.base>