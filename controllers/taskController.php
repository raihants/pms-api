<?php
require_once './models/Task.php';

function getTasks() {
    $data = Task::getAll();
    echo json_encode($data);
}
