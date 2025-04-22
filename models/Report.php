<?php
require_once './config/db.php';

class Report {
    public static function getAll() {
        global $conn;
        $sql = "SELECT * FROM reports";
        $res = $conn->query($sql);
        $data = [];
        while ($row = $res->fetch_assoc()) {
            $data[] = $row;
        }
        return $data;
    }
}
