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
<script type="text/javascript" src="../resources/js/affiliation/create-inspection-approval-panel.js"></script>
<script type="text/javascript" src="../resources/js/hrmsCommonDropDown.js"></script>
<script type="text/javascript" src="../resources/js/commonDropDown.js"></script>
<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/responsive.css" rel="stylesheet" 	type="text/css" />
<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

</head>
<%
	String OPT_TYP = "" , OPT_VALUE = "",panel_id ="",panel_code="",panel_name="",isActive="" ,sel="";
	int index=0;
	 ArrayList<InspectionApprovalPanelModel> list =null;
	JSONArray json=	 new JSONArray();
	OPT_TYP = General.checknull(request.getParameter("opt_typ"));
	if(OPT_TYP.equals("")) {
		OPT_TYP = "N";
		OPT_VALUE = ApplicationConstants.NEW;
		index=1;
	}else{
		OPT_TYP = "E";
		OPT_VALUE = ApplicationConstants.EDIT; 
		panel_id = General.checknull(request.getParameter("panel_id"));
		json=	InspectionApprovalPanelManager.viewRecordDetails(panel_id); 
	 	InspectionApprovalPanelModel quotmdl=InspectionApprovalPanelManager.viewRecord(panel_id);
	 	panel_code= General.checknull(quotmdl.getPanel_code()).trim();
	 	panel_name   = General.checknull(quotmdl.getPanel_name()).trim();
	 	isActive  = General.checknull(quotmdl.getIs_active()).trim();
	 	//System.out.println("requestFrom:: "+isActive);
	    panel_id=General.checknull(quotmdl.getPanel_id());
	} 
	 
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
 <body onload= "<% if(OPT_TYP.equals("N")){ %>  <%}%>">
<div class="container-fluid">
    <div id="" class="page-header"><h4><%=ReadProps.getkeyValue("create_inspection_approval_panel.header","sitsResource") %>
     <span style="float:right">
	  <a href="" data-toggle="modal" data-target=".recomond-btn" style="text-decoration:none;"> <span>Advance Search</span>
	 	<i class="fa fa-search"></i>
	  </a>
	 </span>
    
    
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
						 <input type="text" class="form-control" id="XPANELC" name="XPANELC" value="<%=panel_code %>" maxlength="19"  onblur="isAlphaNumeric(this,'XPANELC')"  placeholder="Enter Panel Code">
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
								<th class="text-center">Is Convenor</th>
								<th class="text-center">Is Active</th>
								<th class="text-center">Delete</th>
							<tr>
						</thead>	
						 <tbody id="END1" class="dataEntryDiv Quotation" >
						 	   <% if(OPT_TYP.equals("N")){ %>
			                <tr>
								<td style="text-align:center; width:3%;" id="srn_<%=index%>"><%=index%></td> 
				                <td style="text-align:center; width:10%;">
				                  <select class="form-control" id="XMTYPE_<%=index%>" name="XMTYPE_<%=index%>"	onchange="getEmpbymember(this.value,'1');">
										<option value="">Select Member Type</option>
										<option value="I">Internal</option>
										<option value="E">External</option>
								 </select>
				                 </td>
				                <td style="text-align:center; width:10%;">
				                  <select class="form-control" id="XNAME_<%=index%>" name="XNAME_<%=index%>" onchange="getExternalEmpDetails(this.value,'1');">
										<option value="">Select Member Name</option>
								 </select>
				                 </td>
				              <td style="text-align:center; width:10%;">
				                     <select class="form-control" id="XDEPARTMT_<%=index%>" name=" XDEPARTMT_<%=index%>" disabled>
										<option value="">Select Department Name</option>
									</select>
						     </td>		
						    <td style="text-align:center; width:10%;">
				                     <select class="form-control" id="XPOST_<%=index%>" name=" XPOST_<%=index%>" disabled>
										<option value="">Select Designation</option>
									 </select>
						    </td>		 
				         	<td style="text-align:center; width:8%;">
								<input type="text" class="form-control" id="XEMAIL_<%=index%>" name="XEMAIL_<%=index%>"  maxlength="29" onblur="validEmail(this);" placeholder="Enter the Email Id  " disabled>
						    </td>                                                                                                                                                                                                                                                                                                               
							<td style="text-align:center; width:8%;">
								 <input type="text" class="form-control" id="XCONTACT_<%=index%>" name="XCONTACT_<%=index%>" maxlength="10" onkeypress="return isNumberKeys(event);" placeholder="Enter Phone No  ">
							</td>
								<td style="text-align:center; width:8%;">
								<input type="checkbox" class="checkboxcon" id="XCONV_<%=index%>" name="XCONV_<%=index%>"onclick="checkfn(<%=index%>);" ></td>
							     <td style="text-align:center; width:8%;">
							    <select class="form-control " id="XACT_<%=index%>" name="XACT_<%=index%>">
      						          <option value="">Select</option>
      						          <option value="Y">Yes</option>
      						          <option value="N">No</option>
								 </select></td>
								 <td class="colr-red-p text-center" style="width:6%;color:red;"
								 ><span id="Panel_det_id_<%=index%>" onclick="deleteDetailsdata(<%=index%>,<%=index%>,this);"> <i class="fa fa-trash p-l-3"></i>Delete</span></td> 
						        </tr>
							  <%}%>
						</tbody>
					</table>
					
				  </div>
				 
				</div> 
			<div class="col-md-12 text-right">
				<button type="button" class="btn btn-view" id="addQuotation" onclick="">Add More</button>
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
				<div class="col-md-12 text-center">
					<% if(OPT_TYP.equals("N")){ %>
					<button type="button" class="btn btn-view" id="XBTNSAVE" onclick="saveRecord();">Save</button>
					<%}else{ %>
					<button type="button" id="XBTNUPDATE" class="btn btn-view" onclick="saveRecord();">Update</button>
					<button type="button" id="XBTNBCK" class="btn btn-view" >Back</button>
					<% } %>
					<button type="button" class="btn btn-view" id="XBTNRESET" onclick="">Reset</button> 
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
     <form class="form-horizontal" name="frmAffliD" id="frmAffliD" action="" method="post" autocomplete="off" target="">
    <div class="modal fade recomond-btn" id="myModal" tabindex="-1" role="dialog" aria-labelledby="openModal" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header"> <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			</div>
			  <div class="modal-body">
			   <div class="panel panel-default">
                <div class="panel-heading"><h3 class="panel-title text-right">Searching Criteria</h3></div>
     			<div class="panel-body">
		<!-- -------------------------------Write content inside this modal------------------------------------------- -->
			<div class="form-group">
				<div class="col-md-12">
					<div class="row">
						<label for="" class="col-sm-2 col-form-label ">Panel Code</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="X_PANELC" name="X_PANELC" placeholder="Enter Code " value="">
					                                                         	</div>
						<label for="" class="col-sm-2 col-form-label ">Panel Name</label>
						<div class="col-sm-4">
							 <input type="text" class="form-control" id="X_PANELN" name="X_PANELN" placeholder="Enter Panel Name" value=""> 
							<%-- <select class="form-control" id="X_PANELN" name="X_PANELN">
								<option value="">Select Requested From Warehouse </option>
								<%=QueryUtil.getComboOption("STORE_MAST", "STORE_ID", "concat(STORE_NAME,' (',if(STORE_ALIAS=1,'SALES','SERVICE'),')')","", "1=1 ", "STORE_ID") %>
							</select> --%>
						</div>
					</div>
				</div>
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
			
			 <div class="col-md-12 text-center">
					<button type="button" class="btn btn-view" id="X_BTNSEARCH" data-dismiss="modal" onclick=" ">Search</button>
					<button type="button" class="btn btn-view" id="X_BTNRESET" onclick="">Reset</button> 
				</div>
			<!-- -------------------------------End Here (Write content inside this modal)------------------------------------------- -->
			</div> <!-- End of panal body -->
			</div> <!-- End of panal default -->
		   </div> <!-- End of modal body -->
				 
			</div> <!-- End of modal content -->
		</div> <!-- End of modal-dialog -->
	</div> <!-- End of modal class/id at which modal will be open -->
	</form>
   	<iframe class="embed-responsive-item" src="create_inspection_approval_panel_l.jsp" name="btmAffliD" id="btmAffliD"  onload="resizeIframe(this)" src="" frameborder="0" scrolling="no" width="100%" height=""></iframe>
   
</div>
<body>
<script type="text/javascript">
function resizeIframe(iframe) {
    iframe.height = iframe.contentWindow.document.body.scrollHeight +"px";
    window.requestAnimationFrame(() => resizeIframe(iframe));
}
</script>


</html>