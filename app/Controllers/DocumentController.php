<?php
require_once __DIR__ . '/../Models/Document.php';

class DocumentController {
    public static function upload() {
        if (!isset($_FILES['document']) || !isset($_POST['application_id'])) {
            http_response_code(400);
            echo json_encode(['error' => 'Invalid input']);
            return;
        }
        $targetDir = __DIR__ . '/../../uploads/';
        if (!file_exists($targetDir)) {
            mkdir($targetDir, 0777, true);
        }
        $filePath = $targetDir . basename($_FILES['document']['name']);
        move_uploaded_file($_FILES['document']['tmp_name'], $filePath);
        Document::create($_POST['application_id'], $filePath);
        echo json_encode(['message' => 'Document uploaded']);
    }
}
?>