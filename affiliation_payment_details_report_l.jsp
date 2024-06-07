<!-- @author Disha   -->  

<%@page import="com.sits.general.ReadProps"%>
<%@page import="com.sits.general.QueryUtil"%>
<%@page import="com.sits.general.General"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sits.general.ApplicationConstants"%>
<%@page import="com.sits.affiliation.reports.affiliation_payment_details_report.AffiliationPaymentDetailsManager"%>
<%@page import="com.sits.affiliation.reports.affiliation_payment_details_report.AffiliationPaymentDetailsModel"%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  	<meta http-equiv="Pragma" content="no-cache" />
  	<meta http-equiv="Expires" content="-1" />
  	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet"href="../resources//bootstrap/css/bootstrap.min.css"type="text/css">
	<link href="../resources/sits/DataTable/1.10.15/css/dataTables.bootstrap.css" rel="stylesheet"> 
<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
<script src="../resources//bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../resources/js/aes/AesUtil.js"></script>
<script type="text/javascript" src="../resources/js/aes/crypto.js"></script>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
<script type="text/javascript" src="../resources/js/common/validations.js"></script>
<script type="text/javascript" src="../resources/js/common/gen.js"></script>
<script type="text/javascript" src="../resources/js/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="../resources/js/affiliation/affiliation-payment-details-report.js"></script>

<link rel="stylesheet" href="../resources/css/datepicker/datepicker3.css"  type="text/css">

<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/responsive.css" rel="stylesheet"type="text/css" />
<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css"rel="stylesheet" type="text/css" />

	
	</head>
</head>
<body>
 <% 
  String payment_status="";
ArrayList<AffiliationPaymentDetailsModel>arrayList=null;
AffiliationPaymentDetailsModel model=new AffiliationPaymentDetailsModel();
String college_id      =General.checknull(request.getParameter("college_id"));
String request_id      =General.checknull(request.getParameter("request_id"));
String sub_req_id      =General.checknull(request.getParameter("sub_req_id")); 
String report_type      =General.checknull(request.getParameter("report_type"));
String final_submit      =General.checknull(request.getParameter("final_submit")); 

model.setCollege_id(college_id);
model.setRequest_id(request_id);
model.setSub_req_id(sub_req_id);
model.setReport_type(report_type);
model.setIs_final_submit_app(final_submit);

arrayList=AffiliationPaymentDetailsManager.getList(model);
String isshow=model.getReport_type().equals("FS")?"none":"show";

%>
<form name="documentmastL" id="documentmastL" action="" method="post" autocomlete="off">
   <div id="searchingTable1" class="scr0">
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
			<div class="page-header-1">
				<div class="col-sm-4 repTitle h5 ">List of Payment Detail(s)</div>
				<div class="col-sm-4 repTitle h6 text-center">Run Date : <%=General.currdate_time() %></div>
			</div>
    	<table id="searchTable" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%" style="">
			<thead>
				<tr>
					<th class="text-center">S.No.</th>
					<th class="text-center">College Name(Code)</th>
					<th class="text-center">Request Name</th>
					<th class="text-center">Sub Request Name</th>
					<th class="text-center">Amount(Rs.)</th>
					<th class="text-center" style="display: <%=isshow%>">Transaction Id</th>
					<th class="text-center" style="display: <%=isshow%>">Date & Time </th>
					<th class="text-center">Payment Status</th>
					<th class="text-center">Is Final Submit</th>
			</thead>	
			<tbody>
			  <% 
	int i=0;
	if(arrayList.size()>0){
	for(AffiliationPaymentDetailsModel apm: arrayList){
		String status=apm.getPayment_status();
		payment_status = status.substring(0,1).toUpperCase() + status.substring(1).toLowerCase();
		i++;
		String bgcolor=apm.getIs_final_submit_app().equals("Y")?"Green":"Red";
		%> 
                <tr>
					<td style="text-align:center; width:3%;"><%=i %></td>
					<td style="text-align:center; width:10%;"><%=apm.getCollege_name() %></td>
					<td style="text-align:center; width:10%;"><%=apm.getRequest_name() %></td>
					<td style="text-align:center; width:10%;"><%=apm.getSub_req_name() %></td>
					<td style="text-align:center; width:6%;"><%=apm.getAmount() %></td>
					<td style="text-align:center; width:6%; display: <%=isshow%>;"><%=apm.getBank_orderId()%></td>
					<td style="text-align:center; width:6%; display: <%=isshow%>" ><%=apm.getTransactionDate() %></td>
					<td style="text-align:center; width:6%;"><%=payment_status %></td>
					<td style="text-align:center; width:6%; color:<%=bgcolor%>"><b><%=apm.getIs_final_submit_app().equals("Y")?"Yes":"No" %></b></td>
				
				 </tr>
				 <%} 
	}
	%>  
			</tbody>
		</table>
	</div>
</form>
	<script src="../resources/sits/DataTable/1.10.15/js/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../resources/bootstrap/js/bootstrap.js"></script>
    <script src="../resources/sits/DataTable/1.10.15/js/jquery.dataTables.js"></script>
    <script src="../resources/sits/DataTable/1.10.15/js/dataTables.bootstrap.js"></script>
    
   <script src="../resources/sits/DataTable/1.4.2/js/buttons.flash.min.js"></script>
   <script src="../resources/sits/DataTable/1.4.2/js/buttons.html5.min.js"></script>
   <script src="../resources/sits/DataTable/1.4.2/js/buttons.print.min.js"></script>
   <script src="../resources/sits/DataTable/1.4.2/js/dataTables.buttons.min.js"></script>
   <script src="../resources/sits/DataTable/1.4.2/js/vfs_fonts.js"></script> 
   <script src="../resources/sits/DataTable/1.4.2/js/jszip.min.js"></script>
	<script>      
		$(document).ready(function() {
    	    var t = $('#searchTable').DataTable( {
    	    	"lengthMenu": [[-1,10, 25, 50, 100, 250, 500], ['All',10, 25, 50, 100, 250, 500]],
    	    	"searching" : false,
       			//"scrollY": "250px",
                "scrollX": true,
                "scrollCollapse": true,
                "paging": true,
    	    	"columnDefs": [ {
    	            "searchable": false,
    	            "orderable": false,
    	            "targets": 0
    	        } ],
    	         dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6> <'col-sm-4 text-right'B>>" +
            	"<'row'<'col-sm-6'l><'col-sm-6'>>" +
       		    "<'row'<'col-sm-12'tr>>" +
        	    "<'row'<'col-sm-5'i><'col-sm-7'p>>",   
	        	buttons: [
	            	{	
   	                	extend: 'excelHtml5',
   	                 	filename: 'Affiliation Payment Details Report',
   	                	className: 'btn btn-view',
   	               	    title: 'Affiliation Payment Details Report',
   	                	text	:'Download',
   	                	exportOptions: {
   	                    	columns: [ 0,1,2,3,4,5,6,7,8]
   	                	},
   	           		 }
	        	],
    	        columnDefs: [{ orderable: false, "targets": [0,4,5,6] },
   				  
   				 ],
    	        "order": [[ 1, 'asc' ]]
    	    } );
    	 
    	    t.on( 'order.dt search.dt', function () {
    	        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
    	            cell.innerHTML = i+1;
    	            t.cell(cell).invalidate('dom');
    	        } );
    	    } ).draw();
    	} );
      
</script>
</body>
</html>