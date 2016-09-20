function require( file )
    local file = fs.combine( "Plexus", Plexus.cleanPath( file:gsub("%.+", "/") ) .. ".lua" )
    if not fs.exists( file ) then
        return error("Failed to require '" .. file .. ". File not found")
    end

    local h = fs.open( file, "r" )
    local c = h.readAll()
    h.close()

    local ok, err = loadstring( c, "required: " .. fs.getName( file ) )
    if not ok then
        error("Failed to load file '"..file.."': " .. err)
    end

    return ok()
end

dofile "Plexus/plexus.lua"
