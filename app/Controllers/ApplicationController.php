<?php
require_once __DIR__ . '/../Models/Application.php';

class ApplicationController {
    public static function apply() {
        $data = json_decode(file_get_contents('php://input'), true);
        if (!isset($data['job_id'], $data['applicant_name'], $data['applicant_email'])) {
            http_response_code(400);
            echo json_encode(['error' => 'Invalid input']);
            return;
        }
        Application::create($data['job_id'], $data['applicant_name'], $data['applicant_email']);
        echo json_encode(['message' => 'Application submitted']);
    }
}
?>