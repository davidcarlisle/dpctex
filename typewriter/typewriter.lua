-- Use local functions
local getmacro = token.get_macro
local sp = tex.sp
local definefont = tex.definefont
local define_font = luaotfload.define_font
local getfont = font.getfont
local nextid = font.nextid
local setfont = font.setfont
local random, rad = math.random, math.rad
local cos, sin = math.cos, math.sin
local pdfprint = pdf.print
local format = string.format
local insert = table.insert

-- set the options
local ttgreybolda       = tonumber(getmacro("ttgreybolda"))       or 0.6
local ttgreyboldb       = tonumber(getmacro("ttgreyboldb"))       or 0.3
local ttrotatebold      = tonumber(getmacro("ttrotatebold"))      or 12
local ttdownbold        = tonumber(getmacro("ttdownbold"))        or 20000
local ttrightbold       = tonumber(getmacro("ttrightbold"))       or 35000
local ttoverprintbolda  = tonumber(getmacro("ttoverprintbolda"))  or 1
local ttoverprintboldb  = tonumber(getmacro("ttoverprintboldb"))  or 1
local ttoverprintboldc  = tonumber(getmacro("ttoverprintboldc"))  or 1

local ttgreynormala     = tonumber(getmacro("ttgreynormala"))     or 0.3
local ttgreynormalb     = tonumber(getmacro("ttgreynormalb"))     or 0.5
local ttrotatenormal    = tonumber(getmacro("ttrotatenormal"))    or 10
local ttrightnormal     = tonumber(getmacro("ttrightnormal"))     or 20000
local ttdownnormal      = tonumber(getmacro("ttdownnormal"))      or 20000
local ttoverprintnormal = tonumber(getmacro("ttoverprintnormal")) or 1

local ttbasefont        = getmacro("ttgreybolda") or "cmuntt.otf"
local ttfontsize        = getmacro("ttgreybolda") and sp(getmacro("ttgreybolda")) or sp("12pt")

-- load the data of the base font. If the id is not passed to luaotfload.define_font
-- as the third argument, the new id is the return value, otherwise
-- the font data is returned.

local base_id = define_font("file:" .. ttbasefont, ttfontsize)

-- define \cmuntt as a font selction macro for the
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
            insert(cmd, {'down', random(ttdownnormal, ttdownnormal)})
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

local function define_tt_font(name, csname, size, bold)
    local f = getfont(base_id)
    f.name = name
    f.type = 'virtual'
    f.fonts = {{ name = "file:"..ttbasefont, size = size}}
    if bold then
        define_bold_tt_font(f.characters)
    else
        define_normal_tt_font(f.characters)
    end
    local id = nextid(true)
    setfont(id, f)
    definefont(csname, id)
end

define_tt_font("cmtt10x", "myfont", sp('12pt'), false)
define_tt_font("cmtt10x", "myfonts", sp('9pt'), false)
define_tt_font("cmtt10bx", "mybfont", sp('12pt'), true)
define_tt_font("cmtt10bx", "mybfonts", sp('9pt'), true)

