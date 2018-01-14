<head>
<meta charset="utf-8">
<title>Bluepixel</title>
<meta name="viewport" content="width=device-width">

<link rel="icon" href="favicon.ico" type="image/x-icon"/>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>


<!-- Styles -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/animate.css">
<link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


<link rel="stylesheet" href="css/materialize.min.css">
<link rel="stylesheet" href="css/custom-styles.css">

<script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>

<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/pace.min.js"></script>


    <style>

        .pace {
            -webkit-pointer-events: none;
            pointer-events: none;

            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
            -webkit-animation-name: fadeOut;
            animation-name: fadeOut;
        }

        .pace-inactive {
            display: none;
        }

        .pace .pace-progress {
            background: #26a69a;
            position: fixed;
            z-index: 2000;
            top: 0;
            right: 100%;
            width: 100%;
            height: 2px;
        }

        @-webkit-keyframes fadeIn {
            0% {opacity: 0;}
            100% {opacity: 1;}
        }

        @-moz-keyframes fadeIn {
            0% {opacity: 0;}
            100% {opacity: 1;}
        }

        @-o-keyframes fadeIn {
            0% {opacity: 0;}
            100% {opacity: 1;}
        }

        @keyframes fadeIn {
            0% {opacity: 0;}
            100% {opacity: 1;}
        }

        .fadeIn {
            -webkit-animation-name: fadeIn;
            -moz-animation-name: fadeIn;
            -o-animation-name: fadeIn;
            animation-name: fadeIn;
        }


        body.pace-running #pagina {
            opacity: 0;
        }
        body.pace-done #pagina {
            opacity: 1;
            -webkit-animation-name: fadeIn;
            animation-name: fadeIn;
            -webkit-animation-duration: 2s;animation-duration: 2s;
            -webkit-animation-fill-mode: both;animation-fill-mode: both;
        }
        }
    </style>


</head>
