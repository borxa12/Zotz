<?php
    include("../../loader.php");
    loadclasses("view","header.php");
    loadclasses("menus","menuorganizador.html");
    //require_once '../header.php';
    //require_once '../../menus/nomenu.html';
?>
		<form id="registropincho" method="post">
            <div id=templatemo_form>
                <div>
                    <label for="nombrepincho">Nombre</label>
                    <h4>Nombre Pincho</h4>
                    <br></br>
                </div>
                <div>
                    <label for="descripcionpincho">Descripcion</label>
                    <h4>Descripcion Pincho</h4>
                    <br></br>
                </div>
                <div>
                    <label for="ingrdientespincho">Ingredientes</label>
                    <h4>Ingredientes Pincho</h4>
                    <br></br>
                </div>
                <div>
                    <label for="fotopincho">Foto</label>
                    <img src="" alt="image" class="img">
                    <br></br>
                </div>
		    </div>
            <a href="seleccionarFinalistas.php" class="btn btn-default button">Volver</a>
        </form>
        <div class="cleaner"></div>
</div>
</div>
<div class="col-xs-12 col-sm-12 col-md-1"></div>
</div>

<?php loadclasses("view","footer.html"); ?>
