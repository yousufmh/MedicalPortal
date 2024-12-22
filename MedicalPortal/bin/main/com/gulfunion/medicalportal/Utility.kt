package com.gulfunion.medicalportal

import org.springframework.core.io.ClassPathResource
import org.springframework.mail.javamail.JavaMailSender
import org.springframework.mail.javamail.MimeMessageHelper
import org.springframework.web.multipart.MultipartFile


fun getBenefit(listOfCodes:MutableList<BenefitCode>):Benefits{

    var benefit = Benefits()

    benefit.pre_auth_lim = listOfCodes[0].approvalLimit
    benefit.room_type_ar = listOfCodes[0].roomTypeAr
    benefit.room_type_en = listOfCodes[0].roomTypeEn

    val deductible =
            Regex("[0-9]+")
                    .findAll(listOfCodes[0].deductible)
                    .map(MatchResult::value)
                    .toList()

    var index =0
    for (item in deductible){
        when (index){
            0 -> {
                benefit.ded_prcant = item.toInt()
                index++
            }
            1->{
                benefit.ded_min = item.toInt()
                index++
            }
            2-> {
                benefit.ded_mid = item.toInt()
                index++
            }
            3-> {
                benefit.ded_max = item.toInt()
                index++
            }
        }
    }

    for (item in listOfCodes){

        when (item.code){
            2 -> benefit.dent = item.benefit
            3 ->{
                when(item.subCode){
                    4->benefit.spect_frame = item.benefit
                    99-> benefit.spect = item.benefit
                }
            }
            4->{
                when(item.subCode) {
                    2->benefit.mat_Exp = item.benefit
                    8->benefit.mat_Comp = item.benefit
                }
            }
            6 ->{
                when(item.subCode){
                    1->benefit.gen_doc = item.benefit
                    6->benefit.first_doc = item.benefit
                    7->benefit.sec_doc = item.benefit
                    8->benefit.cir_male = item.benefit
                    9->benefit.ear_female = item.benefit
                    87->benefit.cons = item.benefit
                    88->benefit.rare_spe = item.benefit
                }
            }
            7 ->benefit.dead_home = item.benefit
            16 ->{
                when(item.subCode){
                    1->benefit.room_outside = item.benefit
                    8->benefit.room_comp = item.benefit
                }
            }
            17 ->benefit.rent_Dialysis = item.benefit
            32 ->benefit.national_prog = item.benefit
            33->benefit.heart = item.benefit
            34->benefit.organ = item.benefit
            35->benefit.aut_case = item.benefit
            36->benefit.alzheimer = item.benefit
            37->benefit.disability = item.benefit
            38->benefit.hearing = item.benefit
            39->benefit.new_born = item.benefit
            40->benefit.sleeve = item.benefit
            41-> if (item.subCode==99) benefit.all_Acut = item.benefit
            99->benefit.ann_limit = item.benefit
        }
    }
    return benefit
}


fun createCertificate(ci: CustomerInfo, bf:Benefits):Certificate{
    return Certificate(
            member_name=ci.englishName,
            national_id = ci.ID,
            member_class = ci.degree,
            member_type = ci.insurerType,
            membership_no = ci.membershipNo,
            accommod_type = bf.room_type_en,
            birth_dt = ci.birthDate,
            member_effective_dt = ci.startDate,
            policy_expiry_dt = ci.endDate,
            min_limit = bf.ded_min,
            max_limit = bf.ded_max,
            med_limit = bf.ded_mid,
            ded_prcan = bf.ded_prcant,
            policy_no = ci.policyNumber,
            policyholder_name = ci.policyHolderName
    )
    
}


fun sendEmail(sender: JavaMailSender, subject: String, htmlBody: String, sendTo: String, cc: String = "", file: ArrayList<MultipartFile>? =null ) {

    val msg = sender.createMimeMessage()
    val helper = MimeMessageHelper(msg,true)

    helper.setFrom("no-reply@gulfunion-saudi.com")
    helper.setTo(sendTo)
    if(cc!="")
    helper.setCc(cc)
    helper.setSubject(subject)
    helper.setText("""
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <title>Title</title>
                <style>
                
             

/* Centered text */
.centered {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

                tr,td,table {
          font-family: 'gu_font';
          border: 1px solid #ddd;
          border-collapse: collapse;
          font-size: 11pt;
          margin:3px;
        }
        thread {
            
            background-color: #b2b2b2;
            font-family: Calibri, sans-serif;
        }
                </style> 
            </head>
            <body style = "background-color: #f9f9f9;">
            <img src = 'cid:header.png' style="width:100%;"></img>
            $htmlBody
            <img src = 'cid:footer.png' style="width:100%;"></img>
            </body>
            </html>
        """.trimIndent(),true)
    helper.addAttachment("header.png", ClassPathResource("/static/images/EmailHeader.png"));
    helper.addAttachment("footer.png", ClassPathResource("/static/images/EmailFooter.png"));
    if (file!=null )
        for (item in file) {
            helper.addAttachment("${item.originalFilename}.pdf", item)
        }
    sender.send(msg)

}


