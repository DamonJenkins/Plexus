return {
    getMaxLength = function( t, keyName )
        if type( t ) ~= "table" then
            return error( "Failed to get max length of '"..tostring( t ).."'. Unsupported type" )
        end

        local len = 0
        if keyName then
            for k, v in pairs( t ) do len = math.max( #v[ keyName ] or 0, len ) end
        else
            for i = 1, #t do len = math.max( #t[ i ], len ) end
        end

        return len
    end,

    isInTable = function( t, k, o )
        for i = o or 1, #t do
            if t[ i ] == k then
                return true
            end
        end

        return false
    end,

    truncateString = function( s, l )
        local over = #s - l
        if over <= 0 then return s
        elseif l <= 3 then return ("..."):sub( 1, l ) end


        return s:sub( 1, math.max( math.floor( ( #s / 2 ) - 2 - ( over / 2 ) ), 0 ) ) .. "..." .. s:sub( math.ceil( ( #s / 2 ) + 2 + ( over / 2 ) ) )
    end

}
