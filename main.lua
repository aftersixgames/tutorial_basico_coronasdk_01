local physics = require("physics")
physics.start()

local largura = display.contentWidth
local altura = display.contentHeight

local circulo = display.newCircle( 0, 0, 40)
circulo.x = largura * .5
circulo.y = altura * .5 

local chao = display.newRect( 0, altura - 10, largura, 10 )

local function toque()
	return math.random( 255 ),math.random( 255 ),math.random( 255 )
end

local changeColor = function()
	circulo:setFillColor( unpack({toque()}) )
end

local function onCollision(event)
		if (event.phase == "began") then
			changeColor()
		end
end

physics.addBody( circulo,{bounce=1} )
physics.addBody( chao, "static" )
circulo:addEventListener( "tap", changeColor )

Runtime:addEventListener( "collision", onCollision )


