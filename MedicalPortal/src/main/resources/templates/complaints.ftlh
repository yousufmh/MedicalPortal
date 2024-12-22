<#import "base.ftlh" as base>
<#import "spring.ftl" as spring />

<@base.base pagename="complaint" funname="/complints">
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
            
            <h2><@spring.message "complaint.fileCom" /></h2>
            <div class="formBox">
                <form   action="/complints" method="post">
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
                <div class="inputBox w100">
                    <textarea rows="5" cols="50" name="body"   required ></textarea>
                    <span><@spring.message "complaint.message" /></span>
                    
                </div>
                <div class="inputBox ">
                    <input type="submit" value="<@spring.message 'complaint.send' />" >
                </div>
                </form>
            </div>
            <p>شركة إتحاد الخليج الأهلية للتأمين التعاوني، خاضعة لرقابة واشراف البنك المركزي السعودي بموجب ترخيص رقم
                ت م ن /20079 /9

                Gulf Union Alahlia Cooperative Insurance Co, Regulated by SAMA , License Number TMN 9/20079
            </p>
        </div>
    </div>
</section>
</@base.base>