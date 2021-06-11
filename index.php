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

<div class="container-md">
  <h3 class="mb-3 mt-3 text-center">NTUA Databases Semestrial Project 2021</h3>
  <div class="row mx-auto mb-3 pt-3" style="width: 55%">
    <p class="col text-start"><b>Anna Douska</b></p>
    <p class="col align-center" ><b>Odyssefs - Dimitrios Boufalis</b></p>
    <p class="col text-end"><b>Georgios Stefanakis</b></p>
  </div>

<img src="assets/monet.jpg" alt="Claude Monet" class="border border-dark" style="width:60%; height:60%; display:block; margin-left: auto; margin-right: auto;">
</div>



  <?php session_start(); ?>
  <?php require_once("./templates/footer.php"); ?>
</html>
