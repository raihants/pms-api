<?php
$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$uri = explode('/', $uri);
$endpoint = end($uri);

require_once './controllers/userController.php';
require_once './controllers/projectController.php';
require_once './controllers/teamController.php';
require_once './controllers/taskController.php';
require_once './controllers/logController.php';
require_once './controllers/reportController.php';

switch ($endpoint) {
    case 'users': getUsers(); break;
    case 'projects': getProjects(); break;
    case 'teams': getTeams(); break;
    case 'tasks': getTasks(); break;
    case 'logs': getLogs(); break;
    case 'reports': getReports(); break;
    default:
        http_response_code(404);
        echo json_encode(["message" => "Endpoint tidak ditemukan"]);
}
