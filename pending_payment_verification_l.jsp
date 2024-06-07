 <%@page import="com.sits.affiliation.transaction.pending_payment_verification.PendingPaymentVerificationManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sits.affiliation.transaction.pending_payment_verification.PendingPaymentVerificationModel"%>
<%@include file="../myCks.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta  name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Expires" content="-1" />
  <title></title>
  
	<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script src="../resources/js/jquery-3.2.1.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="../resources/css/datepicker/datepicker3.css"  type="text/css">
	<script type="text/javascript" src="../resources/js/datepicker/bootstrap-datepicker.js"></script>
	
	<link href="../resources/css/themes/blue.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/hrm-fym.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/themes/responsive.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="../resources/sits/DataTable/1.10.15/css/dataTables.bootstrap.css" rel="stylesheet"> 
		
		<script type="text/javascript" src="../resources/js/aes/AesUtil.js"></script>
	<script type="text/javascript" src="../resources/js/aes/crypto.js"></script>
	<script type="text/javascript" src="../resources/js/affiliation/pending-payment-verification.js"></script>
	<script type="text/javascript" src="../resources/js/common/common.js"></script>
	<script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
	<script type="text/javascript" src="../resources/js/common/validations.js"></script>
	<script type="text/javascript" src="../resources/js/common/gen.js"></script>

	<link href="../resources/sits/DataTable/1.10.15/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
</head>

<body>

<form id="doubleVerfication" name="doubleVerfication"  method="post" >
<div id="searchingTable1" class="scr0" style="padding-bottom: 30px;">

	<div class="page-header-1">
		<div class="col-sm-4 repTitle h5">Payment Status</div>
		<div class="col-sm-4 repTitle h6 text-center">Run Date : <%= (new java.util.Date().toLocaleString()) %></div>
	</div>

	<table id="searchTable" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
   		<thead>
    		<tr>
      			<th class="text-center">Select</th>
      			<th class="text-center">Sr No.</th>
       			<th class="text-center">Registration No</th>
       			<%if(General.checknull(request.getParameter("type")).equals("R")){ %>
       				<th class="text-center">Proposed Institute Name</th>
       				<th class="text-center">Chairman/ Chief/ Trustee/ MD Name</th>
       			<%}else{ %>
       				<th class="text-center">Request Name</th>
       				<th class="text-center">Sub Request Name</th>
       			<%} %>
		       	<th class="text-center">Merchant Order No</th>
			   	<th class="text-center">Date and Time</th>
			   	<th class="text-center">Payment Status</th>
			    <th class="text-center">Message</th>
	    	</tr>
	    </thead>
	    <tbody>
	    <%
	    String fdate="", tdate="", reg_no="", type="",payment_status="";
	    
	    fdate=General.checknull(request.getParameter("XFROMDATE"));
	    tdate=General.checknull(request.getParameter("XTODATE"));
	    reg_no=General.checknull(request.getParameter("regno"));
	    type=General.checknull(request.getParameter("type"));
	    payment_status=General.checknull(request.getParameter("payment_status"));
	    
	    PendingPaymentVerificationModel model = new PendingPaymentVerificationModel();
	    
	    model.setXFROMDATE(fdate);
	    model.setXTODATE(tdate);
	    model.setRegno(reg_no);
	    model.setType(type);
	    model.setPayment_status(payment_status);
	    
	    ArrayList<PendingPaymentVerificationModel> arrayList = new ArrayList<PendingPaymentVerificationModel>();
	    arrayList=PendingPaymentVerificationManager.getList(model);
	    int i=0;
	    if(arrayList.size()>0){
	    	for(PendingPaymentVerificationModel htm: arrayList){
	    		i++;
	    %>
	    <tr>
	    	<td  class="text-center" style="width:10%;">
	    	<%if(htm.getStatus().equals("paid")){%>
	    		<input  type="radio" id="radioB" name="radioB" disabled>									   
			<%}else{%>
				<input type="radio" id="radioB" name="radioB" value="<%=htm.getMerchantorderno()+","+htm.getToDate()+","+htm.getTranId()+","+htm.getPaymenttype()%>">
			<%}%>
	    	
	    	</td>
	     	<td style="text-align:center;width:10%;"><%=i%></td>
			<td style="text-align:center;width:10%;"><%=htm.getRegno()%></td>
			<td style="text-align:center;width:10%;"><%=htm.getSname()%></td>
			<td style="text-align:center;width:10%;"><%=htm.getStudentCategoryName()%></td>
			<td style="text-align:center;width:10%;"><%=htm.getMerchantorderno()%></td>
			<td style="text-align:center;width:15%;"><%=htm.getDate()%></td> 
			<td style="text-align:center;width:10%;"><%=htm.getStatus()%></td>
			<td style="text-align:center;width:10%;"><%=htm.getMsg()%></td>
	    </tr>
		<%}} %>
		</tbody>
	</table>
    <input type="hidden" id="AESKey" value="<%= session.getAttribute("AESUniqueKey")%>"/>
    <div class="col-sm-12">
		<div class="row text-center">
			<div class="errmessage1" id="errMsg"></div>
		</div>
	</div>
	<div class="col-sm-12">
		<div class="row text-center">
			<div class="errmessage2" id="errMsg1"></div>
		</div>
	</div>  	
    <div class="form-group m-t-20" style="padding-bottom: 30px;" >
		<div class="col-md-12 text-center" >
			<div class="row">
				<button id="btnSave" type="button" class="btn btn-view" >Send Request</button>
 			</div>
 		</div>
 	</div>
</div>

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
		"lengthMenu": [ [-1], ["All"] ],
		//"scrollY": "350px",
        "scrollX": true,
        "scrollCollapse": true,
        "paging":true,
		"columnDefs": [ {
        	"searchable": false,
        	"orderable": false,
        	"targets": 0
        } ],
        "order": [[ 1, 'asc' ]],
        
     	dom :"<'row'<'col-sm-4 text-left'.h5><'col-sm-4 text-center'.h6> <'col-sm-4 text-right'B>>" +
			"<'row'<'col-sm-6'l><'col-sm-6 text-right' >>" +
   			"<'row'<'col-sm-12'tr>>" +
   			"<'row'<'col-sm-5'i><'col-sm-7'p>>", 
		
		buttons: [  
   		 { filename: 'Pending_Payment_Verification',title:'Pending Payment Verification',
   		   messageTop: 'Date and Time: <%= (new java.util.Date().toLocaleString()) %>',height:'20', width:'20', 
   		  /*  className: 'btn btn-view',text :'Download Pdf', */
   		   exportOptions: { columns: [ 1,2,3,4,5,6,7] },
   		  
		   pageSize: 'A4',   
		   customize: function(doc) {
		        
			   doc.styles.title = {
                       color: '#000000',
                       fontSize: '20',
                       alignment: 'center'
                   }
                   
                   doc.styles.tableHeader = {
                       fillColor:'#2d4154',
                       color:'white',
                       alignment:'center'
                   },

			      /* this line changes the alignment of 'messageBottom' and 'messageTop' */
		        doc.styles.message.alignment = "right";
		        
		        doc.layout = 'lightHorizotalLines;'
             doc.pageMargins = [10, 10, 20, 20];
             doc.defaultStyle.fontSize = 10;
             doc.styles.tableHeader.fontSize = 10;
             doc.styles.title.fontSize = 14;  
               doc.content[2].table.widths = [ '5%', '20%','15%', '15%','15%','15%','15%'];
                //doc.content[2].table.margin = [100,100,100,100];
                 var rowCount = doc.content[2].table.body.length;
                
                  for (i = 0; i < rowCount; i++) {
                	  doc.content[2].layout = {
                              hLineWidth: function(i, node) {
                                  return (i === 0 || i === node.table.body.length) ? 2 : 1;},
                              vLineWidth: function(i, node) {
                                  return (i === 0 || i === node.table.widths.length) ? 2 : 1;},
                              hLineColor: function(i, node) {
                                  return (i === 0 || i === node.table.body.length) ? 'black' : 'gray';},
                              vLineColor: function(i, node) {
                                  return (i === 0 || i === node.table.widths.length) ? 'black' : 'gray';}
                              }	
                  doc.content[2].table.body[i][0].alignment = 'center';
                  doc.content[2].table.body[i][1].alignment = 'center';
                  doc.content[2].table.body[i][2].alignment = 'center';
                  doc.content[2].table.body[i][3].alignment = 'center';
                  doc.content[2].table.body[i][4].alignment = 'center';
                  doc.content[2].table.body[i][5].alignment = 'center';
                  doc.content[2].table.body[i][6].alignment = 'center';
};
             
             doc.styles.title.fontSize = 20;
             
		   },
		 
		 },
   		 
            { extend: 'excel', className: 'btn btn-view',text :'Download Excel',filename: 'Pending_Payment_Verification',title:'Pending Payment Verification',
   		   exportOptions: { columns: [ 1,2,3,4,5,6,7] },
            }
   		],
	    
		columnDefs: [
			{ orderable: false, "targets": 0},
			{ orderable: false, "targets": 1},
			{ orderable: false, "targets": 2},
			{ orderable: false, "targets": 3},
			{ orderable: false, "targets": 4},
			{ orderable: false, "targets": 5},
			{ orderable: false, "targets": 6},
			{ orderable: false, "targets": 7},
		],
    });
	
    t.on( 'order.dt search.dt', function () {
        t.column(1, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
            t.cell(cell).invalidate('dom');
        });
    }).draw();
});

</script>
</form>
</body>
</html>
	