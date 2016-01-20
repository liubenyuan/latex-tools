----------------------------------------------------------------------
-- set DPI ipelet
----------------------------------------------------------------------

label = "Set DPI"

about = [[
Set DPI
]]

function run(model)
  local str = model:getString("Enter DPI")
  if not str or str:match("^%s*$") then return end
  local resolution = tonumber(str)
  model.ui:setZoom(resolution / 72.0)
end 

---------------------------------------------------------------------- 
