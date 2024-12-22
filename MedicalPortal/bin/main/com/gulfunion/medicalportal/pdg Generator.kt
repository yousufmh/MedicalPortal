package com.gulfunion.medicalportal
//
//import com.itextpdf.text.Document
//import com.itextpdf.text.PageSize
//import com.itextpdf.text.pdf.PdfWriter
//import com.itextpdf.tool.xml.XMLWorkerHelper
//import freemarker.template.Configuration
//import freemarker.template.Template
//import freemarker.template.TemplateException
//import freemarker.template.TemplateExceptionHandler
//import java.io.*
//import java.nio.charset.Charset
//
//
//fun loadFtlHtml( fileName: String?, globalMap: Map<*, *>?): ByteArrayOutputStream? {
//    require(!( globalMap == null || fileName == null || "" == fileName)) { "Directory file" }
//    val cfg = Configuration(Configuration.DEFAULT_INCOMPATIBLE_IMPROVEMENTS)
//    return try {
//        val file = MainController::class.java.getResource("/templates").file
//        cfg.setDirectoryForTemplateLoading(File(file))
//        cfg.defaultEncoding = "UTF-8"
//        cfg.templateExceptionHandler = TemplateExceptionHandler.RETHROW_HANDLER //.RETHROW
//        cfg.isClassicCompatible = true
//        val temp: Template = cfg.getTemplate(fileName)
//        val stringWriter = StringWriter()
//        temp.process(globalMap, stringWriter)
//        savePdf(ByteArrayOutputStream(), stringWriter.toString() )
//    } catch (e: IOException) {
//        e.printStackTrace()
//        throw RuntimeException("load fail file")
//    } catch (e: TemplateException) {
//        e.printStackTrace()
//        throw RuntimeException("load fail file")
//    }
//}
//
//fun savePdf(out: ByteArrayOutputStream ?, html: String?): ByteArrayOutputStream? {
//    val document = Document(PageSize.A4, 50f, 50f, 60f, 60f)
//    val input= ByteArrayInputStream(html?.toByteArray(Charset.forName("UTF-8")))
//    try {
//        val writer = PdfWriter.getInstance(document, out)
//        document.open()
////        ByteArrayInputStream(out?.toByteArray())
//        XMLWorkerHelper.getInstance().parseXHtml(writer, document, input, Charset.forName("UTF-8"))
////        println("finished ${input.readAllBytes()}")
//
//    } catch (e: Exception) {
//        e.printStackTrace()
//        println("exception in savePDF ${e.printStackTrace()}")
//         ByteArrayInputStream(out?.toByteArray())
//    } finally {
//        document.close()
//         return out
//    }
//}