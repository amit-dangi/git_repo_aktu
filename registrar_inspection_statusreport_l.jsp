<!-- @Author Amit danGi-->
<%@page import="com.sits.general.General"%>
<%@page import="com.sits.general.QueryUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator" %>
<%@page import="com.sits.general.ApplicationConstants"%>
<%@include file="../myCks.jsp"%>
<%@page import="com.sits.affiliation.approval.inspection_by_registrar.*" %>
<%@page import="org.json.simple.JSONArray" %>
<%@page import="org.json.simple.JSONObject" %>

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
    <link href="../resources/sits/DataTable/1.10.15/css/dataTables.bootstrap.css" rel="stylesheet"> 
    <script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../resources/js/datepicker/bootstrap-datepicker.js"></script>
	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
    <link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="../resources/css/datepicker/datepicker3.css" type="text/css">

</head>
 <body>
 <%
 String session_code       	= General.checknull(request.getParameter("session_id"));
 String inst_name		 	= General.checknull(request.getParameter("inst_name"));
 String reg_no       		= General.checknull(request.getParameter("reg_no"));
 String final_status		= General.checknull(request.getParameter("final_status"));
 
 InspectionByRegistrarModel model = new InspectionByRegistrarModel();
 model.setSession_id(session_code);
 model.setInst_name(inst_name);
 model.setApplicationId(reg_no);
 model.setActiontype(final_status);
 JSONObject objectJson=new JSONObject();
 objectJson=InspectionByRegistrarManager.getReportDetails(model);
 JSONArray apparray = (JSONArray) objectJson.get("Applicationlist");
%> 
	<form name="frmNewAffiReqApprovale" id="frmNewAffiReqApprovale" action="" method="post" autocomlete="off">
	<div id="searchingTable1" class="scr0">
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
		    <div class="col-sm-4 repTitle">List of Application(s)</div>
		    <div class="col-sm-4 repTitle text-center">Run Date : <%=General.currdate_time() %>&nbsp;</div>	
	   </div>	
	<div class="responsive">
	 <table id="searchTable" class="table table-striped table-bordered table-hover display nowrap" cellspacing="0" width="100%">
			<thead class="theadnew" >
				<tr>
								<th class="text-center">Sr No.</th>
								<th class="text-center">Application Submit Date</th> 
								<th class="text-center">Session</th>
								<th class="text-center">Reg No.</th>
								<th class="text-center">Institute Name</th>
								<th class="text-center">Society/ Trust/ Section Name</th>
								<th class="text-center">Inspection Panel</th>
								<th class="text-center">Feedback</th>
								<th class="text-center">Remarks</th>
								<th class="text-center">Status</th>
								<th class="text-center">Action Date</th>
					
				</tr>
			</thead>	
			<tbody>
	<%
						try{
					    	  for (int i = 0; i < apparray.size(); i++) {
									JSONObject dataobj = (JSONObject) apparray.get(i);
									String consolidate_status=General.checknull(dataobj.get("registrar_status").toString());
					    	  %>
				  <tr style="background-color:<%=(consolidate_status.contains("Submitted")?"#3d8d3d91":consolidate_status.contains("Rejected")?"#a94442a6":"#ff00000f")%>">
				  		<td style="text-align:center; width:5%; font-weight: bold;"></td>
						<td style="text-align:center; width:5%;"><%=General.checknull(dataobj.get("is_final_submit_app_dt").toString())%></td>
                    	<td style="text-align:center; width:8%;"><%=(dataobj.get("session").toString() +"-"+ (Integer.parseInt(dataobj.get("session").toString())+1))%></td>
                    	<td style="text-align:center; width:5%;"><%=General.checknull(dataobj.get("REG_NO").toString())%></td>
                    	<td style="text-align:center; width:8%;"><%=General.checknull(dataobj.get("PROP_INST_NAME").toString())%></td>
                    	<td style="text-align:center; width:8%;"><%=General.checknull(dataobj.get("REG_FOR_NAME").toString())%></td>
                    	<td style="text-align:center; width:8%;"><%=General.checknull(dataobj.get("panel_name").toString())%></td>
                    	<td style="text-align:center; width:8%;"><%=General.checknull(dataobj.get("registrar_remarks").toString())%></td>
                    	<td style="text-align:center; width:8%;"><%=General.checknull(dataobj.get("registrar_recm").toString())%></td>
                    	<td style="text-align:center; width:8%; color:<%=consolidate_status.contains("Pending")?"#ff000096":"" %>;"><b><%=General.checknull(dataobj.get("registrar_status").toString())%></b></td>
                    	<td style="text-align:center; width:8%;"><%=General.checknull(dataobj.get("actiondate").toString())%></td> 
                    	</tr>
                    	
				 <%}%>  
			</tbody>
			<% } catch(Exception e){
				e.printStackTrace();
				System.out.println("Error in registrar_inspection_statusreport_l.jsp::"+e.getMessage());
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
		        "order": [[ 2, 'asc' ]],
		
		     	 dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6> <'col-sm-4 text-right'B>>" +
		        	"<'row'<'col-sm-6'l><'col-sm-6'>>" +
		   		  "<'row'<'col-sm-12'tr>>" +
				    	  "<'row'<'col-sm-5'i><'col-sm-7'p>>", 
				buttons: [
				{	
				extend: 'excelHtml5',
				filename: 'Registrar Inspection Status Detail Report', 
				className: 'btn btn-view',
				text	:'Download',
				 title: 'Registrar Inspection Status Detail Report',
				exportOptions: {
				columns: [ 0,1,2,3,4,5,6,7,8,9,10]
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