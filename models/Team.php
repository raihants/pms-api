<?php
require_once './config/db.php';

class Team {
    public static function getAll() {
        global $conn;
        $sql = "SELECT * FROM teams";
        $res = $conn->query($sql);
        $data = [];
        while ($row = $res->fetch_assoc()) {
            $data[] = $row;
        }
        return $data;
    }
}
