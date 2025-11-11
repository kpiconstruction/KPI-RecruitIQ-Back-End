<?php
require_once __DIR__ . '/../Controllers/JobsController.php';
require_once __DIR__ . '/../Controllers/ApplicationController.php';
require_once __DIR__ . '/../Controllers/DocumentController.php';

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

if ($uri === '/api/jobs' && $_SERVER['REQUEST_METHOD'] === 'GET') {
    JobsController::getJobs();
} elseif ($uri === '/api/apply' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    ApplicationController::apply();
} elseif ($uri === '/api/upload-documents' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    DocumentController::upload();
} else {
    http_response_code(404);
    echo json_encode(['error' => 'Not Found']);
}
?>