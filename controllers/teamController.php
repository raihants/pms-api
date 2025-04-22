<?php
require_once './models/Team.php';

function getTeams() {
    $data = Team::getAll();
    echo json_encode($data);
}
