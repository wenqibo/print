package com.print.bin;

import java.io.*;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.*;

public class PDFTest {
	public static final String SRC1 = "src/main/resources/pdfs/1.pdf";
	public static final String SRC2 = "src/main/resources/pdfs/2.pdf";
	public static final String DEST = "src/main/resources/pdfs/test.pdf";
	public static final String pdfSourceFile = "src/main/resources/pdfs/test.pdf";


	public static void main(String[] args) throws IOException,
			DocumentException {
		File file = new File(DEST);
		file.getParentFile().mkdirs();
//		new PDFTest().manipulatePdf(SRC1, SRC2, DEST);

		// System.out.println("java_vendor:" +
		//
//		System.out.print(isBlank());
//		createBlankDoc();
//		System.out.print(isBroken());
		System.out.print(isOdd());
	}
	public static boolean isOdd() {
		String filePath = "src/main/resources/pdfs/test.pdf";
		PdfReader reader = null;
		int n = 0;
		try {
			reader = new PdfReader(filePath);
			n = reader.getNumberOfPages();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return n%2 != 0;
	}

	public static boolean isBroken(){
		String filePath = "src/main/resources/pdfs/test2.pdf";
		Document document = null;
		PdfReader reader = null;
		int n = 0;
		try {
//			document = new Document(new PdfReader(filePath).getPageSize(1));
//			document.open();
			reader = new PdfReader(filePath);
			n = reader.getNumberOfPages();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return n == 0;
	}
	public static boolean isBlank(){
		PdfReader r = null;
		byte [] bContent = null;
		try {
			r = new PdfReader("src/main/resources/pdfs/test2.pdf");
			RandomAccessFileOrArray raf = new RandomAccessFileOrArray("src/main/resources/pdfs/test2.pdf");
			Document document = new Document(r.getPageSizeWithRotation(1));
			System.out.println(r.getNumberOfPages());
			document.open();

			int i = 1;

			bContent = r.getPageContent(i,raf);
			System.out.println(bContent.length);

			document.close();
			raf.close();
			r.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bContent.length <=20;
	}
	public static void createBlankDoc() {

		Document document = new Document();
		try {
			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("src/main/resources/pdfs/test2.pdf"));
			document.open();
			writer.setPageEmpty(false);
//			document.add(new Paragraph("This page will NOT be followed by a blank page!"));
			document.newPage();

			document.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void manipulatePdf(String src, String dest) throws IOException,
			DocumentException {
		// Creating a reader
		PdfReader reader = new PdfReader(src);
		// step 1
		Document document = new Document(PageSize.A3.rotate());
		// step 2
		PdfWriter writer = PdfWriter.getInstance(document,
				new FileOutputStream(dest));
		// step 3
		document.open();
		// step 4
		PdfContentByte canvas = writer.getDirectContent();
		float a4_width = PageSize.A4.getWidth();
		int n = reader.getNumberOfPages();
		int p = 0;
		PdfImportedPage page;
		while (p++ < n) {
			page = writer.getImportedPage(reader, p);
			if (p % 2 == 1) {
				canvas.addTemplate(page, 0, 0);
			} else {
				canvas.addTemplate(page, a4_width, 0);
				document.newPage();
			}
		}
		// step 5
		document.close();
		reader.close();
	}

	public void manipulatePdf(String src1, String src2, String dest)
			throws IOException, DocumentException {
		// Creating a reader
		PdfReader reader1 = new PdfReader(src1);
		PdfReader reader2 = new PdfReader(src2);
		// step 1
		Document document = new Document(PageSize.A4.rotate());
		// step 2
		PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(dest));
		// step 3
		document.open();
		// step 4
		PdfContentByte canvas = writer.getDirectContent();
		float a4_width = PageSize.A4.getWidth();
		System.out.println(PageSize.A5.getWidth() + "--" + PageSize.A5.getHeight());
		System.out.println(PageSize.A4.getWidth() + "--" + PageSize.A4.getHeight());
		int n = reader1.getNumberOfPages();
		int p = 0;
		PdfImportedPage page1;
		PdfImportedPage page2;
		while (p++ < n) {
			page1 = writer.getImportedPage(reader1, p);
			page2 = writer.getImportedPage(reader2, p);
			float size = (PageSize.A4.getHeight() - page1.getWidth() - page2.getWidth())/3;
			canvas.addTemplate(page1, size, (a4_width/2) - (page1.getHeight()/2));
			canvas.addTemplate(page2, size + page1.getWidth(), (a4_width/2) - (page1.getHeight()/2));
			document.newPage();
		}
		// step 5
		document.close();
		reader1.close();
		reader2.close();
	}
}
