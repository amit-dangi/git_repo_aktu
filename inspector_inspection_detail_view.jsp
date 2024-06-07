<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.sits.affiliation.approval.inspector_inspection_detail.InspectorInspectionManager"%>
    <%@page import="com.sits.affiliation.approval.inspector_inspection_detail.*"%>
    <%@page import="com.sits.general.General"%>
    <%@page import="java.util.ArrayList" %>
    <%@page import="org.json.simple.JSONObject"%>
    <%@page import="java.util.Iterator"%>
	<%@page import="com.sits.general.QueryUtil"%>
	<%@include file="../myCks.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"href="../assets/sits/bootstrap/3.3.7/css/bootstrap.min.css"type="text/css">
<link rel="stylesheet"href="../resources//bootstrap/css/bootstrap.min.css"type="text/css">
<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
<script src="../resources//bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
<script type="text/javascript" src="../resources/js/common/validations.js"></script>
<script type="text/javascript" src="../resources/js/common/gen.js"></script>
<script type="text/javascript" src="../resources/js/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="../resources/js/affiliation/inspector-inspection-detail.js"></script>
<link rel="stylesheet" href="../resources/css/datepicker/datepicker3.css"  type="text/css">

<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/responsive.css" rel="stylesheet"type="text/css" />
<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css"rel="stylesheet" type="text/css" />
</head>
<style>

#loader{
  position: fixed;
  left: 0px;
  top: 0px;
  width: 100%;
  height: 100%;
  z-index: 9999;
  opacity: .8;
  background: url('../resources/images/ajax-loader.gif') 50% 50% no-repeat rgb(249,249,249);
}
  

.pd-lebel{
padding-right:0px !important;
padding-left:0px !important;
padding-top: 1px !important;;
}
.pd-link{padding-right:0px !important;

}

.accordion .card-header:after {
    font-family: 'FontAwesome';  
    content: "\f068";
    float: right; 
     color:#ffffff;
}
.accordion .card-header.collapsed:after {
    /* symbol for "collapsed" panels */
    content: "\f067"; 
    color:#ffffff;
}
.card-title{
font-family: Calibri, verdana,Arial, Helvetica, sans-serif;
    font-size: 13px;
    color: #ffffff;
    font-weight: bold;
    cursor: pointer;
}
	.boxAlign{
		margin: 5px 0 0 !important;
		margin-right: 5px !important;
	}
	.page-header-2 .repTitle {
    font-family: Calibri, verdana;
    font-size: 16px;
    font-weight: bold;
    padding: 10px 0px;
    color: #720c01 !important;
    width: 100%;
    float: left;
}
.btn-view1 {
    border-color: #687DB4;
    font-size: 14px;
    /* box-shadow: 2px 2px 1px #336376; */
    color: #ffffff;
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#16261d), color-stop(100%,#5c746b));
    box-shadow: 2px 2px 1px #07680a;
    background-image: -ms-linear-gradient(bottom, #336376 0%, #78B9D2 100%);
    filter: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#336376,endColorStr=#78B9D2);
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#37983b), color-stop(100%,#395640));
    /* background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#336376), color-stop(100%,#78B9D2)); */
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    -khtml-border-radius: 5px;
    border-radius: 5px;
    margin: 0px 4px;
}
 .bold {
        font-weight: bold;
    }
</style>
<script>
	  $( document ).ready(function(){  
	    	 $(".XFDATE1").datepicker({
	    	       format : 'dd/mm/yyyy',
				   autoclose : true,
				   orientation: 'top',
				   todayHighlight: true,
	    	    });
	    	 
	    	 $("#XTDATE1").datepicker({
	    	       format : 'dd/mm/yyyy',
				   autoclose : true,
				   orientation: 'top',
				   todayHighlight: true,
	    	    });
	    	
	    	 $(window).on('load', function () { 
		     	   $("#loader").fadeOut(3000);  
		     });
	    	 
	    	});


	  </script>

<%
//According tab list
String Insp_remarks="",Insp_recm="",inspection_id="",memberfile="",inspection_by_id="",is_convinor="";
String Inst_Id= General.checknull(request.getParameter("Inst_Id"));
String session_code= General.checknull(request.getParameter("session_id"));
String isfinalsubmited= General.checknull(request.getParameter("isfinalsubmited"));
String is_pannel_member=  General.checknull(request.getParameter("is_pannel_member")); 
String IsSubmitClick=  General.checknull(request.getParameter("IsSubmitClick"));
inspection_by_id=  General.checknull(request.getParameter("convinor_id"));
is_convinor=  General.checknull(request.getParameter("is_convinor"));

String inspection_by =inspection_by_id.equals("")?employee_id:inspection_by_id ;
System.out.println("is_convinor||"+is_convinor+"|inspection_by_id||"+inspection_by_id);
//System.out.println("session_code"+session_code+"||inspection_by_id|"+inspection_by_id+"|inspection_by||"+inspection_by+"|IsSubmitClick|"+IsSubmitClick+"|isfinalsubmited|"+isfinalsubmited);
/* Inst_Id="CR00001"; */
ArrayList<InspectorInspectionModel> facilitieslist= InspectorInspectionManager.computerPeripheralFacilitiesDetails(Inst_Id,inspection_by);
ArrayList<InspectorInspectionModel> adminAmenilist= InspectorInspectionManager.administrative_AmenitiesDetails(Inst_Id,inspection_by);
ArrayList<InspectorInspectionModel> infralist= InspectorInspectionManager.InfrastructureDetails(Inst_Id,inspection_by);
ArrayList<InspectorInspectionModel> facultylist= InspectorInspectionManager.getfacultyDetails(Inst_Id,inspection_by);
ArrayList<InspectorInspectionModel> questionnairelist= InspectorInspectionManager.getquestionnairesDetails(Inst_Id,inspection_by);
//ArrayList<InspectorInspectionModel> affiliationlist= InspectorInspectionManager.getAffiliationDetails(Inst_Id,inspection_by);
ArrayList<InspectorInspectionModel> intakeDetaillist= InspectorInspectionManager.getAffIntakeDetail(Inst_Id,session_code);
//General information
JSONObject data = new JSONObject();
data=InspectorInspectionManager.getRegSavedData(Inst_Id);

JSONObject savedData = new JSONObject();
savedData=InspectorInspectionManager.getgeneralInfo(Inst_Id);
JSONObject attachList = new JSONObject();
attachList=InspectorInspectionManager.getattachList(Inst_Id);

JSONObject IscheckBox = new JSONObject();
IscheckBox=InspectorInspectionManager.getEOAIsChecked(Inst_Id,session_code);
String is_nirf="",is_qs="",is_NBA="",is_NAAC="",is_ugc="",is_adm="";

if(IscheckBox.get("is_nirf").equals("Y")){
	is_nirf="checked";
}
if(IscheckBox.get("is_qs").equals("Y")){
	is_qs="checked";
}
if(IscheckBox.get("is_NBA").equals("Y")){
	is_NBA="checked";
}
if(IscheckBox.get("is_NAAC").equals("Y")){
	is_NAAC="checked";
}
if(IscheckBox.get("is_ugc").equals("Y")){
	is_ugc="checked";
}
if(IscheckBox.get("is_adm").equals("Y")){
	is_adm="checked";
}
%>	  
	  
<body onload="getProgList('<%=Inst_Id%>');" > 
<div id="loader"></div>
<div class="container-fluid" >
			<form class="form-horizontal" name="relationMaster" action=""
				method="post" autocomplete="off">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title text-left" id="frmstatus">Inspection Details of <%=General.checknull(data.get("PROP_INST_NAME").toString())%></h2>
					</div>
					<div class="panel-body">
 
      <div class="panel-body"></div>
     <div id="accordionOne" class="accordion">
        <div class="card mb-0">
        <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading" style="background-color:  #4f624d;">
            <div class="card-header collapsed" data-toggle="collapse" href="#collapseOne">
                <a class="card-title">
                  Request for Affiliation
                </a>
            </div>
            </div>
            <div id="collapseOne" class="panel-body collapse" data-parent="#accordionOne" >
					<div class="form-group" >
					<div class="col-md-12">
						<div class="page-header-2">
			    			<div class="repTitle ">Affiliation Course & Sub Request Details</div>
						</div>
					</div>
				</div>
				<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
					<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
					<table id="searchTable" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
						<thead>
							<tr>
									<th class="text-center">S.No.</th>
									<th class="text-center">Request Name</th>
									<th class="text-center">Sub Request Name</th>
									<th class="text-center">Applied on</th>
									<th class="text-left">Course/Discipline Name</th>
							</tr>
						</thead>
						
						<tbody>
							<%
								int affsrno = 0;
								ArrayList<InspectorInspectionModel> affiliationlist= InspectorInspectionManager.getAffiliationDetails(Inst_Id,inspection_by, "1");
								for (InspectorInspectionModel affmodel : affiliationlist) {
									 Insp_remarks=affiliationlist.get(0).getInsp_remarks();

									 Insp_recm=affiliationlist.get(0).getInsp_recm();
									 inspection_id=affiliationlist.get(0).getInspection_id();
									 memberfile=affiliationlist.get(0).getFile_name();
							%>
								<tr>
									<td style="text-align: center; width: 5%;"><%=++affsrno%></td>
									<td style="text-align: center; width: 8%;"><%=General.checknull(affmodel.getReq_name())%></td>
									
									<% if(ReadProps.getkeyValue("sub_req.inst_name_change","sitsResource").equals(General.checknull(affmodel.getSub_req_name()))){ %>
									<td style="text-align:left; width:15%;">
										<a onclick="getIsSubOptions('<%=General.checknull(affmodel.getSub_req_id())%>', '<%=General.checknull(affmodel.getId()) %>','inst_name');" 
										style="text-decoration: underline; cursor: pointer;" target="_blank"><b><%=General.checknull(affmodel.getSub_req_name())%></b></a>	
									</td>
										
								<%} else if (ReadProps.getkeyValue("sub_req.merge_inst_name","sitsResource").equals(General.checknull(affmodel.getSub_req_name()))){%>
									<td style="text-align:left; width:15%;">
										<a onclick="getIsSubOptions('<%=General.checknull(affmodel.getSub_req_id())%>', '<%=General.checknull(affmodel.getId()) %>','merge_inst_name');" 
										style="text-decoration: underline; cursor: pointer;" target="_blank"><b><%=General.checknull(affmodel.getSub_req_name())%></b></a>	
									</td>
								<%}else if (ReadProps.getkeyValue("sub_req.merge_course","sitsResource").equals(General.checknull(affmodel.getSub_req_name()))){%>
									<td style="text-align:left; width:15%;">
										<a onclick="getIsSubOptions('<%=General.checknull(affmodel.getSub_req_id())%>', '<%=General.checknull(affmodel.getId()) %>','Merger_Course');" 
										 style="text-decoration: underline; cursor: pointer;" target="_blank"><b><%=General.checknull(affmodel.getSub_req_name())%></b></a>	
									</td>
								<%}else if (ReadProps.getkeyValue("sub_req.change_course_name","sitsResource").equals(General.checknull(affmodel.getSub_req_name()))){%>
									<td style="text-align:left; width:15%;">
										<a onclick="getIsSubOptions('<%=General.checknull(affmodel.getSub_req_id())%>', '<%=General.checknull(affmodel.getId()) %>','change_course_name');" 
										 style="text-decoration: underline; cursor: pointer;" target="_blank"><b><%=General.checknull(affmodel.getSub_req_name())%></b></a>	
									</td>
								<%}else if (ReadProps.getkeyValue("sub_req.apprv_after_break","sitsResource").equals(General.checknull(affmodel.getSub_req_name()))){%>
									<td style="text-align:left; width:15%;">
										<a onclick="getIsSubOptions('<%=General.checknull(affmodel.getSub_req_id())%>', '<%=General.checknull(affmodel.getId()) %>','apprv_after_break');" 
										 style="text-decoration: underline; cursor: pointer;" target="_blank"><b><%=General.checknull(affmodel.getSub_req_name())%></b></a>	
									</td>
								<%}else{ %>
									<td style="text-align:left; width:15%;"><%=General.checknull(affmodel.getSub_req_name())%></td>
								<% }%>
									
									<%-- <td style="text-align: left; width: 12%;"><%=General.checknull(affmodel.getSub_req_name())%></td> --%>
									<td style="text-align: center; width: 8%;"><%=General.checknull(affmodel.getApp_date())%></td>
									<td style="text-align:left; width:15%;">
									<a onclick="callModalForCourse('<%=General.checknull(affmodel.getCourse_Id())%>', '<%=General.checknull(affmodel.getId()) %>','Is_course');"
									 	style="text-decoration: underline; cursor: pointer;" target="_blank"><b><%=General.checknull(affmodel.getCourse_name())%></b></a>										
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
							
						<%-- <tbody>
						 <%int affsrno=0; for(InspectorInspectionModel affmodel:affiliationlist){
							 Insp_remarks=affiliationlist.get(0).getInsp_remarks();

							 Insp_recm=affiliationlist.get(0).getInsp_recm();
							 inspection_id=affiliationlist.get(0).getInspection_id();
							 memberfile=affiliationlist.get(0).getFile_name();
								%>
			                <tr>
								<td style="text-align:center; width:5%;"><%=++affsrno%></td>
								<td style="text-align:center; width:8%;"><%=General.checknull(affmodel.getReq_name())%></td>
								<td style="text-align:center; width:8%;"><%=General.checknull(affmodel.getSub_req_name())%></td>
								<td style="text-align:center; width:8%;"><%=General.checknull(affmodel.getApp_date())%></td>
								<td style="text-align:center; width:8%;"><%=General.checknull(affmodel.getCourse_name())%></td>
							 </tr>
							 <%} %>
						</tbody> --%>
					</table>
				  </div>
				</div>
				
				
				<div class="form-group" >
					<div class="col-md-12">
						<div class="page-header-2">
			    			<div class="repTitle ">Payment Details</div>
						</div>
					</div>
				</div>
				
				<div class="data-pad">
				<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
					<div id="" class="dataEntryDiv sticky-header" style="padding: 0px;display: inline-block;">
					 <table id="searchTable" class="table table-striped table-bordered table-hover setTable" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="text-center">S.No.</th>
								<th class="text-center">Request Name</th>
								<th class="text-left">Sub Request Name</th>
								<th class="text-center">Request Applied on</th>
								<th class="text-center">Amount</th>
								<th class="text-center">Status</th>
							<tr>
						</thead>	
						<tbody>
						<%
							ArrayList<String> reg = new ArrayList<String>();	
							reg.add("AF2024040506");reg.add("AF2024041297");
							reg.add("AF2024041314");reg.add("AF2024040340");
							
							int ii=0;
							affiliationlist=null;
							affiliationlist= InspectorInspectionManager.getAffiliationDetails(Inst_Id,inspection_by, "2");
							
							for (InspectorInspectionModel affmodel : affiliationlist) {
						%>
			                <tr>
								<td style="text-align:center; width:5%;"><%=++ii %></td>
								<td style="text-align:center; width:10%;"><%=General.checknull(affmodel.getReq_name())%></td>
								<td style="text-align:left; width:15%;"><%=General.checknull(affmodel.getSub_req_name())%></td>
								<td style="text-align:center; width:10%;"><%=General.checknull(affmodel.getApp_date())%></td>
								<td style="text-align:center; width:10%;"><%=General.checknull(affmodel.getAmt())%></td>
								<%if(!General.checknull(affmodel.getAmt()).equals("0")){ %>			
								<td style="text-align:center; width:10%;">
									<%if(General.checknull(affmodel.getPay_status()).equals("Y")){ %>
										<span style="color: #dddd2c; font-size: medium; font-weight: bolder;">PENDING</span>
									<%}%>
									<%if(General.checknull(affmodel.getPay_status()).equals("R")){ %>
										<span style="color: #d51a1a; font-size: medium; font-weight: bolder;">REJECT</span>
									<%} %>
									<%if(General.checknull(affmodel.getPay_status()).equals("N")){ %>
										<span style="color: #2b7a11; font-size: medium; font-weight: bolder;">SUCCESS</span>
									<%} %>
								</td>
								<%}else{ %>
									<td style="text-align:center; width:10%;"></td>
								<%} %>
							 </tr>
							<%if(reg.contains(Inst_Id) && (General.checknull(affmodel.getSub_req_id()).equals("MR0012") || General.checknull(affmodel.getSub_req_id()).equals("MR0010"))){ 
								String is_submit=InspectorInspectionManager.getDetailForDiffrenceAmtPaid(user_id, affmodel.getReq_id(), affmodel.getSub_req_id(), "29500");								
							%>
							 	<tr>
								 	<td style="text-align:center; width:5%;"><%=++ii %></td>
									<td style="text-align:center; width:10%;"><%=General.checknull(affmodel.getReq_name())%></td>
									<td style="text-align:left; width:15%;"><%=General.checknull(affmodel.getSub_req_name())%></td>
									<td style="text-align:center; width:10%;"><%=General.checknull(affmodel.getApp_date())%></td>
									<td style="text-align:center; width:10%;">29500</td>
									<td style="text-align:center; width:10%;">
										<%if(General.checknull(is_submit).equals("N")){ %>	
											<span style="color: #dddd2c; font-size: medium; font-weight: bolder;">PENDING</span>
										<%}%>
										<%if(General.checknull(is_submit).equals("Y")){ %>
											<span style="color: #2b7a11; font-size: medium; font-weight: bolder;">SUCCESS</span>
										<%} %>
									</td>
							 	</tr>
							 <%} %>
							 <%} %>	   		
						</tbody>
					</table>
				  </div>
				</div>
				
		<!-- End here checkbox panel -->	
 		</div>
				
				
				
				<div class="form-group" >
					<div class="col-md-12">
						<div class="page-header-2">
			    			<div class="repTitle ">Request for Intake Details</div>
						</div>
					</div>
				</div>
		
		<div class="form-group m-t-20" >
				<div class="col-md-12">
					<div class="fixData">
						<div class="repTitle ">Existing institutions shall be
							eligible for getting 3 years' Extension of Approval (EOA)
							from the AY-2024-25 by remitting 3 years' TER Charges (Table
							2.1) by meeting ANYONE of the following criteria:</div>
					</div>
				</div>
		</div>		
		 <div class="panel panel-default" style="margin-bottom: 15px;">
		  <div class="panel-body">
			<div class="form-group">
				<div class="row">
					<div class="col-sm-12">
						<label class="col-sm-7 col-form-label frm-label  text-1" for="">I. Figured in 8th Edition of NIRF ranked Institutions (announcement made on 5th June 2023).</label>
						<div class="col-sm-1">
							<input type="checkbox" class="" name="nirf_rank" id="nirf_rank" maxlength="1" <%=is_nirf%> disabled>
						</div>
						<% if(attachList.containsKey("Doc_1")){%>
          					<div class="col-sm-4 txt-break" >
	          					<a target="_blank" class="pdf-link"   href="../downloadfile?filename=<%=attachList.get("Doc_1") %>&folderName=AKTU_AFFILIATION_PORTAL/INTAKE_DETAILS/<%=user_id%>/&fstatus=dwnFileFrmDir">
	          						<u><%=attachList.get("Doc_1").toString().split("_")[1] %></u>
	          					</a>
          					</div>
          				<%} else {%>
							<div class="col-sm-4" id="showHideDoc_1" style="display: none;">
								<input type="file"  id="Doc_1" name="Doc_1" onchange="fileValidation('Doc_1');">
							</div>
						<%}%>
					</div>
				</div>
			</div>
 			
 			<div class="form-group">
				<div class="row">
					<div class="col-sm-12">
						<label class="col-sm-7 col-form-label frm-label  text-1" for="">II. Figured in QS World Ranking Asia-2024 (announcement made on 8th Nov 2023).</label>
						<div class="col-sm-1">
							<input type="checkbox" class="" name="QS_World" id="QS_World" maxlength="1" <%=is_qs %> disabled>
						</div>
						<% if(attachList.containsKey("Doc_2")){%>
          					<div class="col-sm-4 txt-break">
	          					<a target="_blank" class="pdf-link"   href="../downloadfile?filename=<%=attachList.get("Doc_2") %>&folderName=AKTU_AFFILIATION_PORTAL/INTAKE_DETAILS/<%=user_id%>/&fstatus=dwnFileFrmDir">
	          						<u><%=attachList.get("Doc_2").toString().split("_")[1] %></u>
	          					</a>
          					</div>
          				<%} else {%>
							<div class="col-sm-4" id="showHideDoc_2" style="display: none;">
								<input type="file"  id="Doc_2" name="Doc_2" onchange="fileValidation('Doc_2');">
							</div>
						<%}%>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="row">
					<div class="col-sm-12">
						<label class="col-sm-7 col-form-label frm-label  text-1" for="">III. Institutions having minimum of 30% eligible courses 
							with NBA accreditation having validity till 30th April 2025. (The institutions should continue to get accreditation of their programs).</label>
						<div class="col-sm-1 ">
							<input type="checkbox" class="" name="NBA_accreditation" id="NBA_accreditation" maxlength="1" <%=is_NBA %> disabled>
						</div>
							<% if(attachList.containsKey("Doc_3")){%>
          					<div class="col-sm-4 txt-break">
	          					<a target="_blank" class="pdf-link"   href="../downloadfile?filename=<%=attachList.get("Doc_3") %>&folderName=AKTU_AFFILIATION_PORTAL/INTAKE_DETAILS/<%=user_id%>/&fstatus=dwnFileFrmDir">
	          						<u><%=attachList.get("Doc_3").toString().split("_")[1] %></u>
	          					</a>
          					</div>
	          				<%} else {%>
								<div class="col-sm-4" id="showHideDoc_3" style="display: none;">
									<input type="file"  id="Doc_3" name="Doc_3" onchange="fileValidation('Doc_3');">
								</div>
							<%}%>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="row">
					<div class="col-sm-12">
						<label class="col-sm-7 col-form-label frm-label  text-1" for="">IV. Institutions with valid NAAC score of 3.01 and above on scale of 4.0.</label>
						<div class="col-sm-1">
							<input type="checkbox" class="" name="NAAC" id="NAAC" maxlength="1" <%=is_NAAC %> disabled>
						</div>
						 <% if(attachList.containsKey("Doc_4")){%>
          					<div class="col-sm-4 txt-break">
	          					<a target="_blank" class="pdf-link"   href="../downloadfile?filename=<%=attachList.get("Doc_4") %>&folderName=AKTU_AFFILIATION_PORTAL/INTAKE_DETAILS/<%=user_id%>/&fstatus=dwnFileFrmDir">
	          						<u><%=attachList.get("Doc_4").toString().split("_")[1] %></u>
	          					</a>
          					</div>
	          				<%} else {%>
								<div class="col-sm-4" id="showHideDoc_4" style="display: none;">
									<input type="file"  id="Doc_4" name="Doc_4" onchange="fileValidation('Doc_4');">
								</div>
							<%}%>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="row">
					<div class="col-sm-12">
						<label class="col-sm-7 col-form-label frm-label  text-1" for="">V. Institutions having conferred 'Autonomous Status' by UGC/Autonomy by AICTE.</label>
						<div class="col-sm-1">
							<input type="checkbox" class="" name="AICTE" id="AICTE" maxlength="1" <%=is_ugc %> disabled>
						</div>
							 <% if(attachList.containsKey("Doc_5")){%>
          					<div class="col-sm-4 txt-break">
	          					<a target="_blank" class="pdf-link"   href="../downloadfile?filename=<%=attachList.get("Doc_5") %>&folderName=AKTU_AFFILIATION_PORTAL/INTAKE_DETAILS/<%=user_id%>/&fstatus=dwnFileFrmDir">
	          						<u><%=attachList.get("Doc_5").toString().split("_")[1] %></u>
	          					</a>
          					</div>
	          				<%} else {%>
								<div class="col-sm-4" id="showHideDoc_5" style="display: none;">
									<input type="file"  id="Doc_5" name="Doc_5" onchange="fileValidation('Doc_5');">
								</div>
							<%}%>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="row">
					<div class="col-sm-12">
						<label class="col-sm-7 col-form-label frm-label  text-1" for="">VI.Institutions having more than 80% admission consecutively for last 5 Academic Years.</label>
						<div class="col-sm-1">
							<input type="checkbox" class="" name="consecutively" id="consecutively" maxlength="1" <%=is_adm %> disabled>
						</div>
						 <% if(attachList.containsKey("Doc_6")){%>
          					<div class="col-sm-4 txt-break">
	          					<a target="_blank" class="pdf-link"   href="../downloadfile?filename=<%=attachList.get("Doc_6") %>&folderName=AKTU_AFFILIATION_PORTAL/INTAKE_DETAILS/<%=user_id%>/&fstatus=dwnFileFrmDir">
	          						<u><%=attachList.get("Doc_6").toString().split("_")[1] %></u>
	          					</a>
          					</div>
	          				<%} else {%>
								<div class="col-sm-4" id="showHideDoc_6" style="display: none;">
									<input type="file"  id="Doc_6" name="Doc_6" onchange="fileValidation('Doc_6');">
								</div>
							<%}%>
					</div>
				</div>
			</div>
 		 </div>
 		</div>
				
				<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
					<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
					<table id="searchTable" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="text-center">S.No.</th>
								<th class="text-center">Program Name</th>
								<!-- <th class="text-center">Program Type</th> -->
								<th class="text-center">Sub Request Name</th>
								<th class="text-center">Request in AICTE</th>
								<th class="text-center">Request in COPCI</th>
								<th class="text-center">Request in University</th>
							</tr>
						</thead>	
						<tbody>
						 <%int intsrno=0; for(InspectorInspectionModel affmodel:intakeDetaillist){
							%>
			                <tr>
								<td style="text-align:center; width:8%;"><%=++intsrno%></td>
								<td style="text-align:center; width:10%;"><%=General.checknull(affmodel.getProg_id())%></td>
								<%-- <td style="text-align:center; width:8%;"><%=General.checknull(affmodel.getProg_type())%></td> --%>
								<td style="text-align:center; width:8%;"><%=General.checknull(affmodel.getShift())%></td>
								<td style="text-align:center; width:8%;"><%=General.checknull(affmodel.getApp_in_AICTE())%></td>
								<td style="text-align:center; width:8%;"><%=General.checknull(affmodel.getApp_in_COPCI())%></td>
								<td style="text-align:center; width:8%;"><%=General.checknull(affmodel.getApp_in_univ())%></td>
							 </tr>
							 <%} %>
						</tbody>
					</table>
				  </div>
				</div>
			
            </div>
           </div>
           </div>
          
           
           
        </div>
    </div>    
        
        
        
        
        
   
     <div id="accordionTwo" class="accordion">
        <div class="card mb-0">
        <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading" style="background-color:  #4f624d;">
            <div class="card-header collapsed" data-toggle="collapse" href="#collapseTwo">
                <a class="card-title">
                   General Information
                </a>
            </div>
            </div>
            <div id="collapseTwo" class="panel-body collapse" data-parent="#accordionTwo" >
           <!--  <div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
						<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
						 <table id="searchTable" class="table table-striped table-bordered table-hover setTable" cellspacing="0" width="100%">
							<thead>
							<tr>
								<th class="text-center">S.No.</th>
								<th class="text-center">Program Name</th>
								<th class="text-center">Program Type</th>
								<th class="text-center">Shift</th>
								<th class="text-center">Applied in University</th>
							</tr><tr>
						</tr></thead>	
						 <tbody id="affProgDetails"></tbody> Calling in js function getProgList
							</table>
						  </div>
					</div>  -->
			<hr class="subHead-hr">
			
			<div class="form-group">
			<div class="col-md-12">
			<div class="row">
						<label class="col-sm-5 col-form-label text-right" for="">Type of Registration :</label>
							<div class="col-sm-6">
								<select class="form-control" id="reg_type" name="reg_type" disabled>
									<option value="">Select Type of Registration</option>
									<%=QueryUtil.getComboOption("cparam", "PDOC", "DESCP1", General.checknull(data.get("REG_TYP").toString()), "CODE='AKTU_PORT' and SERIAL='REG_TYP'", "ORDERBY") %>
								</select>
			           </div>
				      </div>
				</div>
			</div>
			
			 <div class="form-group">
			<div class="col-md-12">
			<div class="row">
				          <label class="col-sm-5 col-form-label text-right" for="">Institute Type :</label>
							<div class="col-sm-6">
								<select class="form-control" id="inst_type" name="inst_type" disabled>
									<option value="">Select Institute Type</option>
									<%=QueryUtil.getComboOption("cparam", "PDOC", "DESCP1", General.checknull(data.get("INST_TYPE").toString()), "CODE='AKTU_PORT' and SERIAL='INST_TYP'", "ORDERBY") %>
								</select>
				           </div>
				       </div>
				</div>
			</div> 
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
				          <label class="col-sm-5 col-form-label text-right" for="">Institute Type :</label>
							<div class="col-sm-6">
								<select class="form-control" id="inst_type" name="inst_type" disabled>
									<option value="">Select Institute Type</option>
									<%=QueryUtil.getComboOption("cparam", "PDOC", "DESCP1", General.checknull(data.get("INST_TYPE").toString()), "CODE='AKTU_PORT' and SERIAL='INST_TYP'", "ORDERBY") %>
								</select>
				           </div>
				       </div>
				</div>
			</div>
			 <div class="form-group">
			<div class="col-md-12">
					<div class="col-md-12">
					<div class="row">
						   <label class="col-sm-5 col-form-label text-right" for="">Is Minority :</label>
							<div class="col-sm-6">
								<input type="checkbox" class="" id="" name="" value="" <%if(General.checknull(data.get("IS_MINORITY").toString()).equals("Y")) {%> checked="checked" <%} %> disabled>
				           </div>
				       </div>
				</div>
				</div>
			</div>
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
						   <label class="col-sm-5 col-form-label text-right" for="">Proposed Institute Name :</label>
							<div class="col-sm-6">
								<input type="text" class="form-control"  placeholder="Enter Proposed Institute Name" id="inst_name" name="inst_name" value="<%=General.checknull(data.get("PROP_INST_NAME").toString())%>" disabled>
				           </div>
				       </div>
				</div>
			</div> 
			
			 <div class="form-group">
			<div class="col-md-12">
					<div class="row" >
						<label class="col-sm-5 col-form-label text-right" for="">Address :</label>
							<div class="col-sm-6">
							 <textarea class="form-control" style="resize:vertical;max-height:120px;" placeholder="Enter Address" id="addr" name="addr" disabled><%=General.checknull(data.get("ADDR").toString()) %></textarea>
				           </div>	
				       </div>
				</div>
			</div>
			<div class="form-group">
			  <div class="col-md-12">
					<div class="row" >
							  <label class="col-sm-5 col-form-label text-right" for="">Country Name :</label>
							<div class="col-sm-6">
							<select class="form-control" id="country" name="country" disabled>
								<option value="">Select Country Name</option>			
								<option value="I" selected>India</option>												
							</select>
				           </div>	
				       </div>
				</div>
			</div> 
			 <div class="form-group">
			<div class="col-md-12">
					<div class="row">
						<label class="col-sm-5 col-form-label text-right" for="">State :</label>
							<div class="col-sm-6">
							 <input type="text" class="form-control"  placeholder="State " id="" name="" value="<%=General.checknull(data.get("STATE").toString()) %>" disabled>
								<!-- <select class="form-control" id="state" name="state">
									<option value="">Select State Name</option>
								</select> -->
				           </div>
				       </div>
				</div>
			</div>
			
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
				           <label class="col-sm-5 col-form-label text-right" for="">District :</label>
							<div class="col-sm-6">
							<input type="text" class="form-control"  placeholder="District " id="" name="" value="<%=General.checknull(data.get("DISTRICT").toString()) %>" disabled>
							 <!-- <select class="form-control" id="district" name="district">
								<option value="">Select District Name</option>
							</select> -->
				           </div>
				       </div>
				</div> 
			</div> 
			
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
				           <label class="col-sm-5 col-form-label text-right" for="">Chairman Chief/Trustee MD Name :</label>
							<div class="col-sm-6">
							 <input type="text" class="form-control"  placeholder="Enter Chairman Chief/Trustee MD Name" id="" name="" value="<%=General.checknull(data.get("MD_NAME").toString())%>" disabled>
				           </div>
				       </div>
				</div>
			</div>
		
			<div class="form-group">
			<div class="col-md-12">
						<div class="row">
						    <label class="col-sm-5 col-form-label text-right" for="">Mobile No. :</label>
							<div class="col-sm-6">
							 <input type="text" class="form-control"  placeholder="Enter Mobile No." id="" name="" value="<%=General.checknull(data.get("CONTACT").toString())%>" disabled>
				           </div>
				       </div>
				</div>
			</div>
				
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
						   <label class="col-sm-5 col-form-label text-right" for="">Email :</label>
							<div class="col-sm-6">
								<input type="text" class="form-control"  placeholder="Enter Email Id" id="" name="" value="<%=General.checknull(data.get("EMAIL").toString())%>" disabled>
				           </div>
				       </div>
				</div>
			</div>
			
		  <div class="form-group">
			<div class="col-md-12">
					<div class="row">
						<label class="col-sm-5 col-form-label text-right" for="">Director Aadhaar No. :</label>
							<div class="col-sm-6">
								<input type="text" class="form-control"  placeholder="Enter Director Aadhaar No." id="" name="" value="<%=General.checknull(data.get("AADHAR").toString())%>" disabled>
				           </div>
				       </div>
				</div>
			</div>
			
		  <div class="form-group">
			<div class="col-md-12">
					<div class="row">
						<label class="col-sm-5 col-form-label text-right" for="">Director Name :</label>
							<div class="col-sm-6">
								<input type="text" class="form-control"   id="" name="" value="<%=General.checknull(data.get("DIRECTOR_NAME").toString())%>" disabled>
				           </div>
				       </div>
				</div>
			</div>
			
		  <div class="form-group">
			<div class="col-md-12">
					<div class="row">
						<label class="col-sm-5 col-form-label text-right" for="">Director Mobile No. :</label>
							<div class="col-sm-6">
								<input type="text" class="form-control"  id="" name="" value="<%=General.checknull(data.get("DIRECTOR_MOBILE").toString())%>" disabled>
				           </div>
				       </div>
				</div>
			</div>
			
			 <div class="form-group">
			<div class="col-md-12">
					<div class="row">
						<label class="col-sm-5 col-form-label text-right" for="">Registrar Name :</label>
							<div class="col-sm-6">
								<input type="text" class="form-control"  placeholder="Enter Registrar Name" id="reg_name" name="reg_name" value="<%=General.checknull(savedData.get("register_name").toString()) %>" disabled>
				           </div>
				       </div>
				</div>
			</div>
			
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
						<label class="col-sm-5 col-form-label text-right" for="">Registrar Mobile No. :</label>
							<div class="col-sm-6">
								<input type="text" class="form-control"  placeholder="Enter Mobile No." id="reg_mobile" name="reg_mobile" value="<%=General.checknull(savedData.get("register_mobile").toString()) %>" disabled>
				           </div>
				       </div>
				</div>
			</div>
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
						<label class="col-sm-5 col-form-label text-right" for="">Registrar Email ID :</label>
							<div class="col-sm-6">
								<input type="text" class="form-control"  placeholder="Enter Email ID" id="reg_email" name="reg_email" value="<%=General.checknull(savedData.get("register_email").toString()) %>" disabled>
				           </div>
				       </div>
				</div>
			</div>
			<div class="form-group">
			<div class="col-md-12">
					<div class="row">
						<label class="col-sm-5 col-form-label text-right" for="">Registrar Aadhaar No. :</label>
							<div class="col-sm-6">
								<input type="text" class="form-control"  placeholder="Enter Aadhaar No." id="reg_aadhar" name="reg_aadhar" value="<%=General.checknull(savedData.get("register_aadhar").toString()) %>" disabled>
				           </div>
				       </div>
				</div>
			</div>
			
            </div>
           </div>
           </div>
          
           
           
        </div>
    </div>
      <div id="accordionThree" class="accordion">
        <div class="card mb-0">
        <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading" style="background-color:  #4f624d;">
            <div class="card-header collapsed" data-toggle="collapse" href="#collapseThree">
                <a class="card-title">
                    Computer Peripheral & Facilities Details
                </a>
            </div>
            </div>
            <div id="collapseThree" class="panel-body collapse" data-parent="#accordionThree" >
    <div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
						<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
						 <table id="searchTable" class="table table-striped table-bordered table-hover setTable" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="text-center">S.No.</th>
									<th class="text-center">Discipline Name</th>
									<th class="text-center">Computer Peripheral Type</th>
									<th class="text-center">Available (As per Institute)</th>
									<th class="text-center">Available (As per Inspection Committee)</th>
									<th class="text-center">Is requirement fulfilled</th>
								</tr></thead>	
								<tbody>
								<%int comsrno=0; for(InspectorInspectionModel fmodel:facilitieslist){
								if(fmodel.getFac_type().equals("CP")){
									String Ins_status=General.checknull(fmodel.getInspection_status());
								%>
								<tr>
									<td style="text-align:center; width:5%;"><%=++comsrno%></td>
									<td style="text-align:left; width:20%;">
										<label for="" class="col-form-label "><%=General.checknull(fmodel.getProg_type())%></label>
									</td>
									<td style="text-align:left; width:20%;">
										<label for="" class="col-form-label "><%=General.checknull(fmodel.getFac_name())%></label>
									</td>
									<td style="text-align:center; width:10%;">
										<input disabled type="text" class="form-control" id="" name="" value="<%=General.checknull(fmodel.getAvbl_room())%>">
									</td>
									 <td style="text-align:center; width:10%;">
										<input type="text" class="form-control" id="avbl_room_inspection_<%=comsrno%>" name="avbl_room_inspection" value="<%=General.checknull(fmodel.getAvbl_room_inspection())%>" onkeypress="return allowOnlyNumeric(event);">
									 </td>
									 <td style="text-align:center; width:10%;">
										<select  id="inspection_status_<%=comsrno%>" class="form-control">
					                    <option value="Yes" <%=Ins_status.equals("Yes")?"selected":"" %>>Yes</option>
					                    <option value="No" <%=Ins_status.equals("No")?"selected":"" %>>No</option>
										</select>
										<input type="hidden" id="fac_id<%=comsrno%>" name="fac_id" value="<%=General.checknull(fmodel.getFAC_ID())%>" />  
									 </td>
								 </tr>
								<%}
									}%>
									<input type="hidden" id="comsrno" name="comsrno" value="<%=comsrno%>" />
								</tbody>
							</table>
						  </div>
					</div> 
					
			 	<div class="form-group">
					<div class="col-md-12">
						<div class="page-header-2">
			    			<div class="repTitle ">For Affiliation Library Facility Details</div>
						</div>
					</div>
				  </div>
					<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
						<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
						 <table id="searchTable" class="table table-striped table-bordered table-hover setTable" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="text-center">S.No.</th>
									<th class="text-center">Discipline Name</th>
									<th class="text-center">Library Facility Type</th>
									<th class="text-center">Available (As per Institute)</th>
									<th class="text-center">Available (As per Inspection Committee)</th>
									<th class="text-center">Is requirement fulfilled</th>
								</tr>
							</thead>	
								<tbody>
								<%int fsrno=0; for(InspectorInspectionModel fmodel:facilitieslist){
								if(fmodel.getFac_type().equals("LF")){
									String Ins_status=General.checknull(fmodel.getInspection_status());
								%>
								<tr>
									<td style="text-align:center; width:5%;"><%=++fsrno%></td>
									<td style="text-align:left; width:20%;">
										<label for="" class="col-form-label "><%=General.checknull(fmodel.getProg_type())%></label>
									</td>
									<td style="text-align:left; width:20%;">
										<label for="" class="col-form-label "><%=General.checknull(fmodel.getFac_name())%></label>
									</td>
									<td style="text-align:center; width:10%;">
										<input disabled type="text" class="form-control" id="" name="" value="<%=General.checknull(fmodel.getAvbl_room())%>">
									</td>
									 <td style="text-align:center; width:10%;">
										<input type="text" class="form-control" id="avbl_room_insp_fac_<%=fsrno%>" name="avbl_room_insp_fac" value="<%=General.checknull(fmodel.getAvbl_room_inspection())%>" onkeypress="return allowOnlyNumeric(event);">
									 </td>
									 <td style="text-align:center; width:10%;">
										<select  id="inspection_status_fac_<%=fsrno%>" class="form-control">
					                    <option value="Yes" <%=Ins_status.equals("Yes")?"selected":"" %>>Yes</option>
					                    <option value="No" <%=Ins_status.equals("No")?"selected":"" %>>No</option>
										</select>
										<input type="hidden" id="fac_id_fac_<%=fsrno%>" name="fac_id" value="<%=General.checknull(fmodel.getFAC_ID())%>" />  
									 </td>
									 
								 </tr>
								<%}
									}%>
									<input type="hidden" id="fsrno" name="fsrno" value="<%=fsrno%>" />
								</tbody>
							</table>
						  </div>
					</div> 
    </div>
    </div>
    </div>
    </div>
    </div>
     <div id="accordionFour" class="accordion">
        <div class="card mb-0">
        <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading" style="background-color:  #4f624d;">
            <div class="card-header collapsed" data-toggle="collapse" href="#collapseFour">
                <a class="card-title">Administrative & Amenities Details
                </a>
            </div>
            </div>
            <div id="collapseFour" class="panel-body collapse" data-parent="#accordionFour" >
              <div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
						<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
						 <table id="searchTable" class="table table-striped table-bordered table-hover setTable" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="text-center">S.No.</th>
									<!-- <th class="text-center">Programme Name</th> -->
									<th class="text-center">Administrative Type</th>
									<th class="text-center">Available Carpet (in Sq. Meter)</th>
									<th class="text-center">Available Carpet (in Sq. Meter As per Inspection)</th>
									<th class="text-center">Available Rooms</th>
									<th class="text-center">Available Rooms (As per Inspection)</th>
									<th class="text-center">Is requirement fulfilled</th>
								</tr><tr>
							</tr></thead>	
								<tbody> 
				<!-- Detail type AA will be used for Administrative &  AD will used for Amenities Details -->
								<%int adm_srno=0; for(InspectorInspectionModel fmodel:adminAmenilist){
									String Is_config_avbl_crpt=fmodel.getIs_config_avbl_crpt();
								if(General.checknull(fmodel.getDetail_typ()).equals("AD")){
									String Ins_status=General.checknull(fmodel.getInspection_status());
								%>
								<tr <%if(Is_config_avbl_crpt.equals("1")){%>style="background-color: #ff000040"<%}%>>
									<td style="text-align:center; width:5%;"><%=++adm_srno%></td>
									<%-- <td style="text-align:left; width:20%;">
										<label for="" class="col-form-label "><%=General.checknull(fmodel.getProg_type())%></label>
									</td> --%>
									<td style="text-align:left; width:20%;">
										<label for="" class="col-form-label "><%=General.checknull(fmodel.getAdministrative_typ())%></label>
									</td>
									<td style="text-align:center; width:10%;">
										<input disabled type="text" class="form-control" id="" name="" value="<%=General.checknull(fmodel.getAvbl_carpet())%>">
									</td>
									 <td style="text-align:center; width:10%;">
										<input type="text" class="form-control" id="avbl_carpet_insp_adm_<%=adm_srno%>" name="avbl_carpet_insp_adm" value="<%=General.checknull(fmodel.getAvbl_carpet_inspection())%>" onkeypress="return allowOnlyNumeric(event);">
									 </td>
									 <td style="text-align:center; width:10%;">
										<input disabled type="text" class="form-control" id="" name="" value="<%=General.checknull(fmodel.getAvbl_room())%>">
									</td>
									 <td style="text-align:center; width:10%;">
										<input type="text" class="form-control" id="avbl_room_insp_adm_<%=adm_srno%>" name="avbl_room_insp_adm" value="<%=General.checknull(fmodel.getAvbl_room_inspection())%>" onkeypress="return allowOnlyNumeric(event);">
									 </td>
									 <td style="text-align:center; width:10%;">
										<select  id="inspection_status_adm_<%=adm_srno%>" class="form-control">
					                    <option value="Yes" <%=Ins_status.equals("Yes")?"selected":"" %>>Yes</option>
					                    <option value="No" <%=Ins_status.equals("No")?"selected":Is_config_avbl_crpt.equals("1")?"selected":"" %>>No</option>
										</select>
										<input type="hidden" id="adm_id_<%=adm_srno%>" name="adm_id" value="<%=General.checknull(fmodel.getBd_id())%>" />  
									 </td>
									 
								 </tr>
								<%}
									}%>
									<input type="hidden" id="adm_srno" name="adm_srno" value="<%=adm_srno%>" />
								</tbody>
							</table>
						  </div>
					</div> 
					
					<div class="form-group">
					<div class="col-md-12">
						<div class="page-header-2">
			    			<div class="repTitle ">For Affiliation Amenities Details</div>
						</div>
					</div>
				  </div>
					<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
						<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
						 <table id="searchTable" class="table table-striped table-bordered table-hover setTable" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="text-center">S.No.</th>
									<!-- <th class="text-center">Programme Name</th> -->
									<th class="text-center">Amenities Type</th>
									<th class="text-center">Available Carpet (in Sq. Meter)</th>
									<th class="text-center">Available Carpet (in Sq. Meter As per Inspection)</th>
									<th class="text-center">Available Rooms</th>
									<th class="text-center">Available Rooms (As per Inspection)</th>
									<th class="text-center">Is requirement fulfilled</th>
								</tr><tr>
							</tr></thead>	
								<tbody> 
				<!-- Detail type AA will be used for Administrative &  AD will used for Amenities Details -->
								<%int amniti_srno=0; for(InspectorInspectionModel fmodel:adminAmenilist){
									String Is_config_avbl_crpt=fmodel.getIs_config_avbl_crpt();
								if(General.checknull(fmodel.getDetail_typ()).equals("AM")){
									String Ins_status=General.checknull(fmodel.getInspection_status());
								%>
								<tr <%if(Is_config_avbl_crpt.equals("1")){%>style="background-color: #ff000040"<%}%>>
									<td style="text-align:center; width:5%;"><%=++amniti_srno%></td>
									<%-- <td style="text-align:left; width:20%;">
										<label for="" class="col-form-label "><%=General.checknull(fmodel.getProg_type())%></label>
									</td> --%>
									<td style="text-align:left; width:20%;">
										<label for="" class="col-form-label "><%=General.checknull(fmodel.getAdministrative_typ())%></label>
									</td>
									<td style="text-align:center; width:10%;">
										<input disabled type="text" class="form-control" id="" name="" value="<%=General.checknull(fmodel.getAvbl_carpet())%>">
									</td>
									 <td style="text-align:center; width:10%;">
										<input type="text" class="form-control" id="avbl_carpet_insp_amniti_<%=amniti_srno%>" name="avbl_carpet_insp_amniti" value="<%=General.checknull(fmodel.getAvbl_carpet_inspection())%>" onkeypress="return allowOnlyNumeric(event);">
									 </td>
									 <td style="text-align:center; width:10%;">
										<input disabled type="text" class="form-control" id="" name="" value="<%=General.checknull(fmodel.getAvbl_room())%>">
									</td>
									 <td style="text-align:center; width:10%;">
										<input type="text" class="form-control" id="avbl_room_insp_amniti_<%=amniti_srno%>" name="avbl_room_insp_amniti" value="<%=General.checknull(fmodel.getAvbl_room_inspection())%>" onkeypress="return allowOnlyNumeric(event);">
									 </td>
									 <td style="text-align:center; width:10%;">
										<select  id="inspection_status_amniti_<%=amniti_srno%>" class="form-control">
					                    <option value="Yes" <%=Ins_status.equals("Yes")?"selected":"" %>>Yes</option>
					                    <option value="No" <%=Ins_status.equals("No")?"selected":Is_config_avbl_crpt.equals("1")?"selected":""  %>>No</option>
										</select>
										<input type="hidden" id="amniti_id_<%=amniti_srno%>" name="amniti_id" value="<%=General.checknull(fmodel.getBd_id())%>" />  
									 </td>
									 
								 </tr>
								<%}
									}%>
									<input type="hidden" id="amniti_srno" name="amniti_srno" value="<%=amniti_srno%>" />
								</tbody>
							</table>
						  </div>
					</div> 
				</div>
			</div>
		</div>
	</div>
</div>
		<div id="accordionFive" class="accordion">
			<div class="card mb-0">
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading" style="background-color: #4f624d;">
							<div class="card-header collapsed" data-toggle="collapse"href="#collapseFive">
								<a class="card-title">Infrastructure Information </a>
							</div>
						</div>
						<div id="collapseFive" class="panel-body collapse"data-parent="#accordionFive">
							<div class="col-md-12 table-responsive"style="padding: 0px; display: inline-block;">
								<div id="" class="dataEntryDiv"style="padding: 0px; display: inline-block;">
									<table id="searchTable"class="table table-striped table-bordered table-hover setTable"cellspacing="0" width="100%">
										<thead>
											<tr>
											<th class="text-center">S.No.</th>
											<th class="text-center">Discipline Name</th>
											<th class="text-center">Computer Peripheral Type</th>
											<th class="text-center">Available Room(As per Institute)</th>
											<th class="text-center">Available Room(As per Inspection Committee)</th>
											<th class="text-center">Is requirement fulfilled</th>
											</tr>
										</thead>
									<tbody>
								<%int infrasrno=0; for(InspectorInspectionModel inframodel:infralist){
								/* if(fmodel.getFac_type().equals("CP")){ */
									String Ins_status=General.checknull(inframodel.getInspection_status());
								%>
								<tr>
									<td style="text-align:center; width:5%;"><%=++infrasrno%></td>
									<td style="text-align:left; width:20%;">
										<label for="" class="col-form-label "><%=General.checknull(inframodel.getFac_type())%></label>
									</td>
									<td style="text-align:left; width:20%;">
										<label for="" class="col-form-label "><%=General.checknull(inframodel.getFac_name())%></label>
									</td>
									<td style="text-align:center; width:10%;">
										<input disabled type="text" class="form-control" id="" name="" value="<%=General.checknull(inframodel.getAvbl_room())%>">
									</td>
									 <td style="text-align:center; width:10%;">
										<input type="text" class="form-control" id="avbl_room_inspection_infra_<%=infrasrno%>" name="avbl_room_inspection_infra" value="<%=General.checknull(inframodel.getAvbl_room_inspection())%>" onkeypress="return allowOnlyNumeric(event);">
									 </td>
									 <td style="text-align:center; width:10%;">
										<select  id="inspection_status_infra_<%=infrasrno%>" class="form-control">
					                    <option value="Yes" <%=Ins_status.equals("Yes")?"selected":"" %>>Yes</option>
					                    <option value="No" <%=Ins_status.equals("No")?"selected":"" %>>No</option>
										</select>
										<input type="hidden" id="infra_id_<%=infrasrno%>" name="infra_id" value="<%=General.checknull(inframodel.getFAC_ID())%>" />  
									 </td>
								 </tr>
								<%/* } */
									}%>
									<input type="hidden" id="infrasrno" name="infrasrno" value="<%=infrasrno%>" />
									</tbody>
									</table>
								</div>
							</div>
							
							<!-- Start land area details -->
							<div class="form-group" >
							<div class="col-md-12">
							<div class="row">
								<label class="col-sm-5 col-form-label text-right" for="">Type of Land :</label>
									<div class="col-sm-6">
										<select class="form-control" id="erptype" name="erptype" disabled>
											<%if(General.checknull(infralist.get(0).getTYPE_OF_LAND()).equals("UB")){ %>
											<option selected value="UB">Urban</option>
											<%}if(General.checknull(infralist.get(0).getTYPE_OF_LAND()).equals("RL")){ %>
											<option selected value="RL">Rural</option>
											<%} %>
										</select>
						           </div>
						       </div>
						</div>
					</div>
					
					<div class="form-group" >
					<div class="col-md-12">
							<div class="row">
						          <label class="col-sm-5 col-form-label text-right" for="">Available Land in Acres (in Sq. Mtr.) :</label>
									<div class="col-sm-6">
										<input type="text" disabled class="form-control" placeholder="Enter Area" id="AvblLand" name="AvblLand" maxlength="7" onkeypress="return allowOnlyNumeric(event)" value="<%=General.checknull(infralist.get(0).getAVBL_LAND())%>">
						           </div>
						       </div>
						</div>
					</div>
					<div class="form-group" >
					<div class="col-md-12">
							<div class="row">
						           <label class="col-sm-5 col-form-label text-right " for="">Available Constructed Building Area (in Sq. Mtr.) :</label>
									<div class="col-sm-6">
										<input type="text" disabled class="form-control" placeholder="Enter Area" id="AvblConstBuild" name="AvblConstBuild" maxlength="7" onkeypress="return allowOnlyNumeric(event)" value="<%=General.checknull(infralist.get(0).getAVBL_CONST_AREA())%>">	
						           </div>
						       </div>
						</div>
					</div> <!-- End of land records -->
							 
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Society Information Method calling -->
		<%
	String soc_id="",trust_name="",trust_details="",state_name="",dist_name="",tahshil_name=""
			,pin_code="",phone_no="",email_id="",fax="";
	ArrayList<InspectionSocietyInfoModel> list =null;
	int i=0;
	JSONObject socdata = new JSONObject();
	//System.out.println("user---"+General.checknull(user_id));
	user_id=Inst_Id;
	socdata=InspectorInspectionManager.getSavedData(user_id);
	if(socdata.size()>0){
	soc_id 			= General.checknull(socdata.get("SOC_ID").toString());
	trust_name 		= General.checknull(socdata.get("SOC_TRUST_NAME").toString());
	trust_details 	= General.checknull(socdata.get("SOC_TRUST_NAME").toString());
	state_name		= General.checknull(socdata.get("STATE_NAME").toString());
	dist_name		= General.checknull(socdata.get("DISTRICT_NAME").toString());
	tahshil_name 	= General.checknull(socdata.get("TAHSIL_NAME").toString());
	pin_code		= General.checknull(socdata.get("PIN_CODE").toString());
	phone_no		= General.checknull(socdata.get("PHONE_NO").toString());
	email_id		= General.checknull(socdata.get("EMAIL_ID").toString());
	fax				= General.checknull(socdata.get("FAX").toString());
	}
%>
		<div id="accordionSix" class="accordion">
			<div class="card mb-0">
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading" style="background-color: #4f624d;">
							<div class="card-header collapsed" data-toggle="collapse" href="#collapseSix">
								<a class="card-title">Society Information </a>
							</div>
						</div>
						<div id="collapseSix" class="panel-body collapse"data-parent="#accordionSix">
						
					<div class="form-group" >
					<div class="col-md-12">
							<div class="row">
								<label class="col-sm-5 col-form-label text-right" for="">Society/ Trust/ Section 25 Detail's Name :</label>
									<div class="col-sm-6">
										<input type="text" class="form-control"  placeholder="Enter Details" id="TRUST_DETAILS" 
											name="TRUST_DETAILS" value="<%=trust_name%>" disabled>
						           </div>
						       </div>
						</div>
					</div>
					
					<div class="form-group" >
					<div class="col-md-12">
							<div class="row">
						          <label class="col-sm-5 col-form-label text-right" for="">Society/ Trust/ Section 25 Detail's Address :</label>
									<div class="col-sm-6">
										<input type="text" class="form-control"  placeholder="Enter Details" id="TRUST_ADDRESS" 
										name="TRUST_ADDRESS"value="<%=trust_details%>" disabled>
						           </div>
						       </div>
						</div>
					</div>
					<div class="form-group" >
					<div class="col-md-12">
							<div class="row">
						           <label class="col-sm-5 col-form-label text-right " for="">State Name:</label>
									<div class="col-sm-6">
										<input type="text" class="form-control"  placeholder="Enter State Name" id="STATE_NAME" 
											name="STATE_NAME" value="<%=state_name%>" disabled>	
						           </div>
						       </div>
						</div>
					</div>
					<div class="form-group" >
					<div class="col-md-12">
							<div class="row">
						           <label class="col-sm-5 col-form-label text-right " for="">District Name :</label>
									<div class="col-sm-6">
										<input type="text" class="form-control"  placeholder="Enter District" id="DISTRICT_NAME" 
											name="DISTRICT_NAME" value="<%=dist_name%>" disabled>	
						           </div>
						       </div>
						</div>
					</div>
					<div class="form-group" >
					<div class="col-md-12">
							<div class="row">
						           <label class="col-sm-5 col-form-label text-right " for="">Tahsil Name :</label>
									<div class="col-sm-6">
										<input type="text" class="form-control"  placeholder="Enter Tahsil Name" id="TAHSIL_NAME" 
											name="TAHSIL_NAME" value="<%=tahshil_name%>" disabled>	
						           </div>
						       </div>
						</div>
					</div>
					<div class="form-group" >
					<div class="col-md-12">
							<div class="row">
						           <label class="col-sm-5 col-form-label text-right " for="">Pin Code :</label>
									<div class="col-sm-6">
										<input type="text" class="form-control"  placeholder="Enter Pin Code" id="PIN_CODE" 
											name="PIN_CODE" value="<%=pin_code%>" disabled>	
						           </div>
						       </div>
						</div>
					</div>
					<div class="form-group" >
					<div class="col-md-12">
							<div class="row">
						           <label class="col-sm-5 col-form-label text-right " for="">Phone No. :</label>
									<div class="col-sm-6">
										<input type="text" class="form-control"  placeholder="Enter Phone No." id="PHONE_NO" 
											name="PHONE_NO" value="<%=phone_no%>" disabled>	
						           </div>
						       </div>
						</div>
					</div>
					<div class="form-group" >
					<div class="col-md-12">
							<div class="row">
						           <label class="col-sm-5 col-form-label text-right " for="">Email :</label>
									<div class="col-sm-6">
										<input type="text" class="form-control"  placeholder="Enter Email ID" id="EMAIL" 
											name="EMAIL" value="<%=email_id%>" disabled>	
						           </div>
						       </div>
						</div>
					</div>
					<div class="form-group" >
					<div class="col-md-12">
							<div class="row">
						           <label class="col-sm-5 col-form-label text-right " for="">Fax :</label>
									<div class="col-sm-6">
										<input type="text" class="form-control"  placeholder="Enter Fax Details" id="FAX" 
											name="FAX" value="<%=fax%>" disabled>	
						           </div>
						       </div>
						</div>
					</div>
				
					 
					<div class="form-group" >
						<div class="col-md-12">
							<div class="page-header-2">
				    			<div class="repTitle ">Member Information</div>
							</div>
						</div>
					</div>
					
					
						
						<%
			if(!soc_id.equals("")){
			 i=0;
			try{
				list = InspectorInspectionManager.viewRecordDetails(soc_id);
				if(list.size()>0) {
				Iterator itr = list.iterator();
					while(itr.hasNext()) {
						i++;
						InspectionSocietyInfoModel fmodel = (InspectionSocietyInfoModel)itr.next();
						%>	
					<div class="counter m-t-20" id="TAB_<%=i%>">
					 <div class="panel panel-default">
					
					 <input type="hidden" value="<%=General.checknull(fmodel.getSoc_did())%>" id="det_id_<%=i%>" >
						<div class="panel-body">
							  <div class="form-group" >
								<div class="col-md-12">
									<div class="row">
								           <label class="col-sm-2 col-form-label text-left " for="">Member Name</label>
											<div class="col-sm-4">
												<input type="text" class="form-control"  placeholder="Enter Member Name" id="MEMBER_NAME_<%=i%>" 
												name="MEMBER_NAME_<%=i%>" value="<%=General.checknull(fmodel.getMem_name())%>" disabled>	
								           </div>
								           <label class="col-sm-2 col-form-label text-left " for="">Member Aadhaar</label>
											<div class="col-sm-4">
												<input type="text" class="form-control"  placeholder="Enter Member Aadhaar" id="MEMBER_AADHAR_<%=i%>" 
													name="MEMBER_AADHAR_<%=i%>" value="<%=General.checknull(fmodel.getMem_aadhar())%>" disabled>	
								           </div>
								       </div>
									</div>
								</div>
								<div class="form-group" >
								<div class="col-md-12">
									<div class="row">
								           <label class="col-sm-2 col-form-label text-left " for="">Member DOB</label>
											<div class="col-sm-4">
												<div class="input-group date" id="msg-MEMBER_DOB_<%=i%>" style="text-align: center;">
													<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input readonly="readonly" data-field-id=" " type="text"
													class="form-control datecalendar from_date" id="MEMBER_DOB_<%=i%>"
														name="MEMBER_DOB_<%=i%>" placeholder="DD/MM/YYYY"
															value="<%=General.checknull(fmodel.getMember_dob())%>" disabled>
									</div>	
								           </div>
								           <label class="col-sm-2 col-form-label text-left " for="">Member Mobile</label>
											<div class="col-sm-4">
												<input type="text" class="form-control"  placeholder="Enter Mobile No." id="MEMBER_MOBILE_<%=i%>" 
													name="MEMBER_MOBILE_<%=i%>" value="<%=General.checknull(fmodel.getMem_mob_no())%>" disabled>	
								           </div>
								       </div>
									</div>
								</div>
								<div class="form-group" >
								<div class="col-md-12">
									<div class="row">
								           <label class="col-sm-2 col-form-label text-left " for="">Member Email ID</label>
											<div class="col-sm-4">
												<input type="text" class="form-control"  placeholder="Enter Email ID" id="MEMBER_EMAIL_<%=i%>" 
													name="MEMBER_EMAIL_<%=i%>" value="<%=General.checknull(fmodel.getMem_email())%>" disabled>	
								           </div>
								           <label class="col-sm-2 col-form-label text-left " for="">Member Designation</label>
											<div class="col-sm-4">
												<input type="text" class="form-control"  placeholder="Enter Member Designation" id="MEMBER_DESG_<%=i%>" 
													name="MEMBER_DESG_<%=i%>" value="<%=General.checknull(fmodel.getMem_desg())%>" disabled>	
								           </div>
								       </div>
									</div>
								</div>
								<div class="form-group" >
								<div class="col-md-12">
									<div class="row">
								           <label class="col-sm-2 col-form-label text-left " for="">Upload Photo</label>
								           <%if(soc_id.equals("")||General.checknull(fmodel.getMem_photo()).equals("")){ %>
												<div class="col-sm-4">
													<%-- <input type="file" class="" id="UPL_PHOTO_<%=i%>" name="UPL_PHOTO_<%=i%>" vaule=""> --%>
													<label for="" class="col-form-label text-right ">No files uploaded</label>	
									           </div>
											
											<%}else{ %>
												<span class="fileUpload" id="UPL_PHOTO_<%=i%>">
													<div class="col-sm-4">
														<a
															href="../downloadfile?filename=<%=General.checknull(fmodel.getMem_photo())%>&folderName=/AKTU_AFFILIATION_PORTAL/SOC_DETAIL/<%=user_id%>&fstatus=dwnFileFrmDir">
															<strong> <u><%=General.checknull(fmodel.getMem_photo()) %></u></strong>
														</a> 
													</div>
												</span>
											<%} %>
								           
								           
								           <label class="col-sm-2 col-form-label text-left " for="">Upload Signature</label>
								            <%if(soc_id.equals("")||General.checknull(fmodel.getMem_sign()).equals("")){ %>
												<div class="col-sm-4">
													<%-- <input type="file" class="" id="UPL_SIGN_<%=i%>" name="UPL_SIGN_<%=i%>" vaule=""> --%>	
									           <label for="" class="col-form-label text-right ">No files uploaded</label>
									           </div>
											
											<%}else{ %>
												<span class="fileUpload" id="UPL_SIGN_<%=i%>">
													<div class="col-sm-4">
														<a
															href="../downloadfile?filename=<%=General.checknull(fmodel.getMem_sign())%>&folderName=/AKTU_AFFILIATION_PORTAL/SOC_DETAIL/<%=user_id%>&fstatus=dwnFileFrmDir">
															<strong> <u><%=General.checknull(fmodel.getMem_sign()) %></u></strong>
														</a> 
													</div>
												</span>
											<%} %>
								       </div>
									</div>
								</div>
								<div class="form-group" >
								<div class="col-md-12">
										<div class="row">
									           <label class="col-sm-2 col-form-label text-left " for="">Upload Memorandum in Corporation Letter</label>
												
									           <%if(soc_id.equals("")||General.checknull(fmodel.getMem_memo()).equals("")){ %>
												<div class="col-sm-4">
													<%-- <input type="file" class="" id="UPL_MEMO_<%=i%>" name="UPL_MEMO_<%=i%>" vaule=""> --%>
													<label for="" class="col-form-label text-right ">No files uploaded</label>	
									           </div>
											
											<%}else{ %>
												<span class="fileUpload" id="UPL_MEMO_<%=i%>">
													<div class="col-sm-4">
														<a
															href="../downloadfile?filename=<%=General.checknull(fmodel.getMem_memo())%>&folderName=/AKTU_AFFILIATION_PORTAL/SOC_DETAIL/<%=user_id%>&fstatus=dwnFileFrmDir">
															<strong> <u><%=General.checknull(fmodel.getMem_memo()) %></u></strong>
														</a> 
													</div>
												</span>
											<%} %>
									       </div>
									</div>
								</div>
						</div>
					</div>
					</div>
					
					
					<%} 
					} %>
	<%	    		
		}catch(Exception e){System.out.println("Error in inspector_inspection_detail_view.jsp:"+e.getMessage());	
	} finally {
			list.clear();
		}
			}
%>	
					</div>			 
						</div>
					</div>
						 
		          </div>
		      </div>
		    
   <div id="accordionSeven" class="accordion">
			<div class="card mb-0">
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading" style="background-color: #4f624d;">
							<div class="card-header collapsed" data-toggle="collapse"href="#collapseSeven">
								<a class="card-title">Faculty Information </a>
							</div>
						</div>
						<div id="collapseSeven" class="panel-body collapse"data-parent="#accordionSeven">
						<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
					<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
					<table id="searchTable" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="text-center">S.No.</th>
								<th class="text-center">Faculty Id</th>
								<th class="text-center">Faculty Name</th>
								<th class="text-center">Gender</th>
								<th class="text-center">DOJ</th>
								<th class="text-center">PAN card No.</th>
								<th class="text-center">Father Name</th>
								<th class="text-center">Qualification</th>
								<th class="text-center">Department</th>
								<th class="text-center">Designation</th>
								<th class="text-center">Is Director</th>
								<th class="text-center">Course Name</th>
								<th class="text-center">Branch Name</th>
								<th class="text-center">Shift</th>
								<th class="text-center">Upload Photo</th>
								<th class="text-center">Status(As per Inspection Committee)</th>
							</tr><tr>
						</tr></thead>	
							<tbody>
								<%int facsrno=0; for(InspectorInspectionModel facmodel:facultylist){
									String Ins_status=General.checknull(facmodel.getInspection_status());
								%>
								<tr>
									<td style="text-align:center; width:5%;"><%=++facsrno%></td>
									<td style="text-align:left; width:10%;">
										<label for="" class="col-form-label "><%=General.checknull(facmodel.getAadharno())%></label>
									</td>
									<td style="text-align:left; width:15%;">
										<label for="" class="col-form-label "><%=General.checknull(facmodel.getFac_name())%></label>
									</td>
									<td style="text-align:left; width:10%;">
										<label for="" class="col-form-label "><%=General.checknull(facmodel.getGender())%></label>
									</td>
									<td style="text-align:left; width:10%;">
										<label for="" class="col-form-label "><%=General.checknull(facmodel.getDoj())%></label>
									</td>
									<td style="text-align:left; width:10%;">
										<label for="" class="col-form-label "><%=General.checknull(facmodel.getPanno())%></label>
									</td>
									<td style="text-align:left; width:10%;">
										<label for="" class="col-form-label "><%=General.checknull(facmodel.getFather_name())%></label>
									</td>
									<td style="text-align:left; width:10%;">
										<label for="" class="col-form-label "><%=General.checknull(facmodel.getQualification())%></label>
									</td>
									
									<td style="text-align:left; width:10%;">
										<label for="" class="col-form-label "><%=General.checknull(facmodel.getDepartment())%></label>
									</td>
									<td style="text-align:left; width:10%;">
										<label for="" class="col-form-label "><%=General.checknull(facmodel.getDesignation())%></label>
									</td>
									<td style="text-align:left; width:10%;">
										<label for="" class="col-form-label "><%=General.checknull(facmodel.getIs_director().equals("Y")?"Yes":"No")%></label>
									</td>
									  <td style="text-align:left; width:10%;">
										<label for="" class="col-form-label "><%=General.checknull(facmodel.getCourse_name())%></label>
									</td>
									
									<td style="text-align:left; width:10%;">
										<label for="" class="col-form-label "><%=General.checknull(facmodel.getBranch_name())%></label>
									</td>
									
									<td style="text-align:left; width:10%;">
										<label for="" class="col-form-label "><%=General.checknull(facmodel.getShift())%></label>
									</td>
									
									<td style="text-align:left; width:10%">
		        					<a style="word-break: break-all;" href="../downloadfile?filename=<%=facmodel.getFile_name()%>&folderName=/Faculty_Photo/<%=user_id%>&fstatus=dwnFileFrmDir">
		        					<strong><u><%=facmodel.getFile_name() %></u></strong>
									</a></td>
									<td style="text-align:center; width:20%;">
										<select  id="fac_inspection_status_<%=facsrno%>" class="form-control">
					                    <option value="">Select Status</option>
					                    <option value="Yes" <%=Ins_status.equals("Yes")?"selected":"" %>>Yes</option>
					                    <option value="No" <%=Ins_status.equals("No")?"selected":"" %>>No</option>
										</select>
										<input type="hidden" id="fac_info_id_<%=facsrno%>" name="fac_info_id" value="<%=General.checknull(facmodel.getFAC_ID())%>" />  
									 </td>
								 </tr>
								<%}%>
									<input type="hidden" id="facsrno" name="facsrno" value="<%=facsrno%>" />
									</tbody>
					</table>
				  </div>
				</div> 
		          </div>
		      </div>
		   </div>
		</div>
   </div>
   <div id="accordionEight" class="accordion">
			<div class="card mb-0">
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading" style="background-color: #4f624d;">
							<div class="card-header collapsed" data-toggle="collapse"href="#collapseEight">
								<a class="card-title">Questionnaires </a>
							</div>
						</div>
						<div id="collapseEight" class="panel-body collapse"data-parent="#accordionEight">
						 <div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
						<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
						 <table id="searchTable" class="table table-striped table-bordered table-hover setTable" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="text-center">S.No.</th>
									<th class="text-center">Question</th>
									<th class="text-center">Yes/ No</th>
									<th class="text-center">Field 1</th>
									<th class="text-center">Field 2</th>
									<th class="text-center">Field 3</th>
									<th class="text-center">View Document</th>
									<th class="text-center">Status(As per Inspection Committee)</th>
								</tr><tr>
							</tr></thead>
							
							<tbody>
								<%
								int querno=0; for(InspectorInspectionModel facmodel:questionnairelist){
									//A will manage for portal questionaire
									if(General.checknull(facmodel.getQues_type()).equals("A")){
								String Ins_status=General.checknull(facmodel.getInspection_status());
								String optVal[]=facmodel.getField_1().split(",");
								String subtyp[]=facmodel.getField_2().split(",");
								facmodel.getField_2().split(",");
								String optVal1="", optVal2="", optVal3="", field1="", field2="", field3="";
						        if(optVal.length>0){
						        	optVal1=optVal[0];
						        }
						        if(optVal.length>1){
						        	optVal2=optVal[1];
						        }
						        if(optVal.length>2){
						        	optVal3=optVal[2];
						        }
						        if(subtyp.length>0){
						        	field1=subtyp[0];
						        }
						        if(subtyp.length>1){
						        	field2=subtyp[1];
						        }
						        if(subtyp.length>2){
						        	field3=subtyp[2];
						        }
						       String file_name= facmodel.getFile_name().equals("")?"":facmodel.getFile_name().split("_")[1];
								%>
								<tr>
									<td style="text-align:center; width:3%;"><%=++querno%></td>
									<td style="text-align:left; width:15%;">
										<label for="" class="col-form-label "><%=General.checknull(facmodel.getQues_desc())%></label>
									</td>
									<td style="text-align:left; width:10%;">
										<label for="" class="col-form-label "><%=General.checknull(facmodel.getIsActive()).equals("Y")?"Yes":"No"%></label>
									</td>
									<td style="text-align:left; width:10%;">
										<label for="" class="col-form-label "><span><%=optVal1%></span> <br> <span><%=field1%></span></label>
									</td>
									<td style="text-align:left; width:10%;">
										<label for="" class="col-form-label "><span><%=optVal2%></span> <br> <span><%=field2%></label>
									</td>
									<td style="text-align:left; width:10%;">
										<label for="" class="col-form-label "><%=optVal3%></span> <br> <span><%=field3%></label>
									</td>
									
									<td style="text-align:left; width:10%">
		        					<a style="word-break: break-all;" href="../downloadfile?filename=<%=facmodel.getFile_name()%>&folderName=/AKTU_AFFILIATION_PORTAL/QUESTIONNAIRE_DETAIL/<%=user_id%>&fstatus=dwnFileFrmDir">
		        					<strong><u><%=file_name%></u></strong>
									</a></td>
									
									 <td style="text-align:center; width:10%;">
										<select  id="que_inspection_status_<%=querno%>" class="form-control">
					                    <option value="">Select Status</option>
					                    <option value="Yes" <%=Ins_status.equals("Yes")?"selected":"" %>>Yes</option>
					                    <option value="No" <%=Ins_status.equals("No")?"selected":"" %>>No</option>
										</select>
										<input type="hidden" id="quer_id_<%=querno%>" name="quer_id" value="<%=General.checknull(facmodel.getQues_id())%>" />
										<input type="hidden" id="quer_pkey_id_<%=querno%>" name="quer_pkey_id" value="<%=General.checknull(facmodel.getId())%>" />  
									 </td>
								 </tr>
								<%
									}
								}%>
									<input type="hidden" id="querno" name="querno" value="<%=querno%>" />
									</tbody>	
							</table>
						  </div>
					</div>
					
					<!-- New table added for inspection queationare 2/5/24--> 
					<div class="form-group">
					<div class="col-md-12">
						<div class="page-header-2">
			    			<div class="repTitle ">Inspection Questionaire</div>
						</div>
					</div>
				  	</div>
					<div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
						<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
						 <table id="searchTable" class="table table-striped table-bordered table-hover setTable" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="text-center">S.No.</th>
									<th class="text-center">Question</th>
									<th class="text-center">Status</th>
								</tr><tr>
							</tr></thead>
							
							<tbody>
								<%
								int insquerno=0; for(InspectorInspectionModel facmodel:questionnairelist){
									//I will manage for backoffice Inspection questionaire
									if(General.checknull(facmodel.getQues_type()).equals("I")){
								String Ins_status=General.checknull(facmodel.getInspection_status());
								%>
								<tr>
									<td style="text-align:center; width:3%;"><%=++insquerno%></td>
									<td style="text-align:left; width:20%;">
										<label for="" class="col-form-label "><%=General.checknull(facmodel.getQues_desc())%></label>
									</td>
									
									 <td style="text-align:center; width:5%;">
										<select  id="que_insp_status_<%=insquerno%>" class="form-control">
					                    <option value="">Select Status</option>
					                    <option value="Yes" <%=Ins_status.equals("Yes")?"selected":"" %>>Yes</option>
					                    <option value="No" <%=Ins_status.equals("No")?"selected":"" %>>No</option>
										</select>
										<input type="hidden" id="ins_quer_id_<%=insquerno%>" name="ins_quer_id" value="<%=General.checknull(facmodel.getQues_id())%>" />  
									 	<input type="hidden" id="ins_pkey_id_<%=insquerno%>" name="ins_pkey_id" value="<%=General.checknull(facmodel.getId())%>" />
									 </td>
								 </tr>
								<%}
								}%>
									<input type="hidden" id="insquerno" name="insquerno" value="<%=insquerno%>" />
									</tbody>	
							</table>
						  </div>
					</div> 
					
		          </div>
		      </div>
		   </div>
		</div>
   </div>
    <%
    	JSONArray uploaddata = new JSONArray();
		uploaddata=InspectorInspectionManager.getUplData(user_id);
	%>
   <div id="accordionNine" class="accordion">
			<div class="card mb-0">
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading" style="background-color: #4f624d;">
							<div class="card-header collapsed" data-toggle="collapse"href="#collapseNine">
								<a class="card-title">Upload Document </a>
							</div>
						</div>
						<div id="collapseNine" class="panel-body collapse"data-parent="#accordionNine">
					<%for(int k=0; k<uploaddata.size(); k++){ 
						JSONObject obj = new JSONObject();
						obj=(JSONObject) uploaddata.get(k);
						if(!General.checknull(obj.get("FileName").toString()).equals("")){
						String FileName=	obj.get("FileName").toString();
						int underscoreIndex = FileName.indexOf('_');
						String valueAfterUnderscore="";
						if (underscoreIndex != -1) { // Check if underscore exists
				            // Extract the substring after the underscore
				             valueAfterUnderscore = FileName.substring(underscoreIndex + 1);
				        } 
					%>
					<div class="form-group">
						<div class="col-md-12">
							<div class="row">
								<label for="" class="col-sm-6 col-form-label text-right "><b><%=obj.get("DocName").toString()%></b></label>
								<div class="col-sm-6">
									<a target="_blank" href="../downloadfile?filename=<%=obj.get("FileName").toString() %>&folderName=AKTU_AFFILIATION_PORTAL/UPLOAD_DOCUMENT/<%=user_id%>/&fstatus=dwnFileFrmDir">
										<u><%=valueAfterUnderscore%></u>
									</a>
								</div>
							</div>
						</div>
					</div>
					<%}}%> 
         			</div>
		   </div>
		</div>
   </div>
   <%if(is_convinor.equals("Y")){ %>
		<div class="form-group ">
						<div class="row">
							<div class="col-sm-12">
								<label for="" class="col-sm-2 col-form-label required-field"><b>Remarks</b></label>
								<div class="col-sm-4">
									<textarea class="form-control" id="insp_remarks" maxlength="300" style="resize:vertical;max-height:120px;height:40px;" placeholder="&nbsp;Enter Remarks"><%=Insp_remarks%></textarea>
								</div>
								<label for="" class="col-sm-2 col-form-label required-field"><b>Recommendation</b></label>
								<div class="col-sm-4">
									 <textarea class="form-control" id="insp_recm" maxlength="300" style="resize:vertical;max-height:120px;height:40px;" placeholder="&nbsp;Enter Recommendation"><%=Insp_recm%></textarea> 
								</div>
							</div>
						</div>
			</div>
			<div class="form-group" >
					<div class="row">
					<div class="col-sm-12">
					  <label for="" class="col-sm-3 col-form-label text-left l-title"><b>Upload Printed Report with Member Signature</b></label>
				       <div class="col-sm-3">
						 <input type="file" class="form-control" id="attachment1">
						 <a href="../downloadfile?filename=<%=memberfile%>&folderName=INSPECTOR_INSPECTION/<%=user_id%>/<%=inspection_id%>/&fstatus=dwnFileFrmDir" target="_blank"><%=memberfile%></a>
					   <input type="hidden" id="is_doc_up" name="is_doc_up" value="<%=memberfile%>">
					   </div>
			       </div>
			       </div>    
			</div>
			
			<div class="col-md-12 text-center" style="margin-top:15px; padding-bottom:10px;">
					<%if(!isfinalsubmited.equals("Y") && is_pannel_member.equals("Y")){ %>
                	<button type="button" class="btn btn-view" id="btnSave" name="btnSave" value="SAVE" onclick="save('SAVE','N','<%=Inst_Id%>')">Save</button>
                	<%} %>
                	<button type="button" class="btn btn-view" onclick="">Reset</button>
		    		<input type="hidden" id="session_id" name="session_id" value="<%=session_code%>">
		    		<input type="hidden" id="inspection_id" name="inspection_id" value="<%=inspection_id%>">
		    		<input type="hidden" id="Inst_Id" name="Inst_Id" value="<%=Inst_Id%>">
    		</div>
    		<div class="col-sm-12">
				<div class="row text-center">
					<div class="errmessage1" id="errMsg1"></div>
				</div>
			</div>
              <div class="col-sm-12">
		        <div class="row text-center">
		            <div class="errmessage2" id="errMsg2"></div>
		        </div>
           </div>
		<%}%>
</div>
  </div> 
    </form>
    
    	<form class="form-horizontal" name="payModal" id="payModal" method="post" autocomplete="off">
		<div class="modal fade recomond-btn" id="reportDiologPay" tabindex="-1" role="dialog" aria-labelledby="open-Modal" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header1 text-center">
						<span class="close" data-dismiss="modal" aria-label="Close close-cross"  aria-hidden="true" style="padding: 10px;">&times;</span>
						<h4 class="modal-title"></h4>
					</div>			
					<div class="modal-body" style="width: 96%;padding: 0px;"> <!--Start Modal Body-->
						<div id="showframePay"></div>
					</div>
				</div>
			</div>
		</div> 
	</form>
    
    </div>
    
 <script>

	function resizeIframe(iframe) {
		  iframe.height = iframe.contentWindow.document.body.scrollHeight + "px";
		  window.requestAnimationFrame(() => resizeIframe(iframe));
		}
	
   var saveFunctionCalled = false;
	setTimeout(function () {
		if (!saveFunctionCalled) {
		<%
		if(IsSubmitClick.equals("Y") && !isfinalsubmited.equals("Y")){ %>
		save('SAVE','Y','<%=Inst_Id%>');
		<%}%>
		saveFunctionCalled = true;
		}
    }, 1000);
	
	$(document).ready(function() {
		$("#loader").hide();
	});
	
   </script> 
   
</body>
</html>