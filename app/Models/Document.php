<?php
class Document {
    public static function create($application_id, $file_path) {
        $pdo = new PDO('mysql:host=' . getenv('DB_HOST') . ';dbname=' . getenv('DB_NAME'), getenv('DB_USER'), getenv('DB_PASS'));
        $stmt = $pdo->prepare('INSERT INTO documents (application_id, file_path) VALUES (?, ?)');
        $stmt->execute([$application_id, $file_path]);
    }
}
?>