<#import "base.ftlh" as base>
<#import "spring.ftl" as spring />

<@base.base pagename="submitClaim" funname="/submit-claim">
    <section>
    <div class="container">
        
        <div class="contactinfo">

            <div>
                <img id ="logo-img" src="images/GU_LOGO W.png" alt="">
                <h2><@spring.message "complaint.contact" /></h2>
                <ul class="info">
                    <li>
                        <span><img src="images/location.png"></span>
                        <span><@spring.message "complaint.address" /> </span>
                    </li>
                    <li>
                        <span><img src="images/mail.png"></span>
                        <span>cashclaim@gulfunion-saudi.com</span>
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
            
            <h2><@spring.message "common.submitClaim" /></h2>
            <div class="formBox">
                <form   action="/submit-claim" method="post" enctype="multipart/form-data">
                    <div class="row">

                <div class="inputBox w50">
                    <input type="text" class="form-control form-control-lg" name="name"  required>
                    <span><@spring.message "complaint.fullName" /></span>
                </div>
                <div class="inputBox w50">
                    <input type="number" class="form-control form-control-lg" name="id"  required>
                    <span><@spring.message "home.id" /></span>
                </div>
            </div>
                    <div class="row">
                <div class="inputBox w50">
                    <input type="number" class="form-control form-control-lg" name="mobile"  required>
                    <span><@spring.message "complaint.mobileNum" /></span>
                </div>
                <div class="inputBox w50">
                    <input type="email" class="form-control form-control-lg" name="email"  required>
                    <span><@spring.message "home.email" /></span>
                </div>
                    </div>
                    <h5> Kindly Upload the Claim Supporting Documents:</h5>
                    <table>
                        <tr>
                            <td>
                                <p> •	Claim form Filled and signed <a  href="/claim-doc">Download Claim Form</a></p>
                            </td>
                            <td>
                                <input type="file" accept=".jpg, .png, .jpeg, .pdf,.docx" id="uploadFile" name="file" multiple/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p > •	Original Invoices</p >
                            </td>
                            <td>
                                <input type="file" accept=".jpg, .png, .jpeg, .pdf,.docx"  name="file" multiple/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p > •	Payment Receipt</p >
                            </td>
                            <td>
                                <input type="file" accept=".jpg, .png, .jpeg, .pdf,.docx"  name="file" multiple/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p > •	Supporting Investigations Reports (Lab, X-ray Etc.)</p >
                            </td>
                            <td>
                                <input type="file" accept=".jpg, .png, .jpeg, .pdf,.docx" name="file" multiple/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p >•	Medical Report if In Patient treatment or Procedure performed</p >
                            </td>
                            <td>
                                <input type="file" accept=".jpg, .png, .jpeg, .pdf,.docx" name="file" multiple/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p > •	Copy of the preapproval from Gulf Union if treatment outside geographical area</p >
                            </td>
                            <td>
                                <input type="file" accept=".jpg, .png, .jpeg, .pdf,.docx" name="file" multiple/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p > •	Summary of invoices if number of invoices more than space provided in column no .3 in the claim form</p >
                            </td>
                            <td>
                                <input type="file" accept=".jpg, .png, .jpeg, .pdf,.docx" name="file" multiple/>
                            </td>
                        </tr>
                    </table>
                <div class="inputBox w100">
                    <textarea rows="5" cols="50" name="body"   required ></textarea>
                    <span><@spring.message "complaint.message" /></span>
                    
                </div>
                <div class="inputBox ">
                    <input type="submit" value="<@spring.message 'complaint.send' />" >
                </div>
                </form>
            </div>
        </div>
    </div>
</section>
</@base.base>