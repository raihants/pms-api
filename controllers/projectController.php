<?php
require_once './models/Project.php';

function getProjects() {
    $data = Project::getAll();
    echo json_encode($data);
}
