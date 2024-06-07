<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.css"  type="text/css">
  <link href="../resources/sits/DataTable/1.10.15/css/dataTables.bootstrap.css" rel="stylesheet"> 
  <script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
<script src="../resources//bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
<script type="text/javascript" src="../resources/js/common/validations.js"></script>
<script type="text/javascript" src="../resources/js/common/gen.js"></script>
<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/themes/responsive.css" rel="stylesheet"type="text/css" />
<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css"rel="stylesheet" type="text/css" />
</head>
<body>

 <form name="CreInspectionAndApprPanel" id="CreInspectionAndApprPanel" action="" method="post" autocomplete="off">
	<div id="searchingTable1" class=" scr0">
			<div class="col-sm-12">
			   <div class="row text-center">
			    <div class="errmessage1"  id="errMsg1"></div>
			 </div>
		   </div>
	   <div class="page-header-1">
		    <div class="col-sm-4 repTitle ">List of Created Panel(s)</div>
		    <div class="col-sm-4 repTitle text-center">Run Date :&nbsp;</div>	
	   </div>	
	<table id="searchTable" class="table table-striped table-bordered table-hover display nowrap" cellspacing="0" width="100%">
			<thead class="theadnew" >
				<tr>
					<th class="text-center">S.No.</th>
					<th class="text-center">College Name</th>
					<th class="text-center">Affiliation Name</th>
					<th class="text-center">Session</th>
					<th class="text-center">Department Name</th>
					<th class="text-center">Degree Name</th>
					<th class="text-center">Present Capacity</th>
					<th class="text-center">Seat Required</th>
					<th class="text-center">Proposed Fee</th>
					<th class="text-center">Edit</th>
					<th class="text-center">Delete</th>
				</tr>
			</thead>	
			<tbody>
			 
			
				 <tr>
					<td style="text-align:center;width:5%;"></td>
					 <td style="text-align:center;width:15%;"></td>
					 <td style="text-align:center;width:12%;"></td>
					 <td style="text-align:center;width:12%;"></td>
					 <td style="text-align:center;width:12%;"> </td>
					 <td style="text-align:center;width:15%;"></td>
					 <td style="text-align:center;width:12%;"></td>
					 <td style="text-align:center;width:12%;"> </td>
					  <td style="text-align:center;width:12%;"></td>
					 <%-- <td style="text-align:center;width:10%;">
			<a href="../downloadfile?filename=<%=upl_doc %>&folderName=/AFFILIATION/<%=id%>&fstatus=dwnFileFrmDir"><u><%=upl_doc %></u> </a>
			</td> --%>
					<td style="text-align:center;color:blue;cursor: pointer; width:6%" ><span id="" onClick=""><i class="fa fa-edit"></i>Edit</span></td>
		    <td class="colr-red-p text-center" style="width:6%;color:red;"><span id="" onClick=""><i class="fa fa-trash p-l-3"></i>Delete</span></td>
					
				 </tr> 
				
				 
		 
		
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
		
		       var t = $('#searchTable').DataTable({
		  		"searching" : false,
		  		"lengthMenu": [[-1,10, 25, 50, 100, 250, 500], ['All',10, 25, 50, 100, 250, 500]],
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
				title: '.',
				filename: '',
				className: 'btn btn-view',
				text	:'Download',
				exportOptions: {
				columns: [ 0,1,2,3,4,5,6,7]
				},
				},
				],                      	       	
				columnDefs: [
		     		{ orderable: false, "targets":[0,7,8]}     		
					],
					 }); 
			        t.on( 'order.dt search.dt', function () {
			     	t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			         cell.innerHTML = i+1;
			         t.cell(cell).invalidate('dom');
			     	});
			 	}).draw();
	    </script>   
	  
	  <form name="actionForm" id="actionForm" method="post" action="" target="_parent"> 
	<input type="hidden" id="id" name="id" value="" >
	<input type="hidden" id="fstatus" name="fstatus"  />
	</form>
<body>


</html>