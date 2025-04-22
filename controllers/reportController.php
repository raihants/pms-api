<?php
require_once './models/Report.php';

function getReports() {
    $data = Report::getAll();
    echo json_encode($data);
}
