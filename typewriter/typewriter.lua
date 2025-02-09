-- Lua code for LaTeX typewriter.sty
-- 2025-02-08
--

-- Use local functions
local getmacro = token.get_macro
local sp = tex.sp
local definefont = tex.definefont
local define_font = luaotfload.define_font
local getfont = font.getfont
local nextid = font.nextid
local setfont = font.setfont
local random, rad = math.random, math.rad
local cos, sin, floor = math.cos, math.sin, math.floor
local pdfprint = pdf.print
local format = string.format
local insert = table.insert

-- set the options
local ttgreybolda       = getmacro("ttgreybolda")       and tonumber(getmacro("ttgreybolda"))       or 0.6
local ttgreyboldb       = getmacro("ttgreyboldb")       and tonumber(getmacro("ttgreyboldb"))       or 0.3
local ttrotatebold      = getmacro("ttrotatebold")      and tonumber(getmacro("ttrotatebold"))      or 12
local ttdownbold        = getmacro("ttdownbold")        and tonumber(getmacro("ttdownbold"))        or 20000
local ttrightbold       = getmacro("ttrightbold")       and tonumber(getmacro("ttrightbold"))       or 35000
local ttoverprintbolda  = getmacro("ttoverprintbolda")  and tonumber(getmacro("ttoverprintbolda"))  or 1
local ttoverprintboldb  = getmacro("ttoverprintboldb")  and tonumber(getmacro("ttoverprintboldb"))  or 1
local ttoverprintboldc  = getmacro("ttoverprintboldc")  and tonumber(getmacro("ttoverprintboldc"))  or 1

local ttgreynormala     = getmacro("ttgreynormala")     and tonumber(getmacro("ttgreynormala"))     or 0.3
local ttgreynormalb     = getmacro("ttgreynormalb")     and tonumber(getmacro("ttgreynormalb"))     or 0.5
local ttrotatenormal    = getmacro("ttrotatenormal")    and tonumber(getmacro("ttrotatenormal"))    or 10
local ttrightnormal     = getmacro("ttrightnormal")     and tonumber(getmacro("ttrightnormal"))     or 20000
local ttdownnormal      = getmacro("ttdownnormal")      and tonumber(getmacro("ttdownnormal"))      or 20000
local ttoverprintnormal = getmacro("ttoverprintnormal") and tonumber(getmacro("ttoverprintnormal")) or 1

local ttbasefont        = getmacro("ttbasefont") or "cmuntt.otf"
local ttmathfont        = getmacro("ttmathfont") or ttbasefont
local ttfontsize        = getmacro("ttfontsize") and sp(getmacro("ttfontsize")) or sp("12pt")

-- load the data of the base font. If the id is not passed to luaotfload.define_font
-- as the third argument, the new id is the return value, otherwise
-- the font data is returned.

local base_id = define_font("file:" .. ttbasefont, ttfontsize)
local base_math_id
if ttbasefont == ttmathfont then
  base_math_id = base_id
else
  base_math_id = define_font("file:" .. ttmathfont, ttfontsize)
end

-- define \cmuntt as a font selection macro for the
-- base font, and set the base font as the current 
-- active font

definefont("cmuntt", base_id)
font.current(base_id)

-- Some helper functions

local function rotate(num)
    local r = rad(0.1*num*random(-10,10))
    pdfprint(format(" q %f %f %f %f 0 0 cm ",
             cos(r), - sin(r), sin(r), cos(r)))
end

local function define_normal_tt_font(characters)
    for j,v in pairs(characters) do
        local greynormala = ttgreynormala*random()
        local greynormalb = ttgreynormalb*random()
        local cmd = {}
        cmd = {
            {'lua', function() rotate(ttrotatenormal) end},
            {'pdf', ' ' .. greynormala .. ' g'},
            {'push'},
            {'right', random(-ttrightnormal, ttrightnormal)},
            {'down', random(-ttdownnormal, ttdownnormal)},
            {'char',j},
            {'pop'},
            {'lua', function() pdfprint(" Q ") end}
        }
            
        if ttoverprintnormal == 1 then
            insert(cmd, {'down', random(-ttdownnormal, ttdownnormal)})
            insert(cmd, {'pdf', ' ' .. greynormalb .. ' g'})
            insert(cmd, {'char',j})
            insert(cmd, {'pdf', ' 0 g'})
        end
        v.commands = cmd
    end
end

local function define_bold_tt_font(characters)
    for j, v in pairs(characters) do
        local greybolda = ttgreybolda*random()
        local greyboldb = ttgreyboldb*random()
        local cmd = {}
        cmd = {
            {'lua', function() rotate(ttrotatebold) end},
            {'pdf', ' ' .. format("%f", greybolda) .. ' g'},
            {'push'},
            {'right', random(-ttrightbold, ttrightbold)},
            {'down', random(-ttdownbold, ttdownbold)},
            {'char',j},
            {'pop'},
            {'lua', function() pdfprint(" Q ") end}
        }
        
        if ttoverprintbolda == 1 then
            insert(cmd, {'push'})
            insert(cmd, {'right', random(-ttrightbold, ttrightbold)})
            insert(cmd, {'down', random(-ttdownbold, ttdownbold)})
            insert(cmd, {'char',j})
            insert(cmd, {'pop'})
        end
        
        if ttoverprintboldb == 1 then
            insert(cmd, {'push'})
            insert(cmd, {'right', random(-ttrightbold, ttrightbold)})
            insert(cmd, {'down', random(-ttdownbold, ttdownbold)})
            insert(cmd, {'char',j})
            insert(cmd, {'pop'})
            insert(cmd, {'push'})
            insert(cmd, {'down', random(-ttdownbold, ttdownbold)})
            insert(cmd, {'pdf', ' ' .. format("%f", greyboldb) .. ' g'})
            insert(cmd, {'char',j})
            insert(cmd, {'pdf', ' 0 g'})
            insert(cmd, {'pop'})
        end
        v.commands = cmd
    end
end

-- Now the main function

local function define_tt_font(baseid, basename, name, csname, size, bold)
    local f = getfont(baseid)
    f.name = name
    f.type = 'virtual'
    f.fonts = {{ name = "file:"..basename, size = size}}
    if bold then
        define_bold_tt_font(f.characters)
    else
        define_normal_tt_font(f.characters)
    end
    local id = nextid(true)
    setfont(id, f)
    definefont(csname, id)
end

define_tt_font(base_id, ttbasefont, "cmtt10x", "myfont", ttfontsize, false)
define_tt_font(base_math_id, ttmathfont, "cmtt10mx", "mymfont", ttfontsize, false)
define_tt_font(base_math_id, ttmathfont, "cmtt10mx", "mymfonts", floor(0.75*ttfontsize), false)
define_tt_font(base_id, ttbasefont, "cmtt10bx", "mybfont", ttfontsize, true)
define_tt_font(base_math_id, ttmathfont, "cmtt10mbx", "mymbfont", ttfontsize, true)
define_tt_font(base_math_id, ttmathfont, "cmtt10mbx", "mymbfonts", floor(0.75*ttfontsize), true)

