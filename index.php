<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <title>ASDF Home</title>
    <meta charset="utf-8">
  </head>
  <?php
    require_once("./templates/header.php");
    require_once("./db_connect.php");
  ?>
<body>
  <div class="container">
    <h3 class="mb-3 mt-3 text-center">NTUA Databases Semestrial Project 2021</h3>
    <div style="display: flex; justify-content: space-between; max-width: 80%" class="row my-3 mx-auto">
      <div class="col-lg text-center">
        <p class="">Anna Douska</p>
      </div>
      <div class="col-lg text-center">
        <p class="">Odyssefs - Dimitrios Boufalis</p>
      </div>
      <div class="col-lg text-center">
        <p class="">Georgios Stefanakis</p>
      </div>
    </div>

    <img src="assets/monet.jpg" alt="Claude Monet" class="rounded border border-dark mx-auto d-block mb-4 img-fluid" style="width: 700px">
  </div>
</body>
<?php require_once("./templates/footer.php"); ?>
</html>
