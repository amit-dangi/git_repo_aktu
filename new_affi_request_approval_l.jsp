<!-- @Author Om Kumar-->
<%@page import="com.sits.general.General"%>
<%@page import="com.sits.general.QueryUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.sits.general.ReadProps"%>
<%@page import="com.sits.general.ApplicationConstants"%>
<%@ page import="com.sits.affiliation.transaction.new_affi_request_approval.NewAffiRequestApprovalModel"%>
<%@ page import="com.sits.affiliation.transaction.new_affi_request_approval.NewAffiRequestApprovalManager"%>
 <%@include file="../myCks.jsp"%> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  	<meta http-equiv="Pragma" content="no-cache" />
  	<meta http-equiv="Expires" content="-1" />
  	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css"  type="text/css"> 
    
    <script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" 	src="../resources/js/affiliation/new-affi-request-approval.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../resources/js/aes/AesUtil.js"></script>
	<script type="text/javascript" src="../resources/js/aes/crypto.js"></script>
	<script type="text/javascript" src="../resources/js/common/common.js"></script>	
	<script type="text/javascript" src="../resources/js/hrmsCommonDropDown.js"></script>
	<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
	<script type="text/javascript" src="../resources/js/common/gen.js"></script>
    <script type="text/javascript" src="../resources/js/datepicker/bootstrap-datepicker.js"></script>
	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
    <link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="../resources/css/datepicker/datepicker3.css" type="text/css">

<style>
.manageTxt {
	width: 100%;
	border-radius: 9px;
	margin-bottom: 15px;
}

.manageTxt1 {
	padding-top: 2px !important;
	margin-bottom: 33px;
}
</style>
<script type="text/javascript">
   $(document).ready(function() { 
		$("#APPLY_DATE").datepicker({
			format : 'dd/mm/yyyy',
			autoclose : true,
			 startDate :'-d', 
			 todayHighlight : true,
		}).on('click', function() {
			$("#APPLY_DATE").datepicker("setDate", '');
		}).on('clearDate', function(selected) {
		});
		
 });
</script>
<script>
    function showRemarks() {
        var statusDropdown = document.getElementById("status");
        var remarksField = document.getElementById("remarksDisplay");

        // If "Approve" is selected, show the Remarks field, otherwise hide it
        if (statusDropdown.value === "R") {
            remarksField.style.display = "block";
        } else {
            remarksField.style.display = "none";
        }
    }
</script>
</head>
<%
	String OPT_VALUE = "";

	String OPT_TYPE = "E",remarks="",doc_name="",app_status="",dpass="",det_id="",sel="No",sell="No",IsInstAppToStartTheProgram="",reg_id="",reg_typ="",soc_name="",inst_type="",inst_category="",is_minority="",pro_inst_name=""
			,address="",IsInstDiplomaCourses="",country="",state="",district="",tahsil="",md_name="",mob_no="",email_id="";
	String mast_id = General.checknull(request.getParameter("mast_id"));
	
	int count = 0;
	NewAffiRequestApprovalModel model = new NewAffiRequestApprovalModel();
	
	if (OPT_TYPE.equals("E")) {
		OPT_VALUE = ApplicationConstants.EDIT;
		model 			= NewAffiRequestApprovalManager.viewRecord(mast_id);
		
		det_id			= General.checknull(model.getDet_id());
		reg_id 			= General.checknull(model.getReg_id());
		if(General.checknull(model.getReg_type()).equals("I")){reg_typ="Institute";}
		else if(General.checknull(model.getReg_type()).equals("C")){reg_typ="College";}
		else if(General.checknull(model.getReg_type()).equals("T")){reg_typ="Trust";}
		else if(General.checknull(model.getReg_type()).equals("S")){reg_typ="Society";}
		soc_name		= General.checknull(model.getSocTrSec_name());
		if(General.checknull(model.getIns_type()).equals("CE")){inst_type="CO-ED";}
		else if(General.checknull(model.getIns_type()).equals("MT")){inst_type="MINORITY";}
			
		if(General.checknull(model.getIns_category()).equals("GA")){
			inst_category	="GOVERNMENT AIDED";
		}else if(General.checknull(model.getIns_category()).equals("GD")){
			inst_category	="GOVERNMENT UNIVERSITY DEPARTMENT (SELF-FINANCE)";
		}else if(General.checknull(model.getIns_category()).equals("SF")){
			inst_category	="GOVERNMENT SELF FINANCE";
		}else if(General.checknull(model.getIns_category()).equals("PE")){
			inst_category	="PRIVATE";
		}
		is_minority		= General.checknull(model.getIs_minority());
		pro_inst_name	= General.checknull(model.getProposed_ins_name());
		address			= General.checknull(model.getAddress());
		if(General.checknull(model.getCountry()).equals("I")){
		country			= "INDIA";}
		state			= General.checknull(model.getState());
		//System.out.println("state--"+state);
		district		= General.checknull(model.getDistrict());
		System.out.println("district---"+district);
		tahsil			= General.checknull(model.getTahshil());
		md_name			= General.checknull(model.getSocTrSec_name());
		mob_no			= General.checknull(model.getMob_no());
		app_status		= General.checknull(model.getApp_status());
		email_id		= General.checknull(model.getEmail_id());
		dpass			= General.checknull(model.getDpassword());
		IsInstAppToStartTheProgram = General.checknull(model.getIsInstAppToStartTheProgram());
		if(IsInstAppToStartTheProgram.equals("Y"))sel="Yes";
		IsInstDiplomaCourses = General.checknull(model.getIsInstDiplomaCourses());
		if(IsInstDiplomaCourses.equals("Y"))sell="Yes";
		remarks			= General.checknull(model.getRemarks());
		doc_name = NewAffiRequestApprovalManager.getFileDetail(mast_id);
	}
%>
<body onload="getPrgmList('<%=mast_id%>'); getState('<%=state %>','state_name');getDist('<%=state %>','<%=district%>','district_name')">
	<div class="container-fluid">
		<div id="ftitleHeader" class="page-header">
			<h4>
			</h4>
		</div>
		<!-- "createAndManagePoll" -->
		<form class="form-horizontal" name="frmPostServiceCoverUnderNps"
			id="frmPostServiceCoverUnderNps" method="post" autocomplete="off">
		<div  class="col-md-12" id="ShowDiv"style="padding: 0px;">
			     <div class="panel panel-default">	
			<div class="panel-body">
								<!-- -------------------------------Write content inside this view part------------------------------------------- -->
					<div class="">
		    			<div class="view-data"><u>Registration ID :</u> &emsp;<b><%=reg_id %></b></div>
					</div>
					
					<div class="form-group">
						<div class="col-md-12">
							<div class="row">
							 <label class="col-sm-2 col-form-label">Type of Registration :</label>
								<div class="col-sm-4">
									 <label class="col-form-label"><%=reg_typ %></label>
							     </div>
								<label class="col-sm-2 col-form-label">Society/trust/Section Name :</label>
								  <div class="col-sm-4">
									 <label class="col-form-label"><%=soc_name %></label>
							     </div>
						   </div>
					   </div>
					</div>
	 				 
					 <div class="form-group">
						<div class="col-md-12">
							<div class="row">
							 <label class="col-sm-2 col-form-label">Institute Category :</label>
								<div class="col-sm-4">
									 <label class="col-form-label"><%=inst_type%></label>
							     </div>
								<label class="col-sm-2 col-form-label">Institute Category :</label>
								  <div class="col-sm-4">
									 <label class="col-form-label"><%=inst_category%></label>
							     </div>
						   </div>
					   </div>
					</div>
					
					<div class="form-group">
						<div class="col-md-12">
							<div class="row">
							 <label class="col-sm-2 col-form-label">Is Minority :</label>
								<div class="col-sm-4">
									 <label class="col-form-label"><%if(is_minority.equals("N")){ %>No<%}else{%>Yes<%} %></label>
							     </div>
								<label class="col-sm-2 col-form-label">Proposed Institute Name :</label>
								  <div class="col-sm-4">
									 <label class="col-form-label"><%=pro_inst_name%></label>
							     </div>
						   </div>
					   </div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<div class="row">
							 <label class="col-sm-2 col-form-label">Address :</label>
								<div class="col-sm-4">
									 <label class="col-form-label"><%=address%></label>
							     </div>
								<label class="col-sm-2 col-form-label">Country Name :</label>
								  <div class="col-sm-4">
									 <label class="col-form-label"><%=country%></label>
							     </div>
						   </div>
					   </div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<div class="row">
							 <label class="col-sm-2 col-form-label">State Name :</label>
								<div class="col-sm-4">
									<select class="form-control" id="state_name" name="state_name" disabled="disabled"></select>
								
									 <%-- <label class="col-form-label"><%=state %></label> --%>
							     </div>
								<label class="col-sm-2 col-form-label">District Name :</label>
								  <div class="col-sm-4">
								  <select class="form-control" id="district_name" name="district_name" disabled="disabled"></select>
									 <%-- <label class="col-form-label"><%=district %></label> --%>
							     </div>
						   </div>
					   </div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<div class="row">
							 <label class="col-sm-2 col-form-label">Tehsil Name :</label>
								<div class="col-sm-4">
									 <label class="col-form-label"><%=tahsil%></label>
							     </div>
								<label class="col-sm-3 col-form-label">Chairman/ Chief/ Trustee/ MD Name :</label>
								  <div class="col-sm-3">
									 <label class="col-form-label"><%=soc_name%></label>
							     </div>
						   </div>
					   </div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<div class="row">
							 <label class="col-sm-2 col-form-label">Mobile No :</label>
								<div class="col-sm-4">
									 <label class="col-form-label"><%=mob_no%></label>
							     </div>
								<label class="col-sm-2 col-form-label">Email ID :</label>
								  <div class="col-sm-4">
									 <label class="col-form-label"><%=email_id%></label>
							     </div>
						   </div>
					   </div>
					</div>
					<%-- <div class="col-md-12 table-responsive" style="padding: 0px;display: inline-block;">
					<div id="" class="dataEntryDiv" style="padding: 0px;display: inline-block;">
					<table id="searchTable" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="text-center">S.No.</th>
								<th class="text-center">Programme Name</th>
								<th class="text-center">Programme Type</th>
							<tr>
						</thead>	
						<tbody id="prgmTypeName">
					<%
						int i=0;	
						ArrayList<NewAffiRequestApprovalModel> list =null;
						try {
							list=NewAffiRequestApprovalManager.search(mast_id);
							if(list.size()>0){
					     		Iterator<NewAffiRequestApprovalModel> itr=list.iterator();
					     	while(itr.hasNext()){
					        	i++;
					        	NewAffiRequestApprovalModel data = (NewAffiRequestApprovalModel)itr.next();
					%>	
			                <tr>
								<td style="text-align:center; width:3%;"><%=i %></td>
								<td style="text-align:center; width:5%;"><%=General.checknull(data.getProgramme_name())%></td>
								<td style="text-align:center; width:8%;"><%=General.checknull(data.getProgramme_type())%></td>
							</tr>
					<%
	      			}
						}
					}catch(Exception e){System.out.println("Error in new_affi_request_approval_l.jsp"+e.getMessage());	
					} finally {
					list.clear();
					}
					%>
						</tbody>
					</table>
				  </div>
				</div>  --%>
				
				  <div class="form-group">
						<div class="col-md-12">
							<div class="row">
							 <label class="col-sm-4 col-form-label">Have You Running Institution Diploma Courses :</label>
								<div class="col-sm-2">
									 <label class="col-form-label"><%=sel %></label>
							     </div>
								<label class="col-sm-2 col-form-label">Download (Relevant Documents) :</label>
								 <div class="col-sm-4">
										<a style="word-break: break-all;"
											href="../downloadfile?filename=<%=doc_name%>&folderName=/AKTU_AFFILIATION_PORTAL/REGISTRATION_DOCUMENT/<%=reg_id%>&fstatus=dwnFileFrmDir">
											<strong> <u><%=doc_name %></u></strong>
										</a>
									</div>
							     
						   </div>
					   </div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<div class="row">
							    <label class="col-sm-4 col-form-label">The Institution Applied to AICTE or PCI in 2019 to Start the Program :</label>
								  <div class="col-sm-2">
										 <label class="col-form-label"><%=sell %></label>
							     </div>
								<label class="col-sm-2 col-form-label">Payment Status :</label>
								  <div class="col-sm-4">
								  <%if(app_status.equals("A")){ %>
									 <label class="col-form-label"><b style="color:green;">Success</b></label>
								<%}else if(app_status.equals("R")){ %>
									 <label class="col-form-label"><b style="color:Red;">Reject</b></label>
								 <%}else if(!app_status.equals("R")||!app_status.equals("A")){ %>
								 <label class="col-form-label"><b style="color:Orange;">Pending</b></label>
								 <%} %>
							     </div>
						   </div>
					   </div>
					</div>
				<div class="form-group">
					<div class="col-md-12">
						<div class="row">
						 <label class="col-sm-2 col-form-label" for="">Status :</label>
							<div class="col-sm-4">
								<select class="form-control" id="Xstatus" name="Xstatus" <%if(app_status.equals("A")||app_status.equals("R")){ %> disabled="disabled"<%} %>>
									<option value="">Select Status</option>
									<option <%if(app_status.equals("A")){ %> selected="selected"<%} %> value="A">Approved</option>
									<option <%if(app_status.equals("R")){ %> selected="selected"<%} %>value="R">Reject</option>
								</select>
						     </div>
					   </div>
				   </div>
				</div>
				<div class="form-group" id="Xshowremarks" <%if(app_status.equals("R")) {}else{%> style="display: none;"<%} %>>
					<div class="col-md-12">
						<div class="row">
						<label class="col-sm-2 col-form-label" for="">Send Notification Mail :</label>
							  <div class="col-sm-2">
								<input type="checkbox" class="" id="send_mail" name="send_mail" value="">
						     </div>
							<label class="col-sm-2 col-form-label text-right required-field" for="">Remarks</label>
							  <div class="col-sm-6">
								<textarea class="" id="Xremarks" name="Xremarks" value="" style="height: 80px;width: 100%;"><%=remarks %></textarea>
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

				<div class="col-md-12 text-center m-t-20">
				<%if(app_status.equals("A")) { %>
				<%}else{ %>
					<button type="button" class="btn btn-view" id="" onClick="vldSave()">Save</button>
					<%} %>
					<input type="hidden" id="det_id" name="det_id" value="<%=det_id%>">
					<input type="hidden" id="mast_id" name="mast_id" value="<%=mast_id%>">
					 <input type="hidden" name="hrmsApi" id="hrmsApi" value="<%=ReadProps.getkeyValue("hrms-api.url", "sitsResource")%>">
					<input type= "hidden" id="AESKey" value="<%= session.getAttribute("AESUniqueKey")%>" />
					<input type="hidden" id="Xmail_id" name="Xmail_id" value="<%=email_id%>">
					<input type="hidden" id="dpassword" name="dpassword" value="<%=dpass%>">
					<button type="button" class="btn btn-view" id="" onClick="btnReset();">Reset</button> 
				</div>
				</div>
				</div>
					<!-- -------------------------------End Here (Write content inside this view part)------------------------------------------- -->
			    </div>
				
			<iframe class="embed-responsive-item"
				name="btmfrmPostServiceCoverUnderNpsD" onload="resizeIframe(this)"
				id="btmfrmPostServiceCoverUnderNpsD" width="100%;" height="" src="" frameborder="0"
				scrolling="no"></iframe>
		</form>
	</div>
	<!-- End container-fluid -->
</body>
<script type="text/javascript">
function resizeIframe(iframe) {
    iframe.height = iframe.contentWindow.document.body.scrollHeight + "px";
    window.requestAnimationFrame(() => resizeIframe(iframe));
}
</script>
<script src="../assets/datepicker/bootstrap-datepicker.js"></script>
</html>
