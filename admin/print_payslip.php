<?php
include("controller.php");
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HR | Dashboard</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">

  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">

  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">

  <link rel="stylesheet" href="plugins/select2/css/select2.min.css">

  <link rel="stylesheet" href="plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">

  <link rel="stylesheet" href="plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">

<style>
@page { size: auto;  margin: 0mm; }
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>

<div class="row">
  <div class="col-12">
    <table id="example1" class="table table-bordered dataTable no-footer" role="grid" aria-describedby="example1_info">
      <thead>
      <tr>
        <th>Date</th>
        <th>Employee Name</th>
        <th>Deductions</th>
        <th>Net Pay</th>
      </tr>
      </thead>
      <tbody>
      <?php
      ini_set('display_errors', 0);
      ini_set('display_errors', false);

      $s = $_SESSION['start_month'];
      $e = $_SESSION['end_month'];

      $sql = "SELECT *, SUM(deduct_amount) as Deductions FROM salary_deduct";
      $result = mysqli_query($db, $sql);
      $drow = mysqli_fetch_array($result);
      $TotalDeduction = $drow['Deductions'];

      $sqlGross =
      "SELECT *, SUM(attendance_hour) AS Hours, emp_attendance.employee_id AS ID
      FROM emp_attendance
      LEFT JOIN emp_list ON emp_list.emp_card = emp_attendance.employee_id
      LEFT JOIN emp_position ON emp_position.pos_id = emp_list.emp_position
      WHERE attendance_date BETWEEN '$s' AND '$e'
      GROUP BY emp_attendance.employee_id ORDER BY emp_list.emp_lname ASC, emp_list.emp_fname ASC";
      $resultGross = mysqli_query($db, $sqlGross);
      while($rowGross = mysqli_fetch_array($resultGross))
      {
        $GrossPay = $rowGross['position_rate'] * $rowGross['Hours'];
        $NetPay = $GrossPay - $TotalDeduction;

      ?>
      <tr>
        <td><?php echo $s; ?> / <?php echo $e; ?></td>
        <td><?php echo $rowGross['emp_lname']?>, <?php echo $rowGross['emp_fname']?></td>
        <td>₱ <?php echo $TotalDeduction; ?></td>
        <td>₱ <?php echo number_format($GrossPay, 2); ?></td>
      </tr>
      <?php
      }
      ?>
      </tbody>
    </table>
  </div>
</div>

<script src="plugins/jquery/jquery.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="plugins/datatables/jquery.dataTables.js"></script>
<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
<script src="dist/js/adminlte.min.js"></script>
<script src="dist/js/demo.js"></script>
<script src="plugins/select2/js/select2.full.min.js"></script>

<script src="plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>

<script src="plugins/moment/moment.min.js"></script>

<script src="plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>

<script src="plugins/daterangepicker/daterangepicker.js"></script>

<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>

</body>
</html>
