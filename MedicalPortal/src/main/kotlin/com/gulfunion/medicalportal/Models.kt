package com.gulfunion.medicalportal

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import com.fasterxml.jackson.annotation.JsonInclude
import com.fasterxml.jackson.annotation.JsonProperty
import java.util.*
import kotlin.collections.ArrayList

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
data class User(
        @JsonProperty("ID")
        var id:Int = 0,
        @JsonProperty("NATIONALID")
        var nationalID:String = "",
        @JsonProperty("USERNAME")
        var username:String? = "",
        @JsonProperty(" EMAIL")
        var email:String = "",
        @JsonProperty(" PASSWORD")
        var password:String = "",
        @JsonProperty(" VERFIED")
        var verified:String = "F",
        @JsonProperty(" HAS_DEPENDENTS")
        var hasDependents:String = "",
        @JsonProperty(" CREATE_USER")
        var createUser:String = "SpringBoot Medical Client App",
        @JsonProperty(" CREATE_DATE")
        var createDate:Date = Date(),
        @JsonProperty(" UPDATE_USER")
        var updateUser: String? = null,
        @JsonProperty(" UPDATE_DATE")
        var updateDate: Date?= null
)



@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
data class Dependents(
        @JsonProperty("ID")
        var nationalID: String = "",
        @JsonProperty("MEMBER_NAME")
        var name: String = "",
        @JsonProperty("MEMBER_STATUS_EN")
        var insurerTypeEn: String = "",
        @JsonProperty("MEMBER_STATUS_AR")
        var insurerTypeAr: String = ""
)

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
data class CCHIStatus(
        @JsonProperty("STATUS_EN")
        var statusEn:String? = "",
        @JsonProperty("STATUS_AR")
        var statusAr:String? = "",
        @JsonProperty("RESULT")
        var note:String? =""
)

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
data class Login(
        var status:Int = 0,
        var loginInfo:User = User(),
        var user:CustomerInfo = CustomerInfo()
)

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
data class ResponseStatus(
        var status:Int = 0

)

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
data class VerificationToken(
        @JsonProperty(" ID")
        val ID:Int = 0,
        @JsonProperty(" TOKEN")
        var token:String = "",
        @JsonProperty(" USERID")
        var userID:String = "",
        @JsonProperty(" EMAIL_OR_PASSWORD")
        var emailOrPassword:String = "",
        @JsonProperty(" CREATE_USER")
        var createUser:String = "SpringBoot Medical Client App",
        @JsonProperty(" CREATE_DT")
        var createDate:Date = Date(),
        @JsonProperty(" UPDATE_USER")
        var updateUser: String? = null,
        @JsonProperty(" UPDATE_DT")
        var updateDate: Date?= null

)


@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
data class CustomerInfo(
        var ID:String = "",
        @JsonProperty("ARABIC_NAME")
        var arabicName:String= "",

        @JsonProperty("ENGLISH_NAME")
        var englishName:String = "",

        @JsonProperty("INSURER_TYPE")
        var insurerType:String = "",

        @JsonProperty("DEGREE")
        var degree:String = "",

        @JsonProperty("GENDER_EN")
        var genderEn:String = "",

        @JsonProperty("GENDER_AR")
        var genderAr:String = "",

        @JsonProperty("EMPLOYEE_NUM")
        var employeeNum:String? = "",

        @JsonProperty("POLICY_NUMBER")
        var policyNumber:String ="",

        @JsonProperty("START_DATE")
        var startDate:Date = Date(),

        @JsonProperty("END_DATE")
        var endDate:Date = Date(),

        @JsonProperty("BIRTH_DATE")
        var birthDate:Date = Date(),

        @JsonProperty("MEMBERSHIP_NO")
        var membershipNo:String = "",

        @JsonProperty("POLICY_HOLDER_NAME")
        var policyHolderName:String = ""
)



@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
data class Provider(
        @JsonProperty("PROVIDER_NAMEE")
        val nameEn:String? = "",
        @JsonProperty("PROVIDER_NAMEA")
        val nameAr:String? = "",
        @JsonProperty("REGION")
        val region:String? = "",
        @JsonProperty("CITY_EN")
        val cityEn:String? = "",
        @JsonProperty("CITY_AR")
        val cityAr:String? = "",
        @JsonProperty("TEL_NO")
        val telNo:String? = "",
        @JsonProperty("DEDUCTION_TYPE_EN")
        val deductEn:String? = "",
        @JsonProperty("DEDUCTION_TYPE_AR")
        val deductAr:String? = "",
        @JsonProperty("TYPE_OF_PROVIDER_EN")
        val typeOfProviderEn:String? = "",
        @JsonProperty("TYPE_OF_PROVIDER_AR")
        val typeOfProviderAr:String? = "",
        @JsonProperty("HAMP_NETWORK_TYPE")
        val networkType:Int? = 0
)

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
data class Approval(
        @JsonProperty("ID")
        val id:String? = "",
        @JsonProperty("PROVIDER_AR")
        val providerAR:String? = "",
        @JsonProperty("PROVIDER_EN")
        val providerEN:String? = "",
        @JsonProperty("DIAGNOSIS")
        val diagnosis:String? = "",
        @JsonProperty("REQUESTED_DATE")
        val requestedDate:Date? = Date(),
        @JsonProperty("APPROVAL_DATE")
        val approvalDate:Date? = Date(),
        @JsonProperty("APPROVAL_TIME")
        val approvalTime:String? = "",
        @JsonProperty("REQUESTED_COST")
        val requestedCost:String? = "",
        @JsonProperty("APPROVED_COST")
        val approvedCost:String? = "",
        @JsonProperty("STATUS_EN")
        val status:String? = "",
        @JsonProperty("APPROVAL_NUMBER")
        val approvalNum: Number? = 0
)




@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
data class Claim(
        @JsonProperty("POLICY_NUMBER")
        val policyNum: Number? = 0,
        @JsonProperty("PROVIDER_AR")
        val providerAR:String? = "",
        @JsonProperty("PROVIDER_EN")
        val providerEN:String? = "",
        @JsonProperty("DIAGNOSIS")
        val diagnosis:String? = "",
        @JsonProperty("REQUESTED_AMOUNT")
        val requestedAmount:Number? = 0,
        @JsonProperty("PAID_AMOUNT")
        val paidAmount:Number? = 0,
        @JsonProperty("INVOICE_DATE")
        val invoiceDate:Date? = Date(),
        @JsonProperty("ENTRY_DATE")
        val enteryDate:Date? = Date(),
        @JsonProperty("VOUCHER_DATE")
        val voucherDate:Date? = Date(),
        @JsonProperty("BATCH_NUMBER")
        val claimNum:Number? = 0
)


@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
data class BenefitCode(
        @JsonProperty("PROC_SERIAL")
        val code:Int=0,
        @JsonProperty("SUB_CD")
        val subCode:Int =0,
        @JsonProperty("BENEFIT")
        val benefit:Long = 0,
        @JsonProperty("APPROVAL_LIMIT")
        val approvalLimit:Long =0,
        @JsonProperty("OUT_DEDUCTIBLE")
        val deductible:String = "",
        @JsonProperty("ROOM_TYPE_ENG")
        val roomTypeEn:String="",
        @JsonProperty("ROOM_TYPE_AR")
        val roomTypeAr:String = ""
)

data class Certificate(
        var member_name:String = "" ,
        var national_id:String = "",
        var member_class:String = "",
        var member_type:String = "",
        var membership_no:String = "",
        var accommod_type:String = "",
        var birth_dt:Date = Date(),
        var member_effective_dt:Date = Date(),
        var policy_expiry_dt:Date = Date(),
        var min_limit:Int = 0,
        var max_limit:Int = 0,
        var med_limit:Int = 0,
        var ded_prcan:Int = 0,
        var policy_no:String = "",
        var policyholder_name:String = ""
)

data class Benefits(
        var ann_limit:Long = 0,
        var room_type_ar:String = "",
        var room_type_en:String = "",
        var room_outside:Long= 0,
        var room_comp:Long= 0,
        var ded_min:Int = 0,
        var ded_max:Int = 0,
        var ded_mid:Int = 0,
        var ded_prcant:Int = 0,
        var gen_doc:Long= 0,
        var first_doc:Long= 0,
        var sec_doc:Long= 0,
        var cons:Long= 0,
        var rare_spe:Long= 0,
        var pre_auth_lim:Long= 0,
        var mat_Exp:Long= 0,
        var new_born:Long= 0,
        var mat_Comp:Long= 0,
        var cir_male:Long= 0,
        var ear_female:Long= 0,
        var national_prog:Long= 0,
        var dent:Long= 0,
        var spect:Long= 0,
        var spect_frame:Long= 0,
        var heart:Long= 0,
        var organ:Long= 0,
        var rent_Dialysis:Long= 0,
        var all_Acut:Long= 0,
        var non_Acut:Long= 0,
        var acut_session:Long= 0,
        var sleeve:Long= 0,
        var aut_case:Long= 0,
        var alzheimer:Long= 0,
        var disability:Long= 0,
        var hearing:Long= 0,
        var dead_home:Long= 0
)





