<?php 
$c = new mysqli("db", "root", "rootpass", "cybervault"); 
if (isset($_POST['username'])) { 
    $u = $_POST['username']; 
    $p = $_POST['password']; 
    // VULNERABLE ON PURPOSE: 
    $q = "SELECT * FROM users WHERE username='$u' AND password='$p'"; 
    $r = $c->query($q); 
    if ($r && $r->num_rows > 0) { 
        echo "<h3>Welcome, admin. Internal notes:</h3>"; 
        foreach ($c->query("SELECT note FROM secrets") as $row) 
            echo "<pre>" . htmlspecialchars($row['note']) . "</pre>"; 
    } else { 
        echo "<p>Invalid credentials.</p>"; 
    } 
} 
?> 
<form method="post"> 
    <input name="username" placeholder="username"> 
    <input name="password" type="password" placeholder="password"> 
    <button>Log in</button> 
</form>