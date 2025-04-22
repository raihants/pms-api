<?php
require_once './config/db.php';

class Task {
    public static function getAll() {
        global $conn;
        $sql = "SELECT * FROM tasks";
        $res = $conn->query($sql);
        $data = [];
        while ($row = $res->fetch_assoc()) {
            $data[] = $row;
        }
        return $data;
    }
}
