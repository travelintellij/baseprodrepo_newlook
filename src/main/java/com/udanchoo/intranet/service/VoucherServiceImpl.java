package com.udanchoo.intranet.service;


import java.awt.Color;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.graphics.blend.BlendMode;
import org.apache.pdfbox.pdmodel.graphics.state.PDExtendedGraphicsState;
import org.apache.pdfbox.util.Matrix;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;
import org.thymeleaf.spring5.templateresolver.SpringResourceTemplateResolver;
import org.thymeleaf.templatemode.TemplateMode;
//import org.thymeleaf.TemplateEngine;
//import org.thymeleaf.context.Context;
import org.xhtmlrenderer.pdf.ITextRenderer;
 
import com.itextpdf.text.DocumentException;
import com.udanchoo.intranet.entity.TI_Hotel_Voucher_Entity;
import com.udanchoo.intranet.repository.TI_Hotel_Voucher_Repository;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



@Service
@Transactional
public class VoucherServiceImpl {


	  @Autowired
	  private ApplicationContext applicationContext;
	  
	  @Autowired
	  private TI_Hotel_Voucher_Repository hotelVoucherRepository;
	  
	  
	  private SpringTemplateEngine thymeleafTemplateEngine() {
		    SpringResourceTemplateResolver templateResolver = new SpringResourceTemplateResolver();
		    templateResolver.setApplicationContext(applicationContext);
		    templateResolver.setPrefix("classpath:/thymeleaf-template/");
		    templateResolver.setSuffix(".html");
		    templateResolver.setTemplateMode(TemplateMode.HTML);

		    SpringTemplateEngine engine = new SpringTemplateEngine();
		    engine.setTemplateResolver(templateResolver);

		    return engine;
		  }
	  
	  private Logger logger = LoggerFactory.getLogger(VoucherServiceImpl.class);
	  
	  public boolean generatePdfFile(String templateName, Map<String, Object> data,String quotationFilePath, String pdfFileName,String waterMarkBrandName) throws com.lowagie.text.DocumentException {
          /*try {
	          Path path = Paths.get(quotationFilePath);
	          if (!Files.exists(path)) {
	              Files.createDirectories(path);
	          }
          }
          catch(Exception e) {
        	  e.printStackTrace();
          }
          //return true;
		  */
		 
		  Context context = new Context();
	        context.setVariables(data);
	        String htmlContent = thymeleafTemplateEngine().process(templateName, context);
	        try {
	            Path path = Paths.get(quotationFilePath);
	            if (!Files.exists(path)) {
	                Files.createDirectories(path);
	            }

	            FileOutputStream fileOutputStream = new FileOutputStream(quotationFilePath + File.separator + pdfFileName);
	            ITextRenderer renderer = new ITextRenderer();
	            renderer.setDocumentFromString(htmlContent);
	            renderer.layout();
				renderer.createPDF(fileOutputStream, false);
	            renderer.finishPDF();
	            addWatermark(new File(quotationFilePath + File.separator + pdfFileName),waterMarkBrandName);
	            fileOutputStream.close();
	            return true;

	        } catch (FileNotFoundException e) {
	            logger.error(e.getMessage(), e);
	            return false;
	        } catch (DocumentException e) {
	            logger.error(e.getMessage(), e);
	            return false;
	        } catch (IOException e) {
	            logger.error(e.getMessage(), e);
	            return false;
	        } 
	       
	    }

	    private void addWatermark(File file,String waterMarkBrandName) throws IOException, com.itextpdf.text.DocumentException {
	        try (PDDocument doc = PDDocument.load(file)) {
	            // Loop through each page to add text water mark on each page
	            for (final PDPage page : doc.getPages()) {
	                final PDFont font = PDType1Font.TIMES_ITALIC;
	                addWatermarkText(doc, page, font, waterMarkBrandName);
	            }
	            doc.save(file);
	        }
	    }

	    private static void addWatermarkText(final PDDocument doc, final PDPage page, final PDFont font, final String text)
	            throws IOException {
	        try (PDPageContentStream cs = new PDPageContentStream(doc, page, PDPageContentStream.AppendMode.APPEND, true,
	                true)) {
	            final float fontHeight = 70; // arbitrary for short text
	            final float width = page.getMediaBox().getWidth();
	            final float height = page.getMediaBox().getHeight();
	            final float stringWidth = font.getStringWidth(text) / 1000 * fontHeight;
	            final float diagonalLength = (float) Math.sqrt(width * width + height * height);
	            final float angle = (float) Math.atan2(height, width);
	            final float x = (diagonalLength - stringWidth) / 2; // "horizontal" position in rotated world
	            final float y = -fontHeight / 4; // 4 is a trial-and-error thing, this lowers the text a bit
	            cs.transform(Matrix.getRotateInstance(angle, 0, 0));
	            cs.setFont(font, fontHeight);
	            // cs.setRenderingMode(RenderingMode.STROKE) // for "hollow" effect

	            final PDExtendedGraphicsState gs = new PDExtendedGraphicsState();
	            gs.setNonStrokingAlphaConstant(0.2f);
	            gs.setStrokingAlphaConstant(0.2f);
	            gs.setBlendMode(BlendMode.MULTIPLY);
	            gs.setLineWidth(2f);
	            cs.setGraphicsStateParameters(gs);

	            // Set color
	            cs.setNonStrokingColor(Color.LIGHT_GRAY);
	            cs.setStrokingColor(Color.LIGHT_GRAY);

	            cs.beginText();
	            cs.newLineAtOffset(x, y);
	            cs.showText(text);
	            cs.endText();
	        }
	    }
	
	    public boolean checkVoucherHtlServiceLineExist(long htlServiceLineId) {
	    	return hotelVoucherRepository.existsByHtlServiceId(htlServiceLineId);
	    }
	
	    public TI_Hotel_Voucher_Entity find_HotelVoucher_By_HotelServiceId(long htlServiceLineId) {
	    	return hotelVoucherRepository.findByHtlServiceId(htlServiceLineId);
	    }
	    
	    public int delete_HotelVoucher_By_HotelServiceId(long htlServiceLineId) {
	    	return hotelVoucherRepository.deleteByHtlServiceId(htlServiceLineId);
	    }
}
