<?php
require_once './models/Log.php';

function getLogs() {
    $data = Log::getAll();
    echo json_encode($data);
}
