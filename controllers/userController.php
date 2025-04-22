<?php
require_once './models/User.php';

function getUsers() {
    $data = User::getAll();
    echo json_encode($data);
}
