 <!--
   @author Ashwani Kumar Date ( 11-Jan-2024) 
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@page import="org.json.simple.JSONArray"%>
 <%@page import="com.sits.general.ApplicationConstants"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sits.general.ApplicationConstants"%>
<%@page import="com.sits.general.ReadProps"%>
<%@page import="com.sits.general.QueryUtil"%>
<%@page import="com.sits.general.General"%>
<%@page import="com.sits.affiliation.transaction.inspection_approval_panel.InspectionApprovalPanelModel"%>
<%@page import="com.sits.affiliation.transaction.inspection_approval_panel.InspectionApprovalPanelManager"%>
 <%@include file="../myCks.jsp"%>
 <%@page import="com.sits.affiliation.approval.review_application.*"%> 
<head>
<meta  name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Expires" content="-1" />

<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css" type="text/css">
<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="../resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
<script type="text/javascript" src="../resources/js/aes/AesUtil.js"></script>
<script type="text/javascript" src="../resources/js/aes/crypto.js"></script>
<script type="text/javascript" src="../resources/js/common/validations.js"></script>
<script type="text/javascript" src="../resources/js/common/gen.js"></script>
<script type="text/javascript" src="../resources/js/hrmsCommonDropDown.js"></script>
<script type="text/javascript" src="../resources/js/commonDropDown.js"></script>
<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/responsive.css" rel="stylesheet" 	type="text/css" />
<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

</head>
<%
	String OPT_TYP = "E" , OPT_VALUE = "",panel_id ="",panel_code="",panel_name="",isActive="" ,sel="";
	int index=0;
	 ArrayList<InspectionApprovalPanelModel> list =null;
	JSONArray json=	 new JSONArray();
		panel_id = General.checknull(request.getParameter("panel_id"));
		String mode=General.checknull(request.getParameter("mode"));
		String selectedApplication=General.checknull(request.getParameter("selectedApplication"));
		System.out.println("selectedApplication:: "+selectedApplication);
		json=	InspectionApprovalPanelManager.viewRecordDetails(panel_id); 
	 	InspectionApprovalPanelModel quotmdl=InspectionApprovalPanelManager.viewRecord(panel_id);
	 	panel_code= General.checknull(quotmdl.getPanel_code()).trim();
	 	panel_name   = General.checknull(quotmdl.getPanel_name()).trim();
	 	isActive  = General.checknull(quotmdl.getIs_active()).trim();
	    panel_id=General.checknull(quotmdl.getPanel_id());
%>

<style>
#searchTable input[type="text"] {
  height: 30px; 
    /* width: 70%; */
     
}
 	  .dataEntryDiv{ 
 	    overflow-y: auto; 
 	    min-height: 50px; 
 	    max-height: 200px; 
 	  }
	  .dataEntryDiv thead tr th {
	    position: sticky;
	    top: -1px;
	    outline-offset: -1px;
	 }
	/* Just common table stuff. Really. */
		table  { border-collapse: collapse; width: 100%; }
		th, td { padding: 4px 8px !important; }
		th     { background:#eee; }
 
	  .table-bordered > thead > tr > th {
	    border: 1px solid green !important;
	    border-left: 1px solid #bb9c2b !important;
	  }
 </style>
 <%-- <body onload= "<% if(OPT_TYP.equals("N")){ %> getDeprtment('','XDEPARTMT_1');getDesignation('','XPOST_1'); getEmployee('','XNAME_1');<%}%>"> --%>
<body>
<%if(!mode.equals("paymentdetails")) {%>
<div class="container-fluid">
    <div id="" class="page-header"><h4>Create Inspection and Approval Panel
    </h4>
 </div>
    <form class="form-horizontal" name="" id="" action="" method="post" autocomplete="off" target="">
    <div class="panel panel-default">
     <div class="panel-heading"><h3 class="panel-title text-right">New Record</h3></div>
			<div class="panel-body">
			 
			 <div class="form-group">
				<div class="col-md-12">
					<div class="row">
						<label for="" class="col-sm-2 col-form-label required-field" >Panel Code</label>
						<div class="col-sm-4">
						 <input type="text" class="form-control" id="XPANELC" value="<%=panel_code %>" placeholder="Enter Panel Code">
						</div>
						<label for="" class="col-sm-2 col-form-label required-field ">Panel Name</label>
						<div class="col-sm-4">
                        <input type="text" class="form-control" id="XPANELN" name="XPANELN" value="<%=panel_name %>" placeholder="Enter Panel Name">

						</div>
					</div>
				</div>
			</div>
             <div class="form-group">
				<div class="col-md-12">
					<div class="row">
						<label for="" class="col-sm-2 col-form-label">Is Active</label>				
			<div class="col-sm-4">			
			<label class="checkbox_main">
  				<input type="checkbox" id="XISACTIVE"    name="XISACTIVE" <%if (isActive.equals("Y")) {%> checked <%}%>>  <span class="checkmark"></span>
			</label>			
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
								<th class="text-center">Member Type</th>
								<th class="text-center">Member Name</th>
								<th class="text-center">Department</th>
								<th class="text-center">Designation</th>
								<th class="text-center">Email Id</th>
								<th class="text-center">Contact No.</th>
								<th class="text-center">Is_Convenor</th>
								<th class="text-center">Is Active</th>
							<tr>
						</thead>	
						 <tbody id="END1" class="dataEntryDiv Quotation" >
						</tbody>
					</table>
				  </div>
				</div> 
			</div>
		</div>
		<input type="hidden" name=count id="count" value="<%=index%>">
		<input type="hidden" name=fstatus  id="fstatus" value="<%=OPT_TYP%>">
		<input type="hidden" name=panel_id id="panel_id" value="<%=panel_id%>">
	    <input type='hidden' id="jsonddata" name="jsonddata"  value='<%=json%>'/>  
	    <input type="hidden" name=hrmsApi id="hrmsApi" value="<%=General.checknull(ReadProps.getkeyValue("hrms-api.url", "sitsResource")) %>">
	    <input type= "hidden" id="AESKey" value="<%=session.getAttribute("AESUniqueKey")%>" readOnly/>
   </form>
</div>
<%}else{%>
	<!-- payment details div -->
			<div>
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
							
							int i=0;
							ArrayList<ReviewApplicationModel> arrayList=null;
		 					arrayList=ReviewApplicationManager.getSavedData(selectedApplication,selectedApplication, "2");
							for(ReviewApplicationModel itm: arrayList){
						%>
			                <tr>
								<td style="text-align:center; width:5%;"><%=++i %></td>
								<td style="text-align:center; width:10%;"><%=General.checknull(itm.getReq_name())%></td>
								<td style="text-align:left; width:15%;"><%=General.checknull(itm.getSub_req_name())%></td>
								<td style="text-align:center; width:10%;"><%=General.checknull(itm.getApp_date())%></td>
								<td style="text-align:center; width:10%;"><%=General.checknull(itm.getAmt())%></td>
								<%if(!General.checknull(itm.getAmt()).equals("0")){ %>			
								<td style="text-align:center; width:10%;">
									<%if(General.checknull(itm.getPay_status()).equals("Y")){ %>
										<span style="color: #dddd2c; font-size: medium; font-weight: bolder;">PENDING</span>
									<%}%>
									<%if(General.checknull(itm.getPay_status()).equals("R")){ %>
										<span style="color: #d51a1a; font-size: medium; font-weight: bolder;">REJECT</span>
									<%} %>
									<%if(General.checknull(itm.getPay_status()).equals("N")){ %>
										<span style="color: #2b7a11; font-size: medium; font-weight: bolder;">SUCCESS</span>
									<%} %>
								</td>
								<%}else{ %>
									<td style="text-align:center; width:10%;"></td>
								<%} %>
							 </tr>
							<%if(reg.contains(selectedApplication) && (General.checknull(itm.getSub_req_id()).equals("MR0012") || General.checknull(itm.getSub_req_id()).equals("MR0010"))){ 
								String is_submit=ReviewApplicationManager.getDetailForDiffrenceAmtPaid(selectedApplication, itm.getReq_id(), itm.getSub_req_id(), "29500");								
							%>
							 	<tr>
								 	<td style="text-align:center; width:5%;"><%=++i %></td>
									<td style="text-align:center; width:10%;"><%=General.checknull(itm.getReq_name())%></td>
									<td style="text-align:left; width:15%;"><%=General.checknull(itm.getSub_req_name())%></td>
									<td style="text-align:center; width:10%;"><%=General.checknull(itm.getApp_date())%></td>
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
				
 		</div>
				
	</div>
<%} %>	   

<body>
 <script >
 var fstatus=$("#fstatus").val();
 if(fstatus=='E'){ 
 	  var jsondata=$("#jsonddata").val();  
 	  var obj = jQuery.parseJSON(jsondata); 
 	  $.each(obj, function (index, value) {
 			 des="";
 			  index=index+1;
 			  if(index==1){
 				  des="disabled";
 			  }
		  var emp_type		=value["emp_type"].toString();
 		  var Panel_det_id  =value["Panel_det_id"].toString();
 		  var member_type   =value["member_type"].toString();
 		  var department    =value["department"].toString();
 		  var designation   =value["designation"].toString();
 		  var email_id      =value["email_id"].toString();
 		  var contant_no    =value["contant_no"].toString();
 		  var is_convenor   =value["is_convenor"].toString();
 		  var issActive     =value["issActive"].toString();
 		  if(is_convenor=='Y'){
 			  check="checked";
 		  }else{
 			  check="disabled";
 		  }
 		  var sel="";
 		  var sel1="";
 		  var newRow = $("<tr>");	 
 		  var cols = '<tr >'
 			    +' <td style="text-align:center; width:3%;" id="srn_'+index+'">'+index+'</td>'
 			   	+'<td style="text-align:center; width:10%;">'
 			  	+'<select class="form-control" id="XMTYPE_'+index+'" name="XMTYPE_'+index+'" onchange="getEmpbymember('+"'"+''+emp_type+''+"'"+','+index+','+"'"+''+member_type+''+"'"+');" disabled>'
 			 	+'<option value="">Select Member Type</option>'
 				+'<option value="I" '+(emp_type=="I"?"selected":"")+'>Internal</option>'
 				+'<option value="E" '+(emp_type=="E"?"selected":"")+'>External</option>'
 				+'</select></td>'
 			    +' <td style="text-align:center; width:10%;">'
 				+' <select class="form-control" id="XNAME_'+index+'" name="XNAME_'+index+'" onchange="getItemNameType(this.value, '+index+')">'
 				+' <option value="">Select Member Name</option>'
 				+' </select></td>'
 				+'<option value=""> Select Member Type</option>'
 				+' <td style="text-align:center; width:10%;">'
 				+' <select class="form-control" id="XDEPARTMT_'+index+'" name="XDEPARTMT_'+index+'" onchange="getItemCodeType(this.value, '+index+')" >'
 				+' <option value="">Select Department </option>'
 				cols +=' </select></td>'
 				+' <td style="text-align:center; width:10%;"> '
 				+' <select class="form-control " id="XPOST_'+index+'" name="XPOST_'+index+'">'
 				+' <option value="">Select Post Type </option>'
 				cols +=' </select></td>'
 				cols +=' <td style="text-align:center; width:10%;">'
 				cols +=' <input type="text" class="form-control" id="XEMAIL_'+index+'" name="XEMAIL_'+index+'"   value="'+email_id+'" placeholder="Enter the mail_id  ">'
 				+' <td style="text-align:right; width:8%;">'
 				cols +=' <input type="text" class="form-control" id="XCONTACT_'+index+'" name="XCONTACT_'+index+'""  value="'+contant_no+'" maxlength="10" placeholder="Enter Phone No  ">'
 				+' <td style="text-align:center; width:10%;">'
 				cols +='<input type="checkbox" class="checkboxcon"   id="XCONV_'+index+'" name="XCONV_'+index+'" '+check+' onclick="checkfn('+index+');"></td>'
 				+'<td style="text-align:right; width:10%;">'
 				+' <select class="form-control " id="XACT_'+index+'"    name="XACT_'+index+'" value="'+check+'">'
 				+' <option value="">Select</option>'
 				if(issActive=='Y'){
 					sel="selected";
 				}if(issActive=='N'){
 					sel1="selected";
 				}
 				cols +='<option value="Y" '+sel+'>Yes</option>'
 				cols +='<option value="N" '+sel1+'>No </option>'
 				cols +='</select>'
 				+'</tr>';		
 				$('.Quotation').append(cols);
 				$("#count").val(index);
 				//getEmployee(member_type,'XNAME_'+index);
 				getEmpbymember(emp_type,index,member_type);
 	       		getDeprtment(department,'XDEPARTMT_'+index);
 	       		getDesignation(designation,'XPOST_'+index);
 		}); 
 	  
 	 function getEmpbymember(emp_type,index,emp_id){
 		 if(emp_type=='I'){
 		 getEmployee(emp_id,'XNAME_'+index);
 		 }else{
 		 getExternalEmployee(emp_id,'XNAME_'+index);	 
 		 }
 	 }
 }
 </script>


</html>