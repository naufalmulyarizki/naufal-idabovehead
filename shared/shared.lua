Naufal = {
    fn = {},
}

Naufal.fn.input = function(src, title, data)
    return lib.callback.await('ui:ip', src, title, data)
end

lib.callback.register('ui:ip', function(heading, rows, options)
    return lib.inputDialog(heading, rows, options)
end)
