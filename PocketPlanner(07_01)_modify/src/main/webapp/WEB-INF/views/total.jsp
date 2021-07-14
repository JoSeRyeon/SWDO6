<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" type="text/css" href="/resources/assets/css/bootstrap/css/bootstrap.min.css">

<!-- Required Jquery -->
<script type="text/javascript" src="/resources/assets/js/jquery/jquery.min.js"></script> 
<script type="text/javascript" src="/resources/assets/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/popper.js/popper.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/bootstrap/js/bootstrap.min.js"></script>




<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">


//block:setup:1
const labels = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
];

const data = {
  labels: labels,
  datasets: [{
    label: 'My First dataset',
    backgroundColor: 'rgb(255, 99, 132)',
    borderColor: 'rgb(255, 99, 132)',
    data: [0, 10, 5, 2, 20, 30, 45],
  }]
};
// block:setup

// block:config:0
const config = {
  type: 'line',
  data,
  options: {}
};
// block:config

module.exports = {
  actions: [],
  config: config,
};

var myChart = new Chart(
	    document.getElementById('myChart'),
	    config
	  );

</script>


</head>
<body>

<div>
  <canvas id="myChart"></canvas>
</div>

</body>	

</html>