<?php
    session_start();
    ob_start();
    include("../../loader.php");
    loadclasses("view","header.php");
    // loadclasses("menus","nomenu.html");
    //require_once '../header.php';
    //require_once '../../menus/nomenu.html';
    loadclasses("controller","ControladorNoRegistrado.php");
    if(isset($_SESSION['tipo'])) {
        switch ($_SESSION['tipo']) {
            case 'org':
                loadclasses("menus","menuorganizador.html");
                break;
            case 'jpop':
                loadclasses("menus","menujuradopopular.html");
                break;
            case 'jpro':
                loadclasses("menus","menujuradoprofesional.html");
                break;
            case 'est':
                loadclasses("menus","menuestablecimiento.html");
                break;
            // default:
            //     loadclasses("menus","nomenu.html");
            //     break;
        }
    } else {
        loadclasses("menus","nomenu.html");
    }
?>

<h1>Lista de pinchos</h1>
<?php
    $pinchos = listarPinchosUltimaEdicion();
    if(mysqli_num_rows($pinchos) == 0) {
        echo '<h4>Aínda non se rexistraron pinchos :(</h4>';
    } else {
        while($r = mysqli_fetch_assoc($pinchos)) {
            // $r = recuperarDatosEstablecimiento($f['establecimiento_usuarios_login']);
            // $r = mysqli_fetch_array($res);
            echo "<div class='product_box'>";
                echo "<a href='' class='pirobox'><img src='../../img/pinchos/".$r['fotopincho']."' alt='image' class='img'/></a>";
                echo "<h4>".$r['nombrepincho']."</h4>";
                // echo "<p>".$r['direccion']."</p>";
                echo "<p>Establecimiento: ";
                        $est = recuperarDatosEstablecimiento($r['establecimiento_usuarios_login']);
                        echo $est['nombre'];
                echo "</p>";
                echo "<p>Precio: ".$r['precio']."</p>";
                echo "<form name='btnverpincho' method='post' action='./datospincho.php?pincho=".$r['idpincho']."'>";
                    echo "<button name='btnverpincho' type='submit' class='btn btn-default button'>Ver</button>";
                    // if(isset($_POST['btnverpincho'])) {
                    //     header("Location: ./datospincho.php?pincho=".$r['idpincho']);
                    // }
                echo "</form>";
            echo "</div>";

        }
    }

?>

</div>
</div>
</div>
<div class="col-xs-12 col-sm-12 col-md-1"></div>

<?php loadclasses("view","footer.html"); ?>
