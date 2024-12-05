# Naufal Id Above Player

Id Above Player QBCORE/QBX or ESX

# Features 
- Id Above Player Custom 

# Installation
- Add Resource core (esx or qb)
- Add Resource library ox lib

# Shared settings

```lua
Naufal = {
    fn = {},
}

Naufal.fn.input = function(src, title, data)
    return lib.callback.await('ui:ip', src, title, data)
end

lib.callback.register('ui:ip', function(heading, rows, options)
    return lib.inputDialog(heading, rows, options)
end)    
```

## Previews 

![previewoxlib](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/previewcontet.png)
![previewingame](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/previewingame.png)

## Previews Resmon Client Side

![previewresmonside](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/resmonsideidabovbehead.png)

# Dependencies

- [qb-core](https://github.com/qbcore-framework/qb-core) -- if using qbcore
- [qbx_core](https://github.com/Qbox-project/qbx_core) -- if using qbx
- [esx](https://github.com/esx-framework/esx_core) -- if using esx
- [ox_lib](https://github.com/overextended/ox_lib)

# Export

```lua
    -- state : true/false
    exports['naufal-idabovehead']:toggleIdKepala(state)
```

# Config Tambahan Buat Kamu Show Id Ketika Buka Kantong Pada OX Inventory

1. Cari code ``if inv == 'trunk' then``
2. Taruh di atasnya code diatas dengan code ``exports['naufal-idabovehead']:toggleIdKepala(true)``
3. Selanjutnya cari code function ``client.closeInventory``
4. Taruh di paling bawah dengan code ``exports['naufal-idabovehead']:toggleIdKepala(false)``

![previewoxlib](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/previewidaboveheadinventory.png)

# Github Star History

[![Star History Chart](https://api.star-history.com/svg?repos=naufalmulyarizki/naufal-idabovehead&type=Date)](https://star-history.com/#naufalmulyarizki/naufal-idabovehead&Date)