<?php
    require_once '../header.php';
    require_once '../../menus/nomenu.html';
?>
	
			<div id="contenido" class="col-xs-12 col-sm-9 col-md-9">
                <h1>Registro</h1>
                <form id="registroestablecimiento" method="post">
                    <div id=templatemo_form>
                        <div>
                            <label for="loginjuradoprofesional">Login</label>
                            <input type="text" id="loginjuradoprofesional" />
                            <br></br>
                        </div>
                        <div>
                            <label for="emailjuradoprofesional">Email</label>
                            <input type="text" id="emailjuradoprofesional" />
                            <br></br>
                        </div>
                        <div>
                            <label for="passwordjuradoprofesional">Password</label>
                            <input type="password" id="passwordjuradoprofesional" />
                            <br></br>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-default button">Darse de alta</button>
                </form>
            
                <div class="cleaner"></div>

	<div class="col-xs-12 col-sm-12 col-md-1"></div>
	</div>
<?php   require_once '../footer.php'; ?>