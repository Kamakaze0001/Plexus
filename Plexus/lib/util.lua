return {
    getMaxLength = function( t, keyName )
        if type( t ) ~= "table" then
            return error( "Failed to get max length of '"..tostring( t ).."'. Unsupported type" )
        end

        local len
        if keyName then
            for k, v in pairs( t ) do len = math.max( v[ keyName ] or 0, len ) end
        else
            for i = 1, #t do len = math.max( #t[ i ], len ) end
        end

        return len
    end
}