<#import "base.ftlh" as base>
<#import "spring.ftl" as spring />

<@base.base pagename="certificate" funname="/certificate">

<!--<a class="btn-mainPage" href="/downloadPDF?name=certificate" > <@spring.message "common.pdf" /> </a>-->

<button class="btn-mainPage m-l-30 m-b-30" onclick="printPage('/pdf?name=certificate_pdf');">
    <@spring.message "common.pdf"/>
</button>

<div id="content-to-print">
<div class="card m-t-30 m-b-50 m-r-30 m-l-30">
    <div class="card-body">
<div align="center">
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
                    <strong>${certificate.member_class}</strong>
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
            <td colspan="2" width="369">
                <p><strong>TO WHOM IT MAY CONCERN</strong></p>
            </td>
            <td colspan="2" width="369" dir="RTL">
                <p><strong>الى من يهمه الأمر </strong></p>
            </td>
        </tr>

        <tr>
            <td colspan="2" width="369">
                <p><u>Subject: Certificate of Health Insurance Membership</u></p>
            </td>
            <td colspan="2" width="369" dir="RTL">
                <p><u>الموضوع: شھادة عضوية للتأمين الطبي</u></p>
            </td>
        </tr>

        <tr>
            <td colspan="2" width="369">
                <p>This is to confirm that the below mentioned member is medically covered under Gulf Union Cooperative Insurance Company scheme with the following information:</p>
            </td>
            <td colspan="2" width="369" dir="RTL">
                <p>إن ھذه الشهادة تؤكد أن المذكور مغطى طبیاً تحت برنامج شركة اتحاد الخليج للتأمین التعاوني وفقا للبیانات التالیة:</p>
            </td>
        </tr>

        <tr>
            <td width="246">
                <p>Member Name</p>
            </td>
            <td colspan="2" width="246" align="center">
                <p>${certificate.member_name}</p>
            </td>
            <td width="246" dir="RTL">
                <p>اسم العضو</p>
            </td>
        </tr>

        <tr>
            <td width="246">
                <p>National ID or Iqama Number</p>
            </td>
            <td colspan="2" width="246" align="center">
                <p>${certificate.national_id}</p>
            </td>
            <td width="246" dir="RTL">
                <p>رقم الھویة أو الإقامة</p>
            </td>
        </tr>

        <tr>
            <td width="246">
                <p>Member Class</p>
            </td>
            <td colspan="2" width="246" align="center">
                <p>${certificate.member_class}</p>
            </td>
            <td width="246" dir="RTL">
                <p>فئة التأمین</p>
            </td>
        </tr>

        <tr>
            <td width="246">
                <p>Member Type</p>
            </td>
            <td colspan="2" width="246" align="center">
                <p>${certificate.member_type}</p>
            </td>
            <td width="246" dir="RTL">
                <p>نوع الجنس</p>
            </td>
        </tr>

        <tr>
            <td width="246">
                <p>Membership No</p>
            </td>
            <td colspan="2" width="246" align="center">
                <p>${certificate.membership_no}</p>
            </td>
            <td width="246" dir="RTL">
                <p>رقم العضویة</p>
            </td>
        </tr>

        <tr>
            <td width="246">
                <p>Accommodation Type</p>
            </td>
            <td colspan="2" width="246" align="center">
                <p>${certificate.accommod_type}</p>
            </td>
            <td width="246" dir="RTL">
                <p>درجة الإقامة</p>
            </td>
        </tr>

        <tr>
            <td width="246">
                <p>Date of Birth</p>
            </td>
            <td colspan="2" width="246" align="center">
                <p>${certificate.birth_dt?datetime!}</p>
            </td>
            <td width="246" dir="RTL">
                <p>تاریخ المیلاد</p>
            </td>
        </tr>

        <tr>
            <td width="246">
                <p>Member Effective Date</p>
            </td>
            <td colspan="2" width="246" align="center">
                <p>${certificate.member_effective_dt?datetime!}</p>
            </td>
            <td width="246" dir="RTL">
                <p>صالحة من تاریخ</p>
            </td>
        </tr>

        <tr>
            <td width="246">
                <p>Policy Expiry Date</p>
            </td>
            <td colspan="2" width="246" align="center">
                <p>${certificate.policy_expiry_dt?datetime!}</p>
            </td>
            <td width="246" dir="RTL">
                <p>صالحة لغایة</p>
            </td>
        </tr>

        <tr>
            <td width="246">
                <p>Deductible within minimum limit APN</p>
            </td>
            <td colspan="2" width="246" align="center">
                <#if  certificate.min_limit ==0 >
                <p>Not Applicable </p>
                <#else >
                <p>Minimum Limit : ${certificate.ded_prcan}% Max SR. ${certificate.min_limit}</p>
                </#if >
            </td>
            <td width="246" dir="RTL">
                <p>الإقتطاع / التحمل داخل شبكة الحد الأدنى</p>
                <p>&nbsp;</p>
            </td>
        </tr>

        <tr>
            <td width="246">
                <p>Deductible for hospital not within minimum limit APN</p>
            </td>
            <td colspan="2" width="246" align="center">
                <#if certificate.max_limit == 0 >
                <p>Not Applicable </p>
                <#else >
                <p>Maximum Limit : ${certificate.ded_prcan}% Max SR. ${certificate.max_limit}</p>
                </#if >

            </td>
            <td width="246" dir="RTL">
                <p>الإقتطاع / التحمل للمستشفيات خارج شبكة الحد الأدنى</p>
                <p>&nbsp;</p>
            </td>
        </tr>

        <tr>
            <td width="246">
                <p>Deductible for other service providers not within minimum limit APN</p>
            </td>
            <td colspan="2" width="246" align="center">
                <#if certificate.med_limit == 0 >
                <p>Not Applicable </p>
                <#else >
                <p>Medium Limit : ${certificate.ded_prcan}% Max SR. ${certificate.med_limit}</p>
                 </#if >

            </td>
            <td width="246" dir="RTL">
                <p>الإقتطاع / التحمل لباقي مقدمي الخدمة خارج شبكة الحد الأدنى</p>
            </td>
        </tr>

        <tr>
            <td width="246">
                <p>Policy Number</p>
            </td>
            <td colspan="2" width="246" align="center">
                <p>${certificate.policy_no}</p>
            </td>
            <td width="246" dir="RTL">
                <p>رقم الوثیقة</p>
            </td>
        </tr>

        <tr>
            <td width="246">
                <p>Policyholder Name</p>
            </td>
            <td colspan="2" width="246" align="center">
                <p>${certificate.policyholder_name}</p>
            </td>
            <td width="246" dir="RTL">
                <p>اسم حامل الوثیقة</p>
            </td>
        </tr>

        <tr>
            <td colspan="2" width="369">
                <p>All other terms and conditions are as per policy</p>
            </td>
            <td colspan="2" width="369" dir="RTL">
                <p>جمیع شروط الوثيقة تخضع لبنود التعاقد</p>
            </td>
        </tr>


        <tr>
            <td colspan="2" width="369">
                <p>This certificate is issued as Health Insurance for this member. If this member need any treatment that is covered under this policy, please provide it, and charge to Gulf Union Cooperative Insurance Company as per policy terms &amp; conditions.</p>
            </td>
            <td colspan="2" width="369" dir="RTL">
                <p>إن ھذه الشھادة اصدرت مؤقتا للعضو وفي حالة حاجته الى ایة خدمات علاجیة مدرجة تحت بنود الوثيقة الخاص به الرجاء تقدیم</p>
                <p>الخدمة العلاجیة وارسال الفواتیر الى شركة اتحاد الخليج للتامين التعاوني.</p>
            </td>
        </tr>


        <tr>
            <td colspan="2" width="369">
                <p>If you have any queries, please contact our customer service line 920029926.</p>
            </td>
            <td colspan="2" width="369" dir="RTL">
                <p>لمزید من المعلومات الرجاء الاتصال بقسم خدمة العملاء</p>
                <p>920029926.</p>
            </td>
        </tr>


        <tr>
            <td colspan="2" width="369">
                <p>This certificate is valid only for the named insured person when accompanied with ID documents.</p>
            </td>
            <td colspan="2" width="369" dir="RTL">
                <p>إن ھذه الشھادة صالحة فقط للعضو المذكور اعلاه شرط توفر بطاقة ھویة رسمیة.</p>
            </td>
        </tr>



        <tr>
            <td colspan="2" width="369">
                <p>This is a system generated certificate does not require signature and stamp</p>
            </td>
            <td colspan="2" width="369" dir="RTL">
                <p>هذه الوثيقة صادرة من النظام ولا تحتاج الى ختم أو توقيع</p>
            </td>
        </tr>


        </tbody>
    </table>
</div>
    </div>
</div>
</div>

</@base.base>