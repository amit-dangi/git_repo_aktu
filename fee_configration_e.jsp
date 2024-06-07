<!-- @author Ashwani kumar  (29-Dec-2023)   -->  
<%@page import="com.sits.general.ReadProps"%>
<%@page import="com.sits.general.QueryUtil"%>
<%@page import="com.sits.general.General"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sits.general.ApplicationConstants"%>
<%@page import="com.sits.affiliation.common_master.manage_fee_configration.ManageFeeConfigrationModel"%>
<%@page import="com.sits.affiliation.common_master.manage_fee_configration.ManageFeeConfigrationManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"href="../resources//bootstrap/css/bootstrap.min.css"type="text/css">
<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
<script src="../resources//bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../resources/js/aes/AesUtil.js"></script>
<script type="text/javascript" src="../resources/js/aes/crypto.js"></script>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
<script type="text/javascript" src="../resources/js/common/validations.js"></script>
<script type="text/javascript" src="../resources/js/common/gen.js"></script>
<script type="text/javascript" src="../resources/js/commonDropDown.js"></script>
<script type="text/javascript" src="../resources/js/hrmsCommonDropDown.js"></script>
<script type="text/javascript" src="../resources/js/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="../resources/sits/timepicker/bootstrap-timepicker.js"></script>
<script type="text/javascript" src="../resources/js/affiliation/fee-config.js"></script>

<link rel="stylesheet" href="../resources/css/datepicker/datepicker3.css"  type="text/css">
<link rel="stylesheet" href="../resources/sits/timepicker/bootstrap-timepicker.css"  type="text/css">
<link rel="stylesheet" href="../resources/assets/plugins/timepicker/bootstrap-timepicker.css" type="text/css">
<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/responsive.css" rel="stylesheet"type="text/css" />
<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css"rel="stylesheet" type="text/css" />


<style>
 table#HeadGrid
 {
    margin: 0px;
    font-family: verdana;
    font-size: 10px;
 }
 
 .tableGrid th
 {
    font-weight: normal;
    color: #ffffff;
    background-color: #0A819C; /*#5583C9;*/
    font-family: courier-new,sans-serif;
    font-size: 11px;  
    padding: 4px;
    line-height: 1.42857143;
    vertical-align: bottom;
    border: 1px solid #ddd; 
 }
.fileTabs {
    color: #fff !important;
    }

</style>
</head>
<script type="text/javascript">
	
	function showTable(i) {
		
		try {
			for (k = 1; k <= 2; k++) {
				
				document.getElementById("ftb" + k).className = "fileTabs";
				document.getElementById("tab" + k).style.display = "none";
				document.getElementById("ftb" + k).style.background = "#0A819C";
			}
			//document.getElementById("ftb"+i).className="fileTabs_show";
			
			document.getElementById("ftb" + i).className = "fileTabs";
			document.getElementById("tab" + i).style.display = "";
			document.getElementById("ftb" + i).style.background = "#ff8c00";
			if(i=='2'){
				var type='AC'
				Search(type);
			}else{
				var type='RC'
				Search(type);
			}
			
		} catch (err) {
			alert(err.message);
		}
	}
 
	function ishowTable(i) {
		document.getElementById("ftb" + i).className = "fileTabs_show";
	}
	 
</script>
<%
	
	String OPT_VALUE="", OPT_TYP = "",reg_id="", session_name="";
	int cnt=0;
	String req_id="",eff_date="",amount="",additional="",req_type="",sub_req_type="";
 	OPT_TYP = General.checknull(request.getParameter("opt_typ"));
 	reg_id = General.checknull(request.getParameter("id"));
if(OPT_TYP.equals("")) {
		cnt=1;
		OPT_TYP = "N";
		OPT_VALUE = ApplicationConstants.NEW;
	}
 
%>


<body onload="<%if(OPT_TYP.equals("E")){ %> getAcademicSession('<%=session_name %>');<% }%>">
		<div class="container-fluid">
			<div id="ftitleHeader" class="page-header"><h4><%=ReadProps.getkeyValue("fee_configuration.header","sitsResource") %></div>
			<div id="tab_info">
				<div class="form-group row" style="margin: 0px; padding: 0px;">
				<label id="ftb1" class="col-sm-1 col-form-label fileTabs"style="width: 20%;" onClick="showTable('1'); ">Registration Fee Configuration</label>
				 <label id="ftb2"class="col-sm-1 col-form-label fileTabs" style="width: 20%;" onClick="showTable('2');">Application Fee Configuration</label></div>
		</div>
		<!-- End tab_info -->
		<form class="form-horizontal" name="frmdfeeconfigE" id="frmdfeeconfigE"  method="post" autocomplete="off" >
		<div id="tab1"  class="tab_details">
			<div class="panel-heading">
				<h3 class="panel-title colr-tab">Personal Information</h3>
			</div>
			<div class="panel-body">
				<div class="panel-body"style="border-width: 1px; border-style: solid; border-color: #0A819C;">
					<div class="form-group ">
						<div class="row">
							<div class="col-sm-12">
								<label for="" class="col-sm-2 col-form-label required-field">Session</label>
								<div class="col-sm-4">
									<select id="session_id" class="form-control">
										<option value="">Select Session</option>
									</select>
								</div>
								<label for="" class="col-sm-2 col-form-label required-field">Effective From</label>
								<div class="col-sm-4">
									<div class="input-group date" id="">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" class="form-control XFDATE1" id="XFDATE1"name="XFDATE1" aria-invalid="true" aria-required="true"required="required" placeholder="Enter Date" onclick=""onchange="" value="">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group ">
						<div class="row">
							<div class="col-sm-12">
								<label for="" class="col-sm-2 col-form-label required-field">Amount</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="amount" name="amount" value="" maxlength="10" onkeypress="return allowOnlyNumeric(event)"placeholder="Enter Amount">
								</div>
								<label for="" class="col-sm-2 col-form-label   ">AdditionalCost(If Any)</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="Additional_Cost" name="Additional_Cost" value="" maxlength="10" onkeypress="return allowOnlyNumeric(event)" placeholder="Enter Additional Cost">
								</div>
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
				<div class="col-md-12 text-center"style="margin-top: 15px; padding-bottom: 10px;">
					
				<%-- 	 <%if(OPT_TYP.equals("N")){ %> --%>
					<button type="button" class="btn btn-view" onclick="validate();">Save</button>
				<%-- 	<%}else if(OPT_TYP.equals("E")){ %>
			         <button type="button" class="btn btn-view" id="updtBtn" name="updtBtn" onClick="validate();">Update</button>
			 	     <button type="button" class="btn btn-view" id="btnback" >Back</button>		 
			        <%} %> --%>
			        
					 <button type="button" class="btn btn-view" id="btnRst" onclick="">Reset</button>
				     <input type= "hidden" id="fstatus" value="<%=OPT_TYP %>"  /> 
				     <input type= "hidden" id="Reg_config" value="<%=reg_id %>"  />   
				     <input type= "hidden" id="AESKey" value="<%= session.getAttribute("AESUniqueKey")%>" >
					 <input type="hidden" name=hrmsApi id="hrmsApi" value="<%=General.checknull(ReadProps.getkeyValue("hrms-api.url", "sitsResource")) %>"> 
				     <input type="hidden" name="Reg_config" id="Reg_config" value="RC"/>
				
				</div>
			</div>
			<!-- End panel-body -->
		</div>
		<!-- End tab1 -->
		<div id="tab2"  class="tab_details">
			<div class="panel-heading">
				<h3 class="panel-title colr-tab">Other Details</h3>
			</div>
			<div class="panel-body">
				<div class="panel-body" style="border-width: 1px; border-style: solid; border-color: #0A819C;">
					
					<div class="form-group ">
						<div class="row">
							<div class="col-sm-12">
								<label for="" class="col-sm-2 col-form-label required-field">Institute Type</label>
								<div class="col-sm-4">
									<select class="form-control" id="inst_type" name="inst_type">
										<option value="">Select Institute Type</option>
										<%=QueryUtil.getComboOption("cparam", "PDOC", "DESCP1", "", "CODE='AKTU_PORT' and SERIAL='INST_TYP'", "ORDERBY")%>
									</select>
								</div>
								<label for="" class="col-sm-2 col-form-label required-field">Institute Category</label>
								<div class="col-sm-4">
									<select class="form-control" id="inst_cat" name="inst_cat">
										<option value="">Select Institute Category</option>
										<%=QueryUtil.getComboOption("cparam", "PDOC", "DESCP1", "", "CODE='AKTU_PORT' and SERIAL='INST_CAT'", "ORDERBY")%>
									</select>
								</div>
							</div>
						</div>
					</div>
					
					
					
					
					<div class="form-group ">
						<div class="row">
							<div class="col-sm-12">
								<label for="" class="col-sm-2 col-form-label required-field">Request Type</label>
								<div class="col-sm-4">
									<select id="req_id" name="req_id"class="form-control">
										<option value="">Select Request Type</option>
										  <%=QueryUtil.getComboOption("af_request_type", "req_id", "req_desc ","", "", "req_desc") %>
									</select>
								</div>
								<label for="" class="col-sm-2 col-form-label required-field">Request Sub Type</label>
								<div class="col-sm-4">
									<select id="sub_req_name" name="sub_req_name"class="form-control">
										<option value="">Select Request Sub Type</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					
					<div class="form-group ">
						<div class="row">
							<div class="col-sm-12">
								<label for="" class="col-sm-2 col-form-label required-field">Session</label>
								<div class="col-sm-4">
									<select id="Xsession_id" class="form-control">
										<option value="">Select Session</option>
									</select>
								</div>
								<label for="" class="col-sm-2 col-form-label required-field">Effective
									From</label>
								<div class="col-sm-4">
									<div class="input-group date" id="">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" class="form-control XTDATE1" id="XTDATE1"name="XTDATE1" aria-invalid="true" aria-required="true"required="required" placeholder="Enter Date" onclick="" onchange="" value="">
									</div>
								</div>
							</div>
						</div>
					</div>
		
					<div class="form-group ">
						<div class="row">
							<div class="col-sm-12">
								<label for="" class="col-sm-2 col-form-label required-field">Amount</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="Xamount" name="Xamount" value="" maxlength="10" onkeypress="return allowOnlyNumeric(event)" placeholder="Enter Amount">
								</div>
								<label for="" class="col-sm-2 col-form-label  ">Additional Cost(If Any)</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="XAdditional_Cost" name="XAdditional_Cost" value="" maxlength="10" onkeypress="return allowOnlyNumeric(event)" placeholder="Enter Additional Cost">
								</div>
							</div>
						</div>
					</div>
					 <div class="form-group">
						<div class="row">
							<div class="col-sm-12">
								<label class="col-sm-2 col-form-label frm-label text-1" for="">Is Minority</label>
								<div class="col-sm-10">
									<input type="checkbox" class="" name="is_minority" id="is_minority" maxlength="1">
								</div>
							</div>
						</div>
					</div>
					
				</div>
				<div class="col-sm-12">
					<div class="row text-center">
						<div class="errmessage1" id="errMsg3"></div>
					</div>
				</div>
					<div class="col-sm-12">
					<div class="row text-center">
						<div class="errmessage2" id="errMsg4"></div>
					</div>
				</div>
				    <div class="col-md-12 text-center"style="margin-top: 15px; padding-bottom: 10px;">
					<%--  <%if(OPT_TYP.equals("N")){ %> --%>
					<button type="button" class="btn btn-view" onclick="validate1();">Save</button>
					<%-- <%}else if(OPT_TYP.equals("E")){ %>
			         <button type="button" class="btn btn-view" id="updtBtn" name="updtBtn" onClick="validate1();">Update</button>
			 	     <button type="button" class="btn btn-view" id="btnback1" >Back</button>		 
			        <%} %> --%>
					
					<button type="button" class="btn btn-view" id="btnReset" onclick="">Reset</button>
				</div>
				</div>
				    
			</div>
			</form>
			<!--<input type="hi dden" id="tab1" value="RFC" />
			<input type="hi dden" id="tab2" value="AFC" /> -->
		
<iframe class="embed-responsive-item" src="fee_configration_l.jsp" onload="resizeIframe(this)" id="btmfrmfeeconfing"  name="btmfrmfeeconfing" frameborder="0" scrolling="no" width="100%" height=""></iframe>
   </div>
</body>
<script>
function resizeIframe(iframe) {
  iframe.height = iframe.contentWindow.document.body.scrollHeight + "px";
  window.requestAnimationFrame(() => resizeIframe(iframe));
}
</script>

<script type="text/javascript">
	document.body.onLoad = showTable("1");
	$(document).ready(function() {

		$(".XFDATE1").datepicker({
		   format : 'dd/mm/yyyy',
		   autoclose : true,
		   orientation: 'top',
		   todayHighlight: true,
		});

		$(".XTDATE1").datepicker({
		   format : 'dd/mm/yyyy',
		   autoclose : true,
		   orientation: 'top',
		   todayHighlight: true,
		});
	});
</script>
	
</html>