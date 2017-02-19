resource.AddWorkshop("709718950");

resource.AddSingleFile( "materials/pam_d_printers/icons/cpu.png" );
resource.AddSingleFile( "materials/pam_d_printers/icons/gpu.png" );
resource.AddSingleFile( "materials/pam_d_printers/icons/motherboard.png" );
resource.AddSingleFile( "materials/pam_d_printers/icons/ram.png" );
resource.AddSingleFile( "materials/pam_d_printers/icons/ssd.png" );

resource.AddSingleFile( "materials/pam_d_printers/icons/light_cpu.png" );
resource.AddSingleFile( "materials/pam_d_printers/icons/light_gpu.png" );
resource.AddSingleFile( "materials/pam_d_printers/icons/light_motherboard.png" );
resource.AddSingleFile( "materials/pam_d_printers/icons/light_ram.png" );
resource.AddSingleFile( "materials/pam_d_printers/icons/light_ssd.png" );

util.AddNetworkString( "desktopPrinter_SwitchTheme" );
util.AddNetworkString( "desktopPrinter_SendTheme" );

net.Receive( "desktopPrinter_SwitchTheme", function( len, ply )

	ply.desktopPrinter_Theme = net.ReadInt(8);

end)

hook.Add("PlayerInitialSpawn", "desktopPrinter_PlayerInitialSpawn", function( ply )

	 timer.Simple( 1, function()
		desktopPrinter_SQL_PlayerExists( ply );
    end)
	
	timer.Simple( 1.5, function() -- make sure it have a lot of time to find the players data, they wont open it that fast anyway lol
	
		net.Start( "desktopPrinter_SendTheme" );
			net.WriteInt( ply.desktopPrinter_Theme or 1, 8 );
		net.Send( ply );
		
	end)
	
end)

hook.Add("PlayerDisconnected", "desktopPrinter_PlayerDisconnected", function( ply )

  desktopPrinter_SQL_SavePlauer( ply );

end)

function desktopPrinter_SQL_TablesExist()

  if ( !sql.TableExists("pam_desktopprinter") ) then

    local query = "CREATE TABLE pam_desktopprinter ( sid varchar(255), theme int )";
    sql.Query(query);

  end

end

function desktopPrinter_SQL_PlayerExists( ply )

  if ( !IsValid(ply) ) then return false; end

  local result = sql.Query("SELECT theme FROM pam_desktopprinter WHERE sid = '"..ply:SteamID64().."'" );

  if ( result ) then

	desktopPrinter_SQL_RetrieveData( ply );

  else

    desktopPrinter_SQL_NewPlayer( ply );

  end

end

function desktopPrinter_SQL_RetrieveData( ply )

  if ( !IsValid(ply) ) then return false; end

  local theme = sql.QueryValue( "SELECT theme FROM pam_desktopprinter WHERE sid = '"..ply:SteamID64().."'" );

  ply.desktopPrinter_Theme = theme or 1;

end

function desktopPrinter_SQL_SavePlauer( ply )

  local theme = ply.desktopPrinter_Theme or 1;

  sql.Query(" pam_desktopprinter SET theme = "..theme.." WHERE sid = '"..ply:SteamID64().."'" );

end

function desktopPrinter_SQL_NewPlayer( ply )

  if ( !IsValid(ply) ) then return false; end

  sql.Query( "INSERT INTO pam_desktopprinter ('sid', 'theme') VALUES ('"..ply:SteamID64().."', '1') " );

  local result = sql.Query( "SELECT theme FROM pam_desktopprinter WHERE sid = '"..ply:SteamID64().."'" );

  ply.desktopPrinter_Theme = 1;

end

hook.Add("Initialize", "desktopPrinter_SQL_Initialize", function()

  desktopPrinter_SQL_TablesExist();

end);
