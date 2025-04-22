<?php
require_once './config/db.php';

class Project {
    public static function getAll() {
        global $conn;
        $sql = "SELECT * FROM projects";
        $res = $conn->query($sql);
        $data = [];
        while ($row = $res->fetch_assoc()) {
            $data[] = $row;
        }
        return $data;
    }
}
