<?php
// Koneksi ke database
$koneksi = new mysqli("localhost", "root", "", "desa_tanggap");
if ($koneksi->connect_error) {
    die("Koneksi gagal: " . $koneksi->connect_error);
}

// Periksa apakah ID diterima
if (isset($_POST['id'])) {
    $id = $_POST['id'];
    
    // Query untuk menghapus data berdasarkan ID
    $query = "DELETE FROM berita WHERE id_berita = $id";
    
    // Jalankan query
    if ($koneksi->query($query) === TRUE) {
        echo "Data berhasil dihapus";
    } else {
        echo "Error: " . $koneksi->error;
    }
} else {
    echo "ID tidak diterima";
}

// Tutup koneksi ke database
$koneksi->close();