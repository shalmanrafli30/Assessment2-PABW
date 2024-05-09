<?php
require_once(realpath(dirname(__FILE__) . './database.php'));
class berita extends Database {
    public function getAllberita(){
        $query = "SELECT * FROM berita ORDER BY id_berita ASC";
        $result = $this->conn->query($query);
        $data = []; 

        if ($result->num_rows > 0){
            while ($row = $result->fetch_object()){
                $data[] = $row;
            }
        }
        return json_encode($data);
    }
}

$function = new berita();
$berita = $function->getAllberita();
echo $berita;