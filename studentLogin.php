<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login</title>
</head>
<style>
    form{
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
        height: fit-content;
        width: 500px;
        border: 1px solid black;
    }
</style>
<body>
    <form method="post">
        <div>
            <label for="id_input">Student ID</label>
            <input name="id_input" type="text" placeholder="ST_23112345">
        </div>
        <div>
            <label for="username_input">Username</label>
            <input name="username_input" type="text" placeholder="Student123">
        </div>
        <div>
            <label for="password_input">Password</label>
            <input name="password_input" type="password" placeholder="Enter 8 characters or more">
        </div>
    </form>
</body>
</html>
<?php

?>