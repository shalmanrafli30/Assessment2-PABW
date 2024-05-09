<?php

class Database {
    private $host = "localhost";
    private $username = "root";
    private $password = "";
    private $database = "desa_tanggap";
    public $conn;

    public function __construct() {
        $this->conn = new mysqli($this->host, $this->username, $this->password, $this->database);
        if ($this->conn->connect_error) {
            die("Koneksi gagal: ". $this->conn->connect_error);
        }
    }
}