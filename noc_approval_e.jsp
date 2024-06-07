<!-- @Author Om Kumar-->
<%@page import="com.sits.general.General"%>
<%@page import="com.sits.general.QueryUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator" %>
<%@page import="com.sits.general.ApplicationConstants"%>
<%@include file="../myCks.jsp"%>
<%@ page import="com.sits.affiliation.transaction.noc_approval.NocApprovalManager"%>
<%@ page import="com.sits.affiliation.transaction.noc_approval.NocApprovalModel"%>

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
    <script type="text/javascript" 	src="../resources/js/affiliation/noc-approval.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
    
	<link href="../resources/sits/DataTable/1.10.15/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
    <link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="../resources/css/datepicker/datepicker3.css" type="text/css">

</head>
 <body>
 <%
	 int i=0;
	 String from_date       = General.checknull(request.getParameter("XFROMDATE"));
	 String to_date		 	= General.checknull(request.getParameter("XTODATE"));
	 String reg_type		= General.checknull(request.getParameter("TypeOfReg"));
	 String status			= General.checknull(request.getParameter("AppStatus"));
//	 System.out.println("lpage---"+from_date+"||"+to_date+"||"+reg_type+"||"+status);
	 NocApprovalModel umodel = new NocApprovalModel();
	 umodel.setFrom_date(from_date);
	 umodel.setTo_date(to_date);
	 umodel.setReg_type(reg_type);
	 umodel.setStatus(status);
%> 
<form name="frmNocApprovale" id="frmNocApprovale" action="" method="post" autocomlete="off">
<div id="searchingTable1" class=" scr0">
<div class="col-sm-12 text-center">
	<div class="row">
		<div class="errmessage1"  id="errMsg1"></div>
	</div>	
</div>
<div class="col-sm-12 text-center">
	<div class="row">
		<div class="errmessage2"  id="errMsg2"></div>
	</div>	
</div>

<div class="page-header-1">
    <div class="col-sm-4 repTitle">List of Registration(s)</div>
	    <div class="col-sm-4 repTitle text-center">Run Date : <%=General.currdate_time() %>&nbsp;</div>	
</div>	
<div class="responsive">
	<table id="searchTable" class="table table-striped table-bordered table-hover display nowrap" cellspacing="0" width="100%">
		<thead class="theadnew" >
			<tr>
				<th class="text-center">S.No.</th>
				<th class="text-center">Registration ID</th>
				<th class="text-center">Institute Name</th>
				<th class="text-center">Request For</th>
				<th class="text-center">Sub Request For</th>
				<th class="text-center">Mobile No.</th>
				<th class="text-center">Email ID</th>
				<!-- <th class="text-center">Upload Noc</th> -->
				<th class="text-center">View</th>
				<th class="text-center">Status</th>
			</tr>
		</thead>	
	<tbody>

	<%	try{
			ArrayList <NocApprovalModel>  al= NocApprovalManager.getList(umodel);
	      	Iterator<NocApprovalModel> itr = al.iterator();
	      		while(itr.hasNext()){
	    	  	NocApprovalModel model =itr.next();
	    	  	i++; 
   	  %>
		  <tr>
				<td style="text-align:center; width:3%;"><%=i %></td>
				<td style="text-align:center; width:5%;"><%=General.checknull(model.getReg_id())%></td>
				<td style="text-align:center; width:8%;"><%=General.checknull(model.getIns_name())%></td>
				<td style="text-align:center; width:10%;"><%=General.checknull(model.getReq_for())%></td>
				<td style="text-align:center; width:10%;"><%=General.checknull(model.getSub_reqId())%></td>
				<td style="text-align:center; width:5%;"><%=General.checknull(model.getMob_no()) %></td>
				<td style="text-align:center; width:8%;"><%=General.checknull(model.getEmail_id()) %></td>
				<%-- <%if(General.checknull(model.getUpload_noc()).equals("N")){ %>
					<td style="text-align:center; width:9%;"><b>No Document Attached</b></td>
				<%}else{ %>
					<td style="text-align:center; width:9%;"><b>Document Attached</b></td>
				<%} %> --%>
					<td style="text-align:center; width:8%; text-decoration: underline;cursor: pointer;">
							<a class="fa fa-eye" onclick="getReport('<%=General.checknull(model.getNoc_id())%>');"><b>View</b></a></td>
				<%if(General.checknull(model.getApp_status()).equals("R")){ %>
					<td style="text-align:center;color:Red; width:5%;"><b>Reject</b></td>
				<%}else if (General.checknull(model.getApp_status()).equals("A")){ %>
					<td style="text-align:center;color:Green; width:5%;"><b>Approved</b></td>
				<%}else{ %>
					<td style="text-align:center;color:Orange; width:5%;"><b>Pending</b></td>
				<%} %>
		 </tr>
			 <%}%>  
	</tbody>
<% } catch(Exception e){
		e.printStackTrace();
		System.out.println("Error in new_affi_request_approval_e.jsp::"+e.getMessage());
	}%>
	</table>
</div>
</div>  
 </form>
	   
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
		       var t = $('#searchTable').DataTable({
		  		"searching" : false,
		  		"lengthMenu": [[ -1,10, 25, 50, 100, 250, 500], ['All',10, 25, 50, 100, 250, 500]],
		  		//"scrollY": "200px",
		         "scrollX": true,
		         "scrollCollapse": true,
		         "paging":true,
		        
		  		"columnDefs": [{
		         	"searchable": false,
		         	"orderable": false,
		         	"targets": 0
		     	}],
		        "order": [[ 1, 'asc' ]],
		
		     	 dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6> <'col-sm-4 text-right'B>>" +
		        	"<'row'<'col-sm-6'l><'col-sm-6'>>" +
		   		  "<'row'<'col-sm-12'tr>>" +
				    	  "<'row'<'col-sm-5'i><'col-sm-7'p>>", 
				buttons: [
				{	
				extend: 'excelHtml5',
				 filename: 'Noc Approval', 
				 title: 'Noc Approval', 
				 className: 'btn btn-view',
				text	:'Download',
				exportOptions: {
				columns: [ 0,1,2,3,4,5,7]
				},
				},
				],                      	       	
			     	columnDefs: [
			     		{ orderable: false, "targets": [0] },
								],
					 }); 
			        t.on( 'order.dt search.dt', function () {
			     	t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			         cell.innerHTML = i+1;
			         t.cell(cell).invalidate('dom');
			     	});
			 	}).draw();
	    </script> 
	</body>
</html> 