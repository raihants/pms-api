<?php
require_once './config/db.php';

class User {
    public static function getAll() {
        global $conn;
        $sql = "SELECT * FROM users";
        $res = $conn->query($sql);
        $data = [];
        while ($row = $res->fetch_assoc()) {
            $data[] = $row;
        }
        return $data;
    }
}
