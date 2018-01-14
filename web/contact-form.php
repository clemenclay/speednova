<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
require_once 'phpmailer/PHPMailerAutoload.php';

if (isset($_POST['inputName']) && isset($_POST['inputEmail']) && isset($_POST['inputSubject']) && isset($_POST['inputMessage'])) {

    //check if any of the inputs are empty
    if (empty($_POST['inputName']) || empty($_POST['inputEmail']) || empty($_POST['inputSubject']) || empty($_POST['inputMessage'])) {
        $data = array('success' => false, 'message' => 'Por favor rellene el siguiente formulario completamente.');
        echo json_encode($data);
        exit;
    }

    //create an instance of PHPMailer
    $mail = new PHPMailer();

    $mail->From = $_POST['inputEmail'];
    $mail->FromName = $_POST['inputName'];
    $mail->AddAddress('clemenclay@gmail.com'); //recipient 
    $mail->Subject = $_POST['inputSubject'];
    $mail->Body = "E-mail: " . $_POST['inputEmail'] . "\r\n\r\nNombre: " . $_POST['inputName'] . "\r\n\r\nMensaje: " . stripslashes($_POST['inputMessage']);

    if (isset($_POST['ref'])) {
        $mail->Body .= "\r\n\r\nRef: " . $_POST['ref'];
    }

    if(!$mail->send()) {
        $data = array('success' => false, 'message' => 'El mensaje no pudo ser enviado. Mailer Error:' . $mail->ErrorInfo);
        echo json_encode($data);
        exit;
    }

    $data = array('success' => true, 'message' => 'Gracias! Hemos recibido su mensaje.');
    echo json_encode($data);

} else {

    $data = array('success' => false, 'message' => 'Por favor rellene el siguiente formulario completamente.');
    echo json_encode($data);

}