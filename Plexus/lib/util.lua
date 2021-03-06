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
    end,

    round = function (num, idp)
        local mult = 10^(idp or 0)
        return math.floor(num * mult + 0.5) / mult
    end,

    formatSize = function( b )
        local units, unit = {"B", "kB", "MB", "GB"}, 1
        if type( b ) ~= "number" then
            return error "Failed to format size: Argument must be number"
        end

        while not ( b < 100 ) and unit < 4 do
            b, unit = b / 1000, unit + 1
        end
        return util.round( b, 1 ) .. units[ unit ]
    end

}
