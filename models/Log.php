<?php
require_once './config/db.php';

class Log {
    public static function getAll() {
        global $conn;
        $sql = "SELECT * FROM logs";
        $res = $conn->query($sql);
        $data = [];
        while ($row = $res->fetch_assoc()) {
            $data[] = $row;
        }
        return $data;
    }
}
