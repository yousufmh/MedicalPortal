<!DOCTYPE html>
<html lang="en">
<head>
    <title>Medical Benifits </title>
    <meta charset="UTF-8"/>

<style type="text/css">
     @page {
    size: a3 portrait;
    margin: 0mm 0mm 0mm 0mm;
    }


    h2 {
        text-align:center;
    }

    body {

        background-color: #FEEFDB !important;
    }
    .gu-logo{
      height: 50%;
      width: 100%;

    }
    .info-table {
      width: 99%;
      font-size: 15px;
      border-collapse: collapse;
      border: 2px solid  #BF7E04;
  }

    .content-table{
      width: 70%;
      background-color:#ffff !important;
      border-collapse: collapse;
        margin: 10px 10px 10px 10px !important;
        border: 1px solid  #ddd;
    }
    .content-table tr:nth-child(even){background-color: #f2f2f2;}

     .content-table th {
      text-align: center;
      background-color: #BF7E04 !important;
      border: 1px solid  #ddd !important;

    }
    .content-table td{
      background-color: #ffffff !important;
    padding: 2px;
      border: 1px solid  #BF7E04;
  }


</style>


</head>
<body >

                                    <h2>Medical Benifits</h2>
                                    <br/>

                                    <br/>

                                    <table id="dtBasicExample" class="content-table" border="2" cellspacing="0" width="75%">
                                        <thead>
                                        <tr>

                                            <th width="236">
                                                <p>
                                                    <strong>Level of Cover</strong>
                                                </p>
                                            </th>
                                            <th width="236" colspan="2">
                                                <p align="center">
                                                    <strong>${customer.degree}</strong>
                                                    <strong></strong>
                                                </p>
                                            </th>
                                            <th width="236"> <p dir="RTL">
                                                <strong>مستوى التغطية</strong>
                                                <strong></strong>
                                            </p></th>

                                        </tr>
                                        </thead>
                                        <tbody>

                                        <tr>
                                            <td width="236">
                                                <p >
                                                    Geographical Area
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    KSA
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p align="center">
                                                    المملكة العربية السعودية
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    نطاق التغطية
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Overall annual cover per member
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.ann_limit}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.ann_limit} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    الحد الأقصى لتغطية كل فرد
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    In-patient
                                                </p>
                                                <p>
                                                    Appropriate medical treatment, surgical &amp; medical
                                                    procedures, medical supplies &amp; services, nursing
                                                    &amp; doctor’s fees, emergency room, Intensive Care
                                                    Unit (ICU)
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    ${benefit_data.room_type_en}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p align="center">
                                                    ${benefit_data.room_type_ar}
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    التنويم الداخلي
                                                </p>
                                                <p dir="RTL">
                                                    العلاج الطبي المناسب، الجراحة و الإجراءات الطبية،
                                                    اللوازم الطبية والخدمات, تكلفة التمريض والدكتور وغرفة
                                                    العناية المركزة
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Coinsurance/Deductible - Inpatient
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    Nil
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p align="center">
                                                    لا يوجد
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    نسبة التحمل في التنويم الداخلي – المشاركة في الدفع
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Room &amp; Board limit outside APN per day
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.room_outside}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.room_outside} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    حد الإقامة والإعاشة خارج الشبكة لكل يوم
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Room &amp; Board charges for Companion (shared Room)
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.room_comp}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.room_comp} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    حد الإقامة والإعاشة اليومي للمرافق (غرفة مشتركة)
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Out-patient treatment
                                                </p>
                                            </td>
                                            <td width="236" colspan="2">
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    العلاج بالعيادات الخارجية
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Deductible within minimum limit APN
                                                </p>
                                                <p>
                                                    Deductible for hospital not within minimum limit APN
                                                </p>
                                                <p>
                                                    Deductible for other service providers not within
                                                    minimum limit APN
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    <strong><u>Minimum Limit</u></strong>
                                                </p>
                                                <p align="center">
                                                    Not Applicable
                                                    ${benefit_data.ded_prcant}% Max SR. ${benefit_data.ded_min}
                                                </p>
                                                <p align="center">
                                                    <strong><u>Maximum Limit</u></strong>
                                                </p>
                                                <p align="center">
                                                    Not Applicable
                                                    ${benefit_data.ded_prcant}% Max SR. ${benefit_data.ded_max}

                                                </p>
                                                <p align="center">
                                                    <strong><u>Medium Limit</u></strong>
                                                </p>
                                                <p align="center">
                                                    Not Applicable
                                                    ${benefit_data.ded_prcant}% Max SR. ${benefit_data.ded_mid}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p align="center">
                                                    <strong><u>الحد الأدنى</u></strong>
                                                    <strong><u></u></strong>
                                                </p>
                                                <p dir="RTL" align="center">

                                                    لا يوجد
                                                    ${benefit_data.ded_prcant}% بحد أقصى ${benefit_data.ded_min} ريال

                                                </p>
                                                <p  align="center">
                                                    <strong><u>الحد الأعلى</u></strong>
                                                </p>
                                                <p dir="RTL" align="center">

                                                    لا يوجد
                                                    ${benefit_data.ded_prcant}% بحد أقصى ${benefit_data.ded_max} ريال
                                                </p>
                                                <p align="center">
                                                    <strong><u>الحد الأوسط</u></strong>
                                                </p>
                                                <p dir="RTL" align="center">
                                                    لا يوجد
                                                    ${benefit_data.ded_prcant}% بحد أقصى ${benefit_data.ded_mid} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    الإقتطاع / التحمل داخل شبكة الحد الأدنى
                                                </p>
                                                <p dir="RTL">
                                                    الإقتطاع / التحمل للمستشفيات خارج شبكة الحد الأدنى
                                                </p>
                                                <p dir="RTL">
                                                    الإقتطاع / التحمل لباقي مقدمي الخدمة خارج شبكة الحد
                                                    الأدنى
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="350" colspan="2">
                                                <p>
                                                    Consultations should be done according to usual
                                                    treatment procedure as follows here under unless the
                                                    needed service is not available in the medical provider
                                                </p>
                                            </td>
                                            <td width="359" colspan="2">
                                                <p dir="RTL">
                                                    إستشارة الطبيب مغطاة وتتم المعاينة للمستفيد بحسب تسلسل
                                                    إجراءات تقديم الخدمة إلا في حالة عدم توفر الخدمة في
                                                    مركز تقديم الخدمة
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Maximum Doctor Fees Inside APN
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    As per CCHI
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p align="center">
                                                    As per CCHI
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    الحد الأقصى لتكاليف الطبيب داخل الشبكة
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Maximum Doctor Fees outside APN
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    As per CCHI
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p align="center">
                                                    As per CCHI
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    الحد الأقصى لتكاليف الطبيب خارج الشبكة
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    General Practitioner
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.gen_doc}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.gen_doc} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    الطبيب العام
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    First Specialist
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.first_doc}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.first_doc} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    أخصائي (طبيب نائب أول)
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Second Specialist
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.sec_doc}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.sec_doc} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    أخصائي (طبيب نائب ثاني)
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Consultant
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.cons}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.cons} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    الإستشاري
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Rare Specialists
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.rare_spe}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.rare_spe} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    التخصصات ذات الندرة
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Pre-Authorization Limit
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.pre_auth_lim}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.pre_auth_lim} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    حد الموافقة المسبقة
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Maternity Expenses
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.mat_Exp}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.mat_Exp} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    نفقات الحمل والولادة
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    New born babies are covered under the mother's policy
                                                    up to 30 days of delivery until added in the policy
                                                    retroactively from the date of birth
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    Covered
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p align="center">
                                                    مغطى
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    تكاليف تغطية المواليد الجدد على وثيقة الأم وبحد أقصى 30
                                                    يوم من تاريخ الولادة حتى يتم اضافتهم على الوثيقة بأثر
                                                    رجعي من تاريخ الولادة
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Maternity Complications
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    Covered
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p align="center">
                                                    مغطى
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    مضاعفات الحمل والولادة
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Circumcision for male newborn babies
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.cir_male}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.cir_male} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    الختان للمواليد الجدد الأولاد
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Ear piercing for female newborn babies
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.ear_female}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.ear_female} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    تخريم الأذن للمواليد الجدد البنات
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Premature Babies &amp; life threatening Congenital
                                                    Deformities for new Born Babies are covered only
                                                    whenever Maternity is covered for the mother
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    Covered
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p align="center">
                                                    مغطى
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    الأطفال الخدج والتشوهات الخلقية المهددة للحياة مغطاة
                                                    للأطفال الجدد إذا كانت منفعة الحمل والولادة مغطاة للأم
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Vaccinations (As per Ministry of Health plan up to 6
                                                    years of age)
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    Covered
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p align="center">
                                                    مغطى
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    النطعيمات طبقا لجدول وزارة الصحة ولغاية 6 سنوات
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    National program of early neonatal screening to reduce
                                                    disability
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.national_prog}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.national_prog} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    تكاليف البرنامج الوطني للفحص المبكر لحديثي الولادة للحد
                                                    من الإعاقة
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Dental treatment
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.dent}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.dent} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    علاج الأسنان
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Cost of spectacles:
                                                </p>
                                                <p>
                                                    Spectacles sub limit for frame SR. ${benefit_data.spect_frame}
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.spect}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.spect} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    النظارة الطبية
                                                </p>
                                                <p dir="RTL">
                                                    الحد الأعلى الفرعي لإطار النظارة ${benefit_data.spect_frame} ريال
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Life threatening congenital Deformities
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    Covered
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p align="center">
                                                    مغطى
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    التشوهات الخلقية المهددة للحياة
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Acquired heart valves deficiency
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.heart}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.heart} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    تكاليف حالات التلف في صمامات القلب المكتسبة
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Pre-Existing and Chronic
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    Covered
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p align="center">
                                                    مغطى
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    الأمراض السابقة و المزمنة
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Organ transplantation expenses for the Donor
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.organ}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.organ} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    تكاليف إجراء عملية التبرع بالأعضاء للمتبرع
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Physiotherapy and Rehabilitation
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    Covered
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p align="center">
                                                    مغطى
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    العلاج الطبيعي والتأهيل
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Renal dialysis
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.rent_Dialysis}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.rent_Dialysis} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    غسيل الكلى
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Acute psychological cases expenses including 4 sessions
                                                    and medications up to SR. 5,000 for non-acute cases
                                                    during the policy period
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.all_Acut}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.all_Acut} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    الحالات النفسية الحادة وتشمل 5,000 ريال للحالات النفسية
                                                    الغير حادة لـ 4 جلسات مع الأدوية خلال مدة الوثيقة
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Gastric sleeve surgeries if the body mass index exceeds
                                                    45
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.sleeve}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.sleeve} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    عمليات جراحة معالجة السمنة المفرطة عن طريق عملية تكميم
                                                    المعدة فقط Sleeve في حال تجاوز كتلة الجسم 45 BMI
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Autism Cases
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.aut_case}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.aut_case} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    تكاليف حالات التوحد
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Alzheimer Cases
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.alzheimer}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.alzheimer} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    تكاليف حالات الزهايمر
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Cost of disability cases
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.disability}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.disability} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    تكاليف حالات الإعاقة
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Cost of Hearing Aids
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.hearing}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.hearing} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    تكاليف السماعات الطبية
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Ambulance
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    Covered
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p align="center">
                                                    مغطى
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    سيارة الإسعاف
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Repatriation of mortal remains to home country
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    SR. ${benefit_data.dead_home}
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p dir="RTL" align="center">
                                                    ${benefit_data.dead_home} ريال
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    إعادة الجثمان إلى المواطن الأم
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Respiratory Syncytial Virus (RSV) vaccination program
                                                    as per the vaccination schedule issued by the Ministry
                                                    of Health
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    Covered
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p align="center">
                                                    مغطى
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    برنامج التحصينات لفيروس الإلتهاب التنفسي المخلوي (RSV)
                                                    وفق جدول التحصينات للفيروس والصادر من وزارة الصحى
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Early screening programs for hearing disability and
                                                    critical congenital heart defects
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    Covered
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p align="center">
                                                    مغطى
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    برنامج الفحص المبكر للإعاقة السمعية وبرنامج تشوهات
                                                    القلب الخلقية الحرجة لجميع المواليد
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Milk for newborn babies until the age of 24 months if
                                                    medically required
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    Covered
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p align="center">
                                                    مغطى
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    حليب الأطفال للرضع المحتاجين إليه طبيا حتى عمر 24 شهر
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="236">
                                                <p>
                                                    Psoriasis treatment expenses
                                                </p>
                                            </td>
                                            <td width="114">
                                                <p align="center">
                                                    Covered
                                                </p>
                                            </td>
                                            <td width="123">
                                                <p align="center">
                                                    مغطى
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    تكاليف معالجة الصدفية
                                                </p>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td width="236">
                                                <p>
                                                    <strong>Network of Providers</strong>
                                                    <strong></strong>
                                                </p>
                                            </td>
                                            <td width="236" colspan="2">
                                                <p align="center">
                                                    <strong>According to the Network</strong>
                                                    <strong></strong>
                                                </p>
                                            </td>
                                            <td width="236">
                                                <p dir="RTL">
                                                    <strong>شبكة المرافق</strong>
                                                </p>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>





 <script src="/js/jquery.min.js"></script>
    <script src="/js/popper.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/mdb.min.js"></script>
    <script src="/js/datatables.min.js"></script>


</body>
</html>