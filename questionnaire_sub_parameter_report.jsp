<%@page import="com.sits.affiliation.common_master.questionnaire_sub_param_master.QuestionnaireSubParamMastModel"%>
<%@page import="com.sits.affiliation.common_master.questionnaire_sub_param_master.QuestionnaireSubParamMastManager"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.sun.prism.paint.Color"%>
<%@ page import="com.itextpdf.text.Image"%>
<%@page import="com.sits.general.General"%>
<%@page import="javax.swing.GroupLayout.Alignment"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@ page import="com.sits.general.ReadProps"%>
<%@ page import="com.sits.general.ReportUtil"%>
<%@ page import="com.sits.general.General"%>
<%@ page import="java.util.*" %>
<%@page  import="org.apache.poi.hssf.usermodel.HSSFCellStyle" %>
<%@page  import="org.apache.poi.hssf.usermodel.HSSFFont"%>
<%@page  import="org.apache.poi.*"%>
<%@page  import="org.apache.poi.ss.usermodel.Cell"%>
<%@page  import="org.apache.poi.ss.usermodel.Row"%>
<%@page  import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page  import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@page  import="org.apache.poi.xssf.usermodel.XSSFClientAnchor"%>
<%@page  import="org.apache.poi.xssf.usermodel.XSSFDrawing"%>
<%@page  import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page  import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page  import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page  import="java.io.FileOutputStream" %>
<%@page  import="java.io.File" %>
<%@page  import="java.io.*" %>
<%@page  import="org.apache.poi.ss.usermodel.IndexedColors"%>
<%@page  import="org.apache.poi.ss.usermodel.Header" %>
<%@ page import="org.apache.poi.ss.usermodel.Drawing"%>
<%@ page import="org.apache.poi.ss.usermodel.ClientAnchor"%>
<%@ page import="org.apache.poi.ss.usermodel.CreationHelper"%>
<%@ page import="org.apache.poi.ss.usermodel.Picture"%>
<%@ page import="org.apache.poi.util.IOUtils"%>
<%@ page import="org.apache.poi.ss.util.CellRangeAddress"%>
<%@ page import="org.apache.poi.ss.util.CellUtil"%>
<%@ page import="org.apache.poi.ss.usermodel.BorderStyle"%>
<%@ page import="org.apache.poi.ss.usermodel.HorizontalAlignment"%>
<%@ page import="org.apache.poi.ss.usermodel.VerticalAlignment"%>
<%@ page import="org.apache.poi.ss.usermodel.PrintSetup"%>


	<%
		try{
			JSONArray list =new JSONArray();
			 list =QuestionnaireSubParamMastManager.getList("");
					
					
	               if(list.size()==0 ){%>
				        <script type="text/javascript" >window.parent.revertBack1();</script>   						  
				  <%}else {
					//EXCEL PATH:
					response.setHeader("Content-Disposition", "attachment; filename=\"Questionnaire Sub Parameter Report.xls");
						/* String headerName = "CENTRAL UNIVERSITY OF KERALA";*/
					//String headerName1 = "Indira Gandhi Rastriya Uran Akademi \r\n"; 
					String fName="Questionnaire Sub Parameter Report.xls";
					String path=request.getServletContext().getRealPath("/ExcelFile");
					String  excelFilePath=path+"/"+File.separator+fName; //change 
				
				    File aDirectory1 = new File(path);
				
					if(!aDirectory1.exists())
					{
						aDirectory1.mkdirs();
					}
					File file=new File(excelFilePath);
					Workbook workbook = null;
					if(excelFilePath.endsWith("xlsx"))
					{
						workbook = new XSSFWorkbook();
					} else if(excelFilePath.endsWith("xls"))
					{
						workbook = new HSSFWorkbook();
					} else 
					{
	
						workbook.close();
						throw new Exception("Questionnaire Sub Parameter Report.jsp - Invalid file name, should be xls or xlsx");	
					}
					Sheet sheet = workbook.createSheet();
	
					sheet.getPrintSetup().setPaperSize(PrintSetup.A3_PAPERSIZE);
	
					int indx=0;
	
					CreationHelper createHelper = workbook.getCreationHelper();
					HSSFFont font = (HSSFFont) workbook.createFont();
					font.setBold(true);
					font.setFontName("Vardana");
					font.setFontHeightInPoints((short)8);
	
					//borders setting && style
					HSSFCellStyle styleH = (HSSFCellStyle) workbook.createCellStyle();
				    styleH.setFont(font);
					styleH.setWrapText(true); 
					styleH.setFillBackgroundColor(IndexedColors.BRIGHT_GREEN.index);  
					styleH.setAlignment(HorizontalAlignment.CENTER);
					styleH.setVerticalAlignment(VerticalAlignment.CENTER);
	
				    HSSFFont font3       = (HSSFFont) workbook.createFont();
					font3.setFontName("Vardana");
					font3.setFontHeightInPoints((short)8);
				    HSSFCellStyle styleL = (HSSFCellStyle) workbook.createCellStyle();
					styleL.setFont(font3);
					styleL.setBorderBottom(BorderStyle.THIN);  
					styleL.setBottomBorderColor(IndexedColors.BLACK.getIndex());  
					styleL.setBorderRight(BorderStyle.THIN);  
					styleL.setRightBorderColor(IndexedColors.BLACK.getIndex());  
					styleL.setBorderTop(BorderStyle.THIN);  
					styleL.setTopBorderColor(IndexedColors.BLACK.getIndex());  
					styleL.setBorderLeft(BorderStyle.THIN); 
					styleL.setLeftBorderColor(IndexedColors.BLACK.getIndex());
					styleL.setWrapText(true);
					styleL.setAlignment(HorizontalAlignment.LEFT);
					styleL.setVerticalAlignment(VerticalAlignment.CENTER);
					
				
					
					HSSFCellStyle styleR = (HSSFCellStyle) workbook.createCellStyle();
					styleR.setFont(font);
					styleR.setWrapText(true); 
					styleR.setFillBackgroundColor(IndexedColors.BRIGHT_GREEN.index);  
					styleR.setAlignment(HorizontalAlignment.RIGHT);
					styleR.setVerticalAlignment(VerticalAlignment.CENTER); 
					    
				    HSSFCellStyle styleF = (HSSFCellStyle) workbook.createCellStyle();
				    styleF.setFont(font);
					styleF.setWrapText(true); 
					styleF.setFillBackgroundColor(IndexedColors.BRIGHT_GREEN.index);  
					styleF.setAlignment(HorizontalAlignment.CENTER);
					styleF.setVerticalAlignment(VerticalAlignment.BOTTOM); 
					
				    HSSFCellStyle style = (HSSFCellStyle) workbook.createCellStyle();
					style.setFont(font);
					style.setWrapText(true); 
					style.setFillBackgroundColor(IndexedColors.BRIGHT_GREEN.index);  
					style.setFillForegroundColor(IndexedColors.BLACK.index);
					style.setBorderBottom(BorderStyle.THICK);  
		            style.setBottomBorderColor(IndexedColors.BLACK.getIndex());  
		            style.setBorderRight(BorderStyle.THICK);  
		            style.setRightBorderColor(IndexedColors.BLACK.getIndex());  
		            style.setBorderTop(BorderStyle.THICK);  
		            style.setTopBorderColor(IndexedColors.BLACK.getIndex());  
		            style.setBorderLeft(BorderStyle.THICK); 
		            style.setLeftBorderColor(IndexedColors.BLACK.getIndex());
		            style.setAlignment(HorizontalAlignment.CENTER);
				    style.setVerticalAlignment(VerticalAlignment.CENTER);
				    style.setRotation((short)90);
				 //style.setAlignment(.);
				//--------- Style------
					HSSFFont font1       = (HSSFFont) workbook.createFont();
					font1.setFontName("Vardana");
					font1.setFontHeightInPoints((short)8);
					HSSFCellStyle style1 = (HSSFCellStyle) workbook.createCellStyle();
				    style1.setFont(font1);
				    style1.setBorderBottom(BorderStyle.THIN);  
			        style1.setBottomBorderColor(IndexedColors.BLACK.getIndex());  
			        style1.setBorderRight(BorderStyle.THIN);  
			        style1.setRightBorderColor(IndexedColors.BLACK.getIndex());  
			        style1.setBorderTop(BorderStyle.THIN);  
			        style1.setTopBorderColor(IndexedColors.BLACK.getIndex());  
			        style1.setBorderLeft(BorderStyle.THIN); 
			        style1.setLeftBorderColor(IndexedColors.BLACK.getIndex());
				    style1.setWrapText(true);
				    style1.setAlignment(HorizontalAlignment.CENTER);
				    style1.setVerticalAlignment(VerticalAlignment.CENTER);
					
					
				    //setting the merging of cell:
				    Row rowh1 = sheet.createRow((short) 1);
					Cell cell = rowh1.createCell((short) 2);
					cell.setCellValue(createHelper.createRichTextString(""));	
					cell.setCellStyle(styleH);
					
					//CellRangeAddress cellRangeAddress = new CellRangeAddress(1, 8, 2, 14);
			        //sheet.addMergedRegion(cellRangeAddress);
	
					//
					sheet.setColumnWidth(indx++,2500);
					sheet.setColumnWidth(indx++,1500);
					sheet.setColumnWidth(indx++,2500);
					sheet.setColumnWidth(indx++,1500);
					
					//Logo of University.
				    ServletContext servletContext = request.getServletContext();
				   /*  String path2 = File.separator + "images" + File.separator + "header.png";
				   String contextPath = servletContext.getRealPath(path2);	
					
				   InputStream inputStream = new FileInputStream(contextPath); 
				   //Get the contents of an InputStream as a byte[].
				   byte[] byts = IOUtils.toByteArray(inputStream);
				   //Adds a picture to the workbook
				   int pictureIdx = workbook.addPicture(byts, Workbook.PICTURE_TYPE_PNG);
				   //close the input stream
				   inputStream.close();
				 */
				   //Returns an object that handles instantiating concrete classes
				   CreationHelper helper = workbook.getCreationHelper();
				
				   //Creates the top-level drawing patriarch.
				   Drawing drawing = sheet.createDrawingPatriarch();
				
				   //Create an anchor that is attached to the worksheet
				   //ClientAnchor anchor = helper.createClientAnchor();
				   //set top-left corner for the image
				   
				   
				    ClientAnchor anchor = helper.createClientAnchor();		    
				    anchor.setCol1(2);
				    anchor.setRow1(3);		    
				    anchor.setCol2(14);
				    anchor.setRow2(8);
				    anchor.setAnchorType(ClientAnchor.AnchorType.DONT_MOVE_AND_RESIZE);
				    //drawing.createPicture(anchor, pictureIdx);
					        
		            int rowIndex=10;
		            Row row = null;
		            indx=3;
		            
		            Row row1 = sheet.createRow(0);
		            
		            cell = row1.createCell(0);
		            cell.setCellValue(createHelper.createRichTextString("S.No."));
		            sheet.setColumnWidth(indx++, 4000);
					cell.setCellStyle(styleH);
					
		            cell = row1.createCell(1);
		            cell.setCellValue(createHelper.createRichTextString("Questionnaire Name"));	
		            sheet.setColumnWidth(indx++, 4000);
					cell.setCellStyle(styleH);


				       
		            cell = row1.createCell(2);
		            cell.setCellValue(createHelper.createRichTextString("Feedback Question Description"));	 
		            sheet.setColumnWidth(indx++, 4000);
					cell.setCellStyle(styleH);
					
		            
		            cell = row1.createCell(3);
		            cell.setCellValue(createHelper.createRichTextString("Option Value"));	 
		            sheet.setColumnWidth(indx++, 4000);
					cell.setCellStyle(styleH);
					
		            
		            cell = row1.createCell(4);
		            cell.setCellValue(createHelper.createRichTextString("Order No."));	 
		            sheet.setColumnWidth(indx++, 4000);
					cell.setCellStyle(styleH);
					/* cellRangeAddress = new CellRangeAddress(10,12,5,5);
		            sheet.addMergedRegion(cellRangeAddress); */
		            
		            cell = row1.createCell(5);
		            cell.setCellValue(createHelper.createRichTextString("Parameter Flag."));	 
		            sheet.setColumnWidth(indx++, 4000);
					cell.setCellStyle(styleH);
					/* cellRangeAddress = new CellRangeAddress(10,12,5,5);
		            sheet.addMergedRegion(cellRangeAddress);
		             */
		            cell = row1.createCell(6);
		            cell.setCellValue(createHelper.createRichTextString("Sub Option Value."));	 
		            sheet.setColumnWidth(indx++, 4000);
					cell.setCellStyle(styleH);
					/* cellRangeAddress = new CellRangeAddress(10,12,5,5);
		            sheet.addMergedRegion(cellRangeAddress); */
		                QuestionnaireSubParamMastModel trReportModel=new QuestionnaireSubParamMastModel(); 
		            	int rowCount=1,k=0;
		            	int s=1;
		            	//int index=list.size();
		            	for(int i=0;i<list.size();i++){
		            		  //list.get(i);
		            		  list.get(i);
		            		  String dss= list.get(i)+"";
		            		  Object obj=JSONValue.parse(dss);    
		            		  JSONObject jsonObject = (JSONObject) obj;   
		            		  String name = (String) jsonObject.get("ques_name");   
		            		  String Feedback_desc = (String) jsonObject.get("Feedback_desc");
		            		  String opt_val = (String) jsonObject.get("opt_val");
		            		  String order_no = (String) jsonObject.get("order_no");
		            		  String param_flag = (String) jsonObject.get("param_flag");
		            		  String sub_opt = (String) jsonObject.get("sub_opt");
		            		  
		            		  //String p=object.get("sxsd");
		            		int cellIndx=0;
		            		k++;
		            		Row rowe = null;
		                	rowe = sheet.createRow(rowCount++);
		                	trReportModel.writeCell(rowe, s+"", cellIndx++, styleL, "S");
		                	trReportModel.writeCell(rowe,name, cellIndx++, style1, "S");
		                	trReportModel.writeCell(rowe,Feedback_desc, cellIndx++, style1, "S");
		                	trReportModel.writeCell(rowe,opt_val, cellIndx++, style1, "S");
		                	trReportModel.writeCell(rowe, order_no, cellIndx++, style1, "S");
		                	trReportModel.writeCell(rowe, param_flag, cellIndx++, style1, "S");
		                	trReportModel.writeCell(rowe, sub_opt, cellIndx++, styleL, "S");
		                
		                	
		                } 
	          	
					
					
					FileOutputStream fos = new FileOutputStream(excelFilePath);
					workbook.write(fos);
					response.setHeader("Content-Disposition", "attachment; filename=\"Questionnaire Sub Parameter Report.xls");
					FileInputStream fileInputStream = new FileInputStream(file);
					OutputStream responseOutputStream = response.getOutputStream();
					int bytes;
					while ((bytes = fileInputStream.read()) != -1) {
					    responseOutputStream.write(bytes);
					}
					
					fileInputStream.close();
					responseOutputStream.close();    
					fos.close();
					fileInputStream.close();
					responseOutputStream.close();
			 	
					
		 }	
%>			
<% } catch (Exception e) {
	System.out.println("questionnaire_sub_parameter_report.jsp"+e.getMessage());
}%>

