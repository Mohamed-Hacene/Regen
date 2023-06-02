VMenu = {
    keys = {172, 173, 174, 175, 176, 177},
	top = 0.07,
	left = 0.03,
	width = 0.20,
	itemsOnScreen = 10,
	HeaderDict = "fivemenu",
	rootMenu = 1,
	visible = false,
    curVar = 0,
	curItem = 1,
    curColor = 1,
	scroll = 0,
    scrollX = 0,
	closedTime = 0,
	offsetY = 0.028,
	HdHeight = 0,
	BgHeight = 0.314,
	menus = {},
	items = {},
}

VOpts = {
	toUpdate = nil,
	LastVeh = 0,
	openMenu = false
}

weapon_img = {
   -- ['WEAPON_MACHETE'] = {},  
    ['WEAPON_GOLFCLUB'] = {
                        ['base'] = {'mpweaponsunusedfornow','w_me_gclub_silhouette'},
                        },  
   -- ['WEAPON_KNUCKLE'] = {}  
    ['WEAPON_KNIFE'] = {
                        ['base'] = {'mpweaponsunusedfornow','w_me_knife_silhouette'},
                        },  
    --['WEAPON_DAGGER'] = {},  
    --['WEAPON_FLASHLIGHT'] = {},  
    ['WEAPON_CROWBAR'] = {
                        ['base'] = {'mpweaponsunusedfornow','w_me_crowbar_silhouette'},
                        },  
    ['WEAPON_BAT'] = {
                        ['base'] = {'mpweaponsunusedfornow','w_me_bat_silhouette'},
                        }, 
    --['WEAPON_BOTTLE'] = {},
    ['WEAPON_HAMMER'] = {
                        ['base'] = {'mpweaponsunusedfornow','w_me_hammer_silhouette'},
                        },
    ['WEAPON_Pistol'] = {
                        ['base'] = {'mpweaponsgang1','w_pi_pistol_silhouette_overlay'},
                        ['acc'] = {['COMPONENT_PISTOL_CLIP_01'] = 'w_pi_pistol_mag1_silhouette',
                                   ['COMPONENT_PISTOL_CLIP_02'] = 'w_pi_pistol_mag2_silhouette',
                                   ['COMPONENT_AT_PI_SUPP_02'] = 'w_pi_pistol_supp_silhouette',
                                   ['COMPONENT_AT_PI_FLSH'] = 'w_pi_pistol_flash_silhouette'
                                }
                        },
    --['WEAPON_PISTOL50'] = {},
    --['WEAPON_SNSPistol'] = {},
    --['WEAPON_HeavyPistol'] = {},
    --['WEAPON_Revolver'] = {},
    ['WEAPON_SmokeGrenade'] = {
                        ['base'] = {'mpweaponscommon','w_ex_grenadesmoke_silhouette'},
                        },
    ['WEAPON_PumpShotgun'] = {
                        ['base'] = {'mpweaponscommon','w_sg_pumpshotgun_silhouette _overlay'},
                        ['acc'] = {['COMPONENT_AT_AR_FLSH'] ='w_sg_pumpshotgun_flash_silhouette',
                                   ['COMPONENT_AT_SR_SUPP'] ='w_sg_pumpshotgun_supp_silhouette',
                                   }
                        },
    --['WEAPON_DoubleBarrelShotgun'] = {},
    ['WEAPON_MicroSMG'] = {
                        ['base'] = {'mpweaponscommon','w_sb_microsmg_silhouette_overlay'},
                        ['acc'] = {['COMPONENT_AT_PI_FLSH'] = 'w_sb_microsmg_flash_silhouette',
                                   ['COMPONENT_MICROSMG_CLIP_01'] = 'w_sb_microsmg_mag1_silhouette',
                                   ['COMPONENT_MICROSMG_CLIP_02'] = 'w_sb_microsmg_mag2_silhouette',
                                   ['COMPONENT_AT_SCOPE_MACRO'] = 'w_sb_microsmg_scope_silhouette',
                                   ['COMPONENT_AT_AR_SUPP_02'] = 'w_sb_microsmg_supp_silhouette',
                                  }
                        },
    ['WEAPON_SMG'] = {
                        ['base'] = {'mpweaponsgang0','w_sb_smg_silhouette_overlay'},
                        ['acc'] = {['COMPONENT_AT_AR_FLSH'] = 'w_sb_smg_flash_silhouette',
                                   ['COMPONENT_SMG_CLIP_01'] = 'w_sb_smg_mag1_silhouette',
                                   ['COMPONENT_SMG_CLIP_02'] = 'w_sb_smg_mag2_silhouette',
                                   ['COMPONENT_SMG_CLIP_03'] = '',
                                   ['COMPONENT_AT_SCOPE_MACRO_02'] = 'w_sb_smg_scope_silhouette',
                                   ['COMPONENT_AT_PI_SUPP'] = 'w_sb_smg_supp_silhouette',
                                   ['COMPONENT_SMG_CLIP_03'] = '',
                                   }
                        },
    --['WEAPON_AssaultSMG'] = {},
    ['WEAPON_AssaultRifle'] = {
                        ['base'] = {'mpweaponsgang1','w_ar_assaultrifle_silhouette_overlay'},
                        ['acc'] = {['COMPONENT_ASSAULTRIFLE_CLIP_01'] = 'w_ar_assaultrifle_mag1_silhouette',
                                   ['COMPONENT_ASSAULTRIFLE_CLIP_02'] = 'w_ar_assaultrifle_mag2_silhouette',
                                   ['COMPONENT_ASSAULTRIFLE_CLIP_03'] = '',
                                   ['COMPONENT_AT_AR_SUPP_02'] = 'w_ar_assaultrifle_supp_silhouette',
                                   ['COMPONENT_AT_AR_FLSH'] = 'w_ar_assaultrifle_flash_silhouette',
                                   ['COMPONENT_AT_AR_AFGRIP'] = 'w_ar_assaultrifle_grip_silhouette',
                                   ['COMPONENT_AT_SCOPE_MACRO'] = 'w_ar_assaultrifle_scope_silhouette',
                                   }
                        },
    ['WEAPON_CarbineRifle'] = {
                        ['base'] = {'mpweaponsgang0','w_ar_carbinerifle_silhouette_overlay'},
                        ['acc'] = {['COMPONENT_CARBINERIFLE_CLIP_01'] = 'w_ar_carbinerifle_mag1_silhouette',
                                   ['COMPONENT_CARBINERIFLE_CLIP_02'] = 'w_ar_carbinerifle_mag2_silhouette', 
                                   ['COMPONENT_CARBINERIFLE_CLIP_03'] = '', 
                                   ['COMPONENT_AT_AR_SUPP'] = 'w_ar_carbinerifle_supp_silhouette', 
                                   ['COMPONENT_AT_AR_FLSH'] = 'w_ar_carbinerifle_flash_silhouette', 
                                   ['COMPONENT_AT_AR_AFGRIP'] = 'w_ar_carbinerifle_grip_silhouette', 
                                   ['COMPONENT_AT_SCOPE_MEDIUM'] = 'w_ar_carbinerifle_scope_silhouette', 
                                  }
                        },
    ['WEAPON_SniperRifle'] = {
                        ['base'] = {'mpweaponsgang0','w_sr_sniperrifle_silhouette_overlay'},
                        ['acc'] = {['COMPONENT_AT_SCOPE_LARGE'] = 'w_sr_sniperrifle_scope_large_silhouette',
                                   ['COMPONENT_AT_SCOPE_MAX'] = 'w_sr_sniperrifle_scope_silhouette',
                                   ['COMPONENT_AT_AR_SUPP_02'] = 'w_sr_sniperrifle_supp_silhouette',
                                  }
                        },
    ['WEAPON_STUNGUN'] = {
                        ['base'] = {'mpweaponsgang0','w_pi_stungun_silhouette'},
                        },
    ['WEAPON_NIGHTSTICK'] = {
                        ['base'] = {'mpweaponsunusedfornow','w_me_nightstick_silhouette'},
                        },
}
--------- FIN DÉCLARATION

VMenu.ctop = ((VMenu.width / 2.25) / 2) + VMenu.top
VMenu.cleft = (VMenu.width / 2) + VMenu.left
VMenu.TextX = VMenu.left + 0.007
VMenu.BgY = VMenu.top + VMenu.HdHeight + (VMenu.BgHeight / 2)

function VMenu.DrawText(Text, X, Y, ScX, ScY, Font, Outline, Shadow, Center, RightJustify, R, G, B, A)
	SetTextFont(Font)
	SetTextScale(ScX, ScY)
	SetTextColour(R, G, B, A)
	if Outline then
		SetTextOutline()
	end
	if Shadow then
		SetTextDropShadow()
	end
	SetTextCentre(Center)
    if RightJustify then
        SetTextWrap(0.1,X)
        SetTextRightJustify(RightJustify)
    end
	SetTextEntry("STRING")
	AddTextComponentString(Text)
	DrawText(X, Y)
end
function VMenu.DrawHeader(td)
	local header = VMenu.menus.header
	local prenom = VMenu.menus.prenom
	if header ~= nil then
		VMenu.HdHeight = (VMenu.width / 2.25)
		VMenu.ctop = ((VMenu.width / 2.25) / 2) + VMenu.top
        DrawSprite(td, string.lower(header), VMenu.cleft, VMenu.ctop, VMenu.width, VMenu.width / 2.25, 0.0, 255, 255, 255, 255)
	else
		VMenu.HdHeight = 0
		VMenu.ctop = VMenu.top
	end
    if prenom ~= nil then
       VMenu.DrawText(prenom, VMenu.cleft, VMenu.ctop - 0.026, 1.0,1.0, 1, false, false, true, false, 0, 0, 0, 255)
    end
end
function VMenu.DrawBg(td)
	local numItems = #VMenu.items
	if numItems > VMenu.itemsOnScreen then numItems = VMenu.itemsOnScreen end
	VMenu.BgHeight = numItems * VMenu.offsetY + 0.035
	VMenu.BgY = VMenu.top + VMenu.HdHeight + (VMenu.BgHeight / 2)
	DrawSprite(td, "gradient_bgd", VMenu.cleft, VMenu.BgY , VMenu.width, VMenu.BgHeight, 0.0, 255, 255, 255, 255)
end

function comma_value(n)
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1 '):reverse())..right
end

function VMenu.DrawItems(td)
	local curItem = VMenu.curItem
	local numItems = #VMenu.items
	local menuTitle = VMenu.menus.name
	local count = tostring(curItem) .. "/" .. tostring(numItems)
	local footerY = VMenu.BgY + (VMenu.BgHeight / 2)

	DrawRect(VMenu.cleft,  VMenu.top + VMenu.HdHeight + 0.015,VMenu.width,0.03, 0,0,0,255);
	VMenu.DrawText(menuTitle, VMenu.TextX, VMenu.top + VMenu.HdHeight + 0.001 , 0.36, 0.36, 8, false, false, false, false, VMenu.menus.r, VMenu.menus.g, VMenu.menus.b, 255)
	VMenu.DrawText(count, (VMenu.left + VMenu.width) - 0.005, VMenu.top + VMenu.HdHeight + 0.001, 0.36, 0.36, 8, false, false, false, true, VMenu.menus.r, VMenu.menus.g, VMenu.menus.b, 255)
    
	for i = 1 + VMenu.scroll, numItems do
		if i > VMenu.itemsOnScreen + VMenu.scroll then
			break
		end

		local itemTitle = VMenu.items[i].name
		local itemDesc = VMenu.items[i].desc
        
		if VMenu.items[i].type == "separator" then
			VMenu.DrawText("- "..itemTitle.." -", VMenu.left + (VMenu.width / 2), VMenu.top + VMenu.HdHeight + 0.030 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.4, 0.4, 6, false, false, true, false, 255, 255, 255, 255)
		elseif i == curItem then
			DrawSprite(td, "gradient_nav", VMenu.cleft, VMenu.top + VMenu.HdHeight + 0.044 + (VMenu.offsetY * (i-1-VMenu.scroll)), VMenu.width, VMenu.offsetY, 0.0, 255, 255, 255, 255)
			VMenu.DrawText(itemTitle, VMenu.TextX, VMenu.top + VMenu.HdHeight + 0.032 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.3, 0.3, 8, false, false, false, false, 0, 0, 0, 255)

			if itemDesc ~= "" and itemDesc ~= nil then
				DrawSprite(td, "gradient_bgd", VMenu.cleft, footerY + 0.045, VMenu.width, 0.030, 0.0, 255, 255, 255, 120)
				VMenu.DrawText(itemDesc, VMenu.TextX, footerY + 0.032, 0.3, 0.33, 8, false, false, false, false, 255, 255, 255, 220)
			end

		else
			VMenu.DrawText(itemTitle, VMenu.TextX, VMenu.top + VMenu.HdHeight + 0.032 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.3, 0.3, 8, false, false, false, false, 255, 255, 255, 255)
		end
        
		if VMenu.items[i].type == "bool" then
			local sprite = "shop_box_blank"
			local varname = VMenu.items[i].varname
			if VOpts[varname] then sprite = "shop_box_tick" end
			if i == curItem then sprite = sprite.."b" end

			DrawSprite(td, sprite, (VMenu.left + VMenu.width) - 0.02, VMenu.top + VMenu.HdHeight + 0.044 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.02, 0.04, 0.0, 255, 255, 255, 200)
		end
		if VMenu.items[i].type == "num" then
			local left =  "arrowleft"
			local right = "arrowright"
			local varname = VMenu.items[i].varname
			local c = 255
			if i == curItem then
				c = 0
				left = left.."b"
				right = right.."b"
			end

			DrawSprite(td, left, (VMenu.left + VMenu.width) - 0.03, VMenu.top + VMenu.HdHeight + 0.044 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.01, 0.02, 0.0, 255, 255, 255, 200)
			DrawSprite(td, right, (VMenu.left + VMenu.width) - 0.01, VMenu.top + VMenu.HdHeight + 0.044 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.01, 0.02, 0.0, 255, 255, 255, 200)
			VMenu.DrawText(tostring(VOpts[varname][1]), (VMenu.left + VMenu.width) - 0.02, VMenu.top + VMenu.HdHeight + 0.030 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.10, 0.33, 8, false, false, true, false, c, c, c, 255)
		end
        
		if VMenu.items[i].type == "numcoef" then
			local left =  "arrowleft"
			local right = "arrowright"
			local varname = VMenu.items[i].varname
			local c = 255
			if i == curItem then
				c = 0
				left = left.."b"
				right = right.."b"
			end

			DrawSprite(td, left, (VMenu.left + VMenu.width) - 0.06, VMenu.top + VMenu.HdHeight + 0.044 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.01, 0.02, 0.0, 255, 255, 255, 200)
			DrawSprite(td, right, (VMenu.left + VMenu.width) - 0.01, VMenu.top + VMenu.HdHeight + 0.044 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.01, 0.02, 0.0, 255, 255, 255, 200)
			VMenu.DrawText(tostring(VOpts[varname][1]), (VMenu.left + VMenu.width) - 0.035, VMenu.top + VMenu.HdHeight + 0.030 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.10, 0.33, 8, false, false, true, false, c, c, c, 255)
		end
        if VMenu.items[i].type == "choix" then
			local left =  "arrowleft"
			local right = "arrowright"
			local varname = VMenu.items[i].varname
            local espacement = 0.02
            if VMenu.items[i].espacement ~= nil then
                espacement = VMenu.items[i].espacement
            end
            local choix = VMenu.items[i].choix
			local c = 255
			if i == curItem then
				c = 0
				left = left.."b"
				right = right.."b"
			end

			DrawSprite(td, left, (VMenu.left + VMenu.width) - 0.005 - espacement, VMenu.top + VMenu.HdHeight + 0.044 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.01, 0.02, 0.0, 255, 255, 255, 200)
			DrawSprite(td, right, (VMenu.left + VMenu.width) - 0.005, VMenu.top + VMenu.HdHeight + 0.044 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.01, 0.02, 0.0, 255, 255, 255, 200)
			VMenu.DrawText(tostring(choix[VOpts[varname]]), (VMenu.left + VMenu.width) - 0.005 -espacement/2, VMenu.top + VMenu.HdHeight + 0.030 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.10, 0.33, 8, false, false, true, false, c, c, c, 255)
		end
		if VMenu.items[i].type == "num1000" then
			local left =  "arrowleft"
			local right = "arrowright"
			local varname = VMenu.items[i].varname
			local c = 255
			if i == curItem then
				c = 0
				left = left.."b"
				right = right.."b"
			end

			DrawSprite(td, left, (VMenu.left + VMenu.width) - 0.03, VMenu.top + VMenu.HdHeight + 0.044 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.01, 0.02, 0.0, 255, 255, 255, 200)
			DrawSprite(td, right, (VMenu.left + VMenu.width) - 0.01, VMenu.top + VMenu.HdHeight + 0.044 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.01, 0.02, 0.0, 255, 255, 255, 200)
			VMenu.DrawText(tostring(VOpts[varname][1]), (VMenu.left + VMenu.width) - 0.02, VMenu.top + VMenu.HdHeight + 0.030 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.10, 0.33, 8, false, false, true, false, c, c, c, 255)
		end
		if VMenu.items[i].type == "valsub" then
			local varname = VMenu.items[i].varname
			local c = 255
			if i == curItem then
				c = 0
			end
			VMenu.DrawText("$"..tostring(VOpts[varname]), (VMenu.left + VMenu.width) - 0.02, VMenu.top + VMenu.HdHeight + 0.030 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.10, 0.33, 8, false, false, true, false, c, c, c, 255)
		end
        if VMenu.items[i].prix ~= nil and VMenu.items[i].prix ~= "" then
			local prix = VMenu.items[i].prix
			local c = 255
			if i == curItem then
				c = 0
			end
            if prix == 0 then
               VMenu.DrawText("Gratuit", (VMenu.left + VMenu.width) - 0.005, VMenu.top + VMenu.HdHeight + 0.030 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.10, 0.33, 8, false, false, true, true, c, c, c, 255)
            elseif prix == -1 then
                VMenu.DrawText("Équipé", (VMenu.left + VMenu.width) - 0.005, VMenu.top + VMenu.HdHeight + 0.030 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.10, 0.33, 8, false, false, true, true, c, c, c, 255)
            else
                VMenu.DrawText("$"..comma_value(tostring(prix)), (VMenu.left + VMenu.width) - 0.005, VMenu.top + VMenu.HdHeight + 0.030 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.10, 0.33, 8, false, false, true, true, c, c, c, 255)
            end
		end
        if VMenu.items[i].poids ~= nil and VMenu.items[i].poids ~= "" then
			local poids = VMenu.items[i].poids
			local c = 255
			if i == curItem then
				c = 0
			end
            VMenu.DrawText(comma_value(poids).."kg", (VMenu.left + VMenu.width) - 0.005, VMenu.top + VMenu.HdHeight + 0.030 + (VMenu.offsetY * (i-1-VMenu.scroll)), 0.10, 0.33, 8, false, false, true, true, c, c, c, 255)
		end
        if VMenu.items[i].type == "color" then
            if i == curItem and VMenu.items[i].color ~= nil then
                local numColor = #VMenu.items[i].color
                local listColor = VMenu.items[i].color
                local tablecolor = VMenu.items[i].color 
                DrawSprite(td, "gradient_bgd", VMenu.cleft, footerY + 0.055 + (VMenu.width/10), VMenu.width, 0.065 + VMenu.width/10 , 0.0, 255, 255, 255, 255)
                if VMenu.items[i].namecolor ~= nil and VMenu.items[i].namecolor ~= "" then
                    local titrecolor = VMenu.items[i].namecolor.." ("..VMenu.curColor.."/"..numColor..")"
                    DrawSprite(td, "arrowleft", VMenu.left + 0.03, footerY + 0.05, 0.01, 0.02, 0.0, 255, 255, 255, 200)
			        DrawSprite(td, "arrowright", VMenu.left + VMenu.width - 0.03, footerY + 0.05, 0.01, 0.02, 0.0, 255, 255, 255, 200)
			        VMenu.DrawText(titrecolor, VMenu.left + (VMenu.width / 2), footerY + 0.035, 0.4, 0.4, 6, false, false, true, false, 255, 255, 255, 255)
                end
                for x = 1 + VMenu.scrollX, numColor do
                    local Color = listColor[x]
                    if x > 10 + VMenu.scrollX then
                        break
                    end
                    if x == VMenu.curColor then
                        DrawSprite(td, "color_select", VMenu.left + VMenu.width/20 + (VMenu.width/10 * (x - 1 - VMenu.scrollX)), footerY + 0.09 - VMenu.width/10 - VMenu.width/80, VMenu.width/10, (VMenu.width/10)/3, 0.0, 255, 255, 255, 255)
                    end
                    DrawRect(VMenu.left + VMenu.width/20 + (VMenu.width/10 * (x - 1 - VMenu.scrollX)), footerY + 0.09,  VMenu.width/10, VMenu.width/10*1.8,Color[1],Color[2],Color[3], 255)
                end
            end
        end
        if VMenu.items[i].type == "var" then
            if i == curItem and VMenu.items[i].color ~= nil then
                local numColor = #VMenu.items[i].color
                local listColor = VMenu.items[i].color
                local tablecolor = VMenu.items[i].color 
                DrawSprite(td, "gradient_bgd", VMenu.cleft, footerY + 0.055 + (VMenu.width/10), VMenu.width, 0.065 + VMenu.width/10 , 0.0, 255, 255, 255, 255)
                if VMenu.items[i].namecolor ~= nil and VMenu.items[i].namecolor ~= "" then
                    local titrecolor = VMenu.items[i].namecolor.." ("..VMenu.curColor.."/"..numColor..")"
                    DrawSprite(td, "arrowleft", VMenu.left + 0.03, footerY + 0.05, 0.01, 0.02, 0.0, 255, 255, 255, 200)
			        DrawSprite(td, "arrowright", VMenu.left + VMenu.width - 0.03, footerY + 0.05, 0.01, 0.02, 0.0, 255, 255, 255, 200)
			        VMenu.DrawText(titrecolor, VMenu.left + (VMenu.width / 2), footerY + 0.035, 0.4, 0.4, 6, false, false, true, false, 255, 255, 255, 255)
                end
                for x = 1 + VMenu.scrollX, numColor do
                    local Color = listColor[x]
                    if x > 10 + VMenu.scrollX then
                        break
                    end
                    if x == VMenu.curColor then
                        DrawSprite(td, "color_select", VMenu.left + VMenu.width/20 + (VMenu.width/10 * (x - 1 - VMenu.scrollX)), footerY + 0.09 - VMenu.width/10 - VMenu.width/80, VMenu.width/10, (VMenu.width/10)/3, 0.0, 255, 255, 255, 255)
                    end
                    if x < (1 + VMenu.scrollX) then
                        DrawRect(VMenu.left + VMenu.width/10 + (VMenu.width/10 * (x - 1 - VMenu.scrollX)), footerY + 0.09,  0.001, VMenu.width/10*1.8,255,255,255, 255)
                    end
                    if x == VMenu.curColor then
                        VMenu.DrawText(tostring(Color), VMenu.left + VMenu.width/20 + (VMenu.width/10 * (x - 1 - VMenu.scrollX)), footerY + 0.075, 0.4, 0.4, 6, false, false, true, false, 112, 198, 0, 255)
                    else
                        VMenu.DrawText(tostring(Color), VMenu.left + VMenu.width/20 + (VMenu.width/10 * (x - 1 - VMenu.scrollX)), footerY + 0.075, 0.4, 0.4, 6, false, false, true, false, 255, 255, 255, 255)
                    end
                end
            end
        end
         --Affichage Weapon
        if VMenu.items[i].hash ~= nil and i == curItem then
            local Hash = VMenu.items[i].hash
            local Accs = VMenu.items[i].acc
            if weapon_img[Hash] ~= nil then
                local file = weapon_img[Hash]['base'][1]
                if not HasStreamedTextureDictLoaded(file) then
                    RequestStreamedTextureDict(file, true)
                    while not HasStreamedTextureDictLoaded(file) do
                     Wait(1)
                    end
                end
                DrawRect(VMenu.left + (VMenu.width / 2), footerY + 0.1,0.2,0.13, 0,0,0,195)
                VMenu.DrawText("- Accessoires -", VMenu.left + (VMenu.width / 2), footerY + 0.035, 0.4, 0.4, 6, false, false, true, false, 255, 255, 255, 255)
                DrawSprite(file,weapon_img[Hash]['base'][2], VMenu.left + (VMenu.width / 2), footerY + 0.11, 0.1, 0.1, 0.0, 255, 255, 255, 255)
                --Affichage si l'accessoire est équipé
                for _,acc in pairs(Accs) do
                    DrawSprite(file,weapon_img[Hash]['acc'][acc], VMenu.left + (VMenu.width / 2), footerY + 0.11, 0.1, 0.1, 0.0, 255, 0, 0, 255)
                end
                --Vérification affichage
                --[[
                if weapon_img[Hash]['acc'] ~= nil then
                    for _,acc in pairs(weapon_img[Hash]['acc']) do
                        if acc ~= '' then
                            DrawSprite(file,acc, VMenu.left + (VMenu.width / 2), footerY + 0.11, 0.1, 0.1, 0.0, 255, 0, 0, 255)
                        end
                    end
                end
                ]]
            end
        end
	end
	DrawRect(VMenu.cleft, footerY + 0.011, VMenu.width, 0.025, 0, 0, 0, 255)
	DrawSprite(td, "shop_arrows_upanddown", VMenu.cleft, footerY + 0.010, 0.018, 0.03, 0.0, 255, 255, 255, 255)
end

function VMenu.Show()
end

Citizen.CreateThread(function()
    local BoucleLent = 100
    local BoucleRapide = 5
    local Pause = BoucleLent
    while true do
        Wait(Pause)
        Pause = BoucleLent
        if VMenu.visible then
            Pause = BoucleRapide
            local td = VMenu.HeaderDict
            if not HasStreamedTextureDictLoaded(td) then
                RequestStreamedTextureDict(td, true)
                while not HasStreamedTextureDictLoaded(td) do
                    Wait(10)
                end
            end
            VMenu.DrawHeader(td)
            VMenu.DrawBg(td)
            VMenu.DrawItems(td)
        end
    end
end)

function scrollAdjust()
	if #VMenu.items > VMenu.itemsOnScreen then
		if VMenu.curItem < math.floor((VMenu.itemsOnScreen) / 2) + 1  then
			VMenu.scroll = 0
		end
		if VMenu.curItem >= math.floor((VMenu.itemsOnScreen) / 2) + 5 then
			VMenu.scroll = VMenu.curItem - (math.floor((VMenu.itemsOnScreen) / 2) + 5)
		end
		if VMenu.scroll + VMenu.itemsOnScreen >= #VMenu.items then
			VMenu.scroll = #VMenu.items - VMenu.itemsOnScreen
		end
	else
		VMenu.scroll = 0
	end
end

function VMenu.k_down()
	VMenu.curItem = VMenu.curItem + 1;
	if VMenu.curItem > #VMenu.items then
		VMenu.curItem = 1
	end
	local infinite = 0
	while VMenu.items[VMenu.curItem].type == "separator" do
		VMenu.curItem = VMenu.curItem + 1;
		if VMenu.curItem > #VMenu.items then
			VMenu.curItem = 1
			infinite = infinite + 1
			if infinite == 2 then
				break
			end
		end
	end
	PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	if #VMenu.items > VMenu.itemsOnScreen then
        if VMenu.curItem > VMenu.scroll + VMenu.itemsOnScreen or VMenu.curItem < VMenu.scroll then
            if VMenu.curItem < VMenu.itemsOnScreen  then
                VMenu.scroll = 0
            end
            if VMenu.curItem > VMenu.itemsOnScreen then
                VMenu.scroll = VMenu.scroll + 1
            end
        end
	else
		VMenu.scroll = 0
	end
    if (VMenu.items[VMenu.curItem].type == "color" or VMenu.items[VMenu.curItem].type == "var") and VMenu.items[VMenu.curItem].color ~= nil then
        if VMenu.curColor > #VMenu.items[VMenu.curItem].color then
            VMenu.curColor = 1
            VMenu.scrollX = 0
        end
    end
    if UpdateSkin_down then
        UpdateSkin_down()
    end
end

function VMenu.k_up()
	VMenu.curItem = VMenu.curItem - 1;
	if VMenu.curItem < 1 then
		VMenu.curItem = #VMenu.items
	end
	local infinite = 0
	while VMenu.items[VMenu.curItem].type == "separator" do
		VMenu.curItem = VMenu.curItem - 1;
		if VMenu.curItem < 1 then
			VMenu.curItem = #VMenu.items
			infinite = infinite + 1
			if infinite == 2 then
				break
	        end
		end
	end
	PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	if #VMenu.items > VMenu.itemsOnScreen then
        if VMenu.curItem >= VMenu.scroll + VMenu.itemsOnScreen or VMenu.curItem <= VMenu.scroll then
            if VMenu.curItem >= math.floor((VMenu.itemsOnScreen) / 2) -4 then
                VMenu.scroll = VMenu.curItem - (math.floor((VMenu.itemsOnScreen) / 2) -4)
            end
            if VMenu.scroll + VMenu.itemsOnScreen >= #VMenu.items then
                VMenu.scroll = #VMenu.items - VMenu.itemsOnScreen
            end
        end
	else
		VMenu.scroll = 0
	end
     if (VMenu.items[VMenu.curItem].type == "color" or VMenu.items[VMenu.curItem].type == "var") and VMenu.items[VMenu.curItem].color ~= nil then
        if VMenu.curColor > #VMenu.items[VMenu.curItem].color then
            VMenu.curColor = 1
            VMenu.scrollX = 0
        end
    end    
    if UpdateSkin_up then
        UpdateSkin_up()
    end
end

function VMenu.k_left()
	if VMenu.items[VMenu.curItem].type == "num" then
		local varname = VMenu.items[VMenu.curItem].varname
		VOpts[varname][1] = VOpts[varname][1] - 1
		if VOpts[varname][1] < VOpts[varname][2] then VOpts[varname][1] = VOpts[varname][3] end
		VOpts['toUpdate'] = varname
		PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	end
    
	if VMenu.items[VMenu.curItem].type == "numcoef" then
		local varname = VMenu.items[VMenu.curItem].varname
        local lien = VMenu.items[VMenu.curItem].lien
        local coef = VMenu.items[lien]['choix'][VOpts["Coef"]]
        VOpts[varname][1] = VOpts[varname][1] - 1* coef
		if VOpts[varname][1] < VOpts[varname][2] then VOpts[varname][1] = VOpts[varname][3] end
		VOpts['toUpdate'] = varname
		PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	end
	if VMenu.items[VMenu.curItem].type == "num1000" then
		local varname = VMenu.items[VMenu.curItem].varname
		VOpts[varname][1] = VOpts[varname][1] - 1000
		if VOpts[varname][1] < VOpts[varname][2] then VOpts[varname][1] = VOpts[varname][3] end
		VOpts['toUpdate'] = varname
		PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	end
    if VMenu.items[VMenu.curItem].type == "choix" then
		local varname = VMenu.items[VMenu.curItem].varname
        local choix = VMenu.items[VMenu.curItem].choix
		VOpts[varname] = VOpts[varname] - 1
        if VOpts[varname] < 0 then VOpts[varname] = #choix end
		PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	end
    if (VMenu.items[VMenu.curItem].type == "color" or VMenu.items[VMenu.curItem].type == "var") and VMenu.items[VMenu.curItem].color ~= nil then --défilement vers la gauche
        VMenu.curColor = VMenu.curColor -1
        local nbcolor = #VMenu.items[VMenu.curItem].color
        if VMenu.curColor < 1 then
            VMenu.curColor = nbcolor
	    end
		if nbcolor > 10 then
            if VMenu.curColor >= VMenu.scrollX + 10 or VMenu.curColor <= VMenu.scrollX then
                if VMenu.curColor >= math.floor((10) / 2) -4 then
                    VMenu.scrollX = VMenu.curColor - (math.floor((10) / 2) -4)
                end
                if VMenu.scrollX + 10 >= nbcolor then
                    VMenu.scrollX = nbcolor - 10
                end
            end
        else
            VMenu.scrollX = 0
        end
	end
    if UpdateSkin_left then
        UpdateSkin_left()
    end
end

function VMenu.k_right()
    if VMenu.curItem ~= nil then
        if VMenu.items[VMenu.curItem].type == "num" then
            local varname = VMenu.items[VMenu.curItem].varname
            VOpts[varname][1] = VOpts[varname][1] + 1
            if VOpts[varname][1] > VOpts[varname][3] then VOpts[varname][1] = VOpts[varname][2] end
            VOpts['toUpdate'] = varname
            PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
        end
        if VMenu.items[VMenu.curItem].type == "numcoef" then
            local varname = VMenu.items[VMenu.curItem].varname
            local lien = VMenu.items[VMenu.curItem].lien
            local coef = VMenu.items[lien]['choix'][VOpts["Coef"]]
            VOpts[varname][1] = VOpts[varname][1] + 1* coef
            if VOpts[varname][1] > VOpts[varname][3] then VOpts[varname][1] = VOpts[varname][2] end
            VOpts['toUpdate'] = varname
            PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
        end

        if VMenu.items[VMenu.curItem].type == "choix" then
            local varname = VMenu.items[VMenu.curItem].varname
            local choix = VMenu.items[VMenu.curItem].choix
            VOpts[varname] = VOpts[varname] + 1
            if VOpts[varname] > #choix then VOpts[varname] = 1 end
            PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
        end
        if VMenu.items[VMenu.curItem].type == "num1000" then
            local varname = VMenu.items[VMenu.curItem].varname
            VOpts[varname][1] = VOpts[varname][1] + 1000
            if VOpts[varname][1] > VOpts[varname][3] then VOpts[varname][1] = VOpts[varname][2] end
            VOpts['toUpdate'] = varname
            PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
        end
        if (VMenu.items[VMenu.curItem].type == "color" or VMenu.items[VMenu.curItem].type == "var") then --défilement vers la gauche
            VMenu.curColor = VMenu.curColor + 1
            local nbcolor = #VMenu.items[VMenu.curItem].color
            if VMenu.curColor > nbcolor then
                VMenu.curColor = 1
            end
            if nbcolor > 10 then
                if VMenu.curColor > VMenu.scrollX + 10 or VMenu.curColor < VMenu.scrollX then
                    if VMenu.curColor < 10  then
                        VMenu.scrollX = 0
                    end
                    if VMenu.curColor > 10 then
                        VMenu.scrollX = VMenu.scrollX + 1
                    end
                end
            else
                VMenu.scrollX = 0
            end
        end
        if UpdateSkin_right then
            UpdateSkin_right()
        end
    end
end

function VMenu.valid()
	local curItem = VMenu.curItem
	if (VMenu.items[curItem].type == "sub" or VMenu.items[curItem].type == "valsub") and VMenu.items[curItem].toMenu ~= nil then
		VMenu.menus.select = curItem
		VMenu.curItem = VMenu.menus.select
		PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
		scrollAdjust()
		Wait(200)
	elseif VMenu.items[curItem].type == "func" and VMenu.items[curItem].func ~= nil then
		local func = VMenu.items[curItem].func
		local params = VMenu.items[curItem].params
		PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
		MenuCallFunction(func, params)
		scrollAdjust()
		Wait(200)
	elseif (VMenu.items[VMenu.curItem].type == "color" or VMenu.items[VMenu.curItem].type == "var") and VMenu.items[curItem].func ~= nil then
		local func = VMenu.items[curItem].func
		local params = VMenu.items[curItem].params
		PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
		MenuCallFunction(func, params)
		scrollAdjust()
		Wait(200)
	elseif VMenu.items[curItem].type == "bool" and VMenu.items[curItem].varname ~= nil then
        local func = VMenu.items[curItem].func
		VOpts[VMenu.items[curItem].varname] = not VOpts[VMenu.items[curItem].varname]
		PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
        MenuCallFunction(func, VOpts[VMenu.items[curItem].varname])
		Wait(200)
	elseif VMenu.items[curItem].type == "choix" and VMenu.items[curItem].func ~= nil then
        local func = VMenu.items[curItem].func
        local varname = VMenu.items[VMenu.curItem].varname
		local choix = VOpts[varname]
		local params = VMenu.items[curItem].params
		PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
		MenuCallFunction(func, {choix,params})
		scrollAdjust()
		Wait(200)
    elseif VMenu.items[curItem].type == "num" and VMenu.items[curItem].func ~= nil then
        local func = VMenu.items[curItem].func
        local varname = VMenu.items[VMenu.curItem].varname
        local choix = VOpts[varname]
		PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
		MenuCallFunction(func, choix)
		scrollAdjust()
		Wait(200)
    end
    if UpdateSkin_valid then
        UpdateSkin_valid()
    end
end

function VMenu.back()
	if VMenu.menus.prev ~= "" and VMenu.menus.prev ~= nil then
        if VMenu.menus.prevarg ~= nil then
		  MenuCallFunction(VMenu.menus.prev,VMenu.menus.prevarg)   
        else
		  MenuCallFunction(VMenu.menus.prev,"")
        end
		scrollAdjust()
	end
    if UpdateSkin_back then
        UpdateSkin_back()
    end
end


local k_delay = 200 -- 1er Delay
local k_delay2 = 160 -- puis 2 3 et 4ème delay
local k_delay3 = 50 -- et si touche restée appuyée.



local jLastKey = 0
local jTimer = 0
function isJustPressedKey(key)
	if key ~= jLastKey and IsDisabledControlPressed(1, key) then -- Pas la même touche -> RESET
		jLastKey = key
		jTimer = GetGameTimer()
		return true

	elseif key == jLastKey and IsDisabledControlPressed(1, key) then -- Meme Touche
		if GetGameTimer() - jTimer < k_delay3 then
			while IsDisabledControlPressed(1, key) do
				Wait(1)
			end
			return false
		else
			jTimer = GetGameTimer()
			return true
		end

	end
	return false
end

local lastKey = 0
local timer = 0
local count = 0
local pass = false

function isPressedKey(key)
	if key ~= lastKey and IsDisabledControlPressed(1, key) then -- Pas la même touche -> RESET
		lastKey = key
		timer = GetGameTimer()
		count = 0
		pass = false
		return true

	elseif key == lastKey and IsDisabledControlPressed(1, key) then -- Meme Touche
		if pass then 										-- Accélération du défilement
			count = 0
			if GetGameTimer() - timer > k_delay3 and GetGameTimer() - timer < k_delay then
				timer = GetGameTimer()
				return true
			elseif GetGameTimer() - timer > k_delay then
				pass = false
				timer = GetGameTimer()
				return true
			end
			return false
		elseif GetGameTimer() - timer > k_delay + 100 then
			count = 0
			timer = GetGameTimer()
			return true
		elseif GetGameTimer() - timer > k_delay then
			count = 1
			timer = GetGameTimer()
			return true
		elseif GetGameTimer() - timer > k_delay2 and (count > 0 and count < 5) then
			count = count + 1
			timer = GetGameTimer()
			return true
		elseif count > 4 then
			pass = true
			return false
		end
		return false
	end
	return false
end

function VMenu.test_keys()
	Citizen.CreateThread(function()
		while true do
			Wait(5)
			if VMenu.visible then
				if isPressedKey(VMenu.keys[1]) then
					VMenu.k_up()
				elseif isPressedKey(VMenu.keys[2]) then
					VMenu.k_down()
                elseif isPressedKey(VMenu.keys[3]) then
					VMenu.k_left()
				elseif isPressedKey(VMenu.keys[4]) then
					VMenu.k_right()
				elseif IsControlJustPressed(1,VMenu.keys[5]) then
					VMenu.valid()
				elseif isJustPressedKey(VMenu.keys[6]) then
					VMenu.back()
				end
			end
		end
	end)
end

function VMenu.AddMenu(menu, header,r,g,b)
	VMenu.menus = {}
	VMenu.menus.name = menu
	VMenu.menus.header = header
	VMenu.menus.r = r
	VMenu.menus.g = g
	VMenu.menus.b = b
	VMenu.menus.prev = "" -- Default Value
	VMenu.menus.select = 1 -- Default Value
	VMenu.items = {} 	-- Table Creation / Reset
end

function VMenu.AddMenuName(menu, header,r,g,b,prenom)
	VMenu.menus = {}
	VMenu.menus.name = menu
	VMenu.menus.header = header
	VMenu.menus.r = r
	VMenu.menus.g = g
	VMenu.menus.b = b
	VMenu.menus.prenom = prenom
	VMenu.menus.prev = "" -- Default Value
	VMenu.menus.select = 1 -- Default Value
	VMenu.items = {} 	-- Table Creation / Reset
end

function VMenu.AddMenu(menu, header,r,g,b)
	VMenu.menus = {}
	VMenu.menus.name = menu
	VMenu.menus.header = header
	VMenu.menus.r = r
	VMenu.menus.g = g
	VMenu.menus.b = b
	VMenu.menus.prev = "" -- Default Value
	VMenu.menus.select = 1 -- Default Value
	VMenu.items = {} 	-- Table Creation / Reset
end

function VMenu.AddPrev(func,arg)
    VMenu.menus.prev = func
    if arg ~= nil then
        VMenu.menus.prevarg = arg
    end
end

function VMenu.EditHeader(menu)
    VMenu.menus.name = menu
end
    
function VMenu.ResetMenu(title)
	VMenu.items = {} 	-- Table Creation / Reset
    VMenu.menus.prev = ""
    if title ~= nil then
        VMenu.menus.name = title
    end
end

function VMenu.ResetCursor(ligne)
    VMenu.curVar = 0
    if ligne ~= nil then 
        VMenu.curItem = ligne
    else
	   VMenu.curItem = 1
    end
    VMenu.curColor = 1
	VMenu.scroll = 0
    VMenu.scrollX = 0
end
function VMenu.AddSep(item,func,params)
	local size = #VMenu.items
	VMenu.items[size+1] = {}
	VMenu.items[size+1].type = "separator"
	VMenu.items[size+1].name = item
	VMenu.items[size+1].desc = nil
	VMenu.items[size+1].func = func
	VMenu.items[size+1].params = params
end

function VMenu.EditSep(item,numero)
	local size = nil
    local count = 0
	for i = 1, #VMenu.items do
		if VMenu.items[i].type == "separator" then
            count = count + 1
            if count == numero then
                size = i
                break
            end
		end
	end
	VMenu.items[size] = {}
	VMenu.items[size].type = "separator"
	VMenu.items[size].name = tostring(item)
	VMenu.items[size].desc = nil
end

function VMenu.AddSub(item, toMenu, desc)
	local size = #VMenu.items
	VMenu.items[size+1] = {}
	VMenu.items[size+1].type = "sub"
	VMenu.items[size+1].name = item
	VMenu.items[size+1].toMenu = toMenu
	VMenu.items[size+1].desc = desc
end
function VMenu.AddFunc(item, func, params, desc, prix)
	local size = #VMenu.items
	VMenu.items[size+1] = {}
	VMenu.items[size+1].type = "func"
	VMenu.items[size+1].name = item
	VMenu.items[size+1].func = func
	VMenu.items[size+1].params = params
	VMenu.items[size+1].desc = desc
	VMenu.items[size+1].prix = prix
end

function VMenu.AddWeap(item,func,params,poids,hash,acc)
    local size = #VMenu.items
	VMenu.items[size+1] = {}
	VMenu.items[size+1].type = "func"
	VMenu.items[size+1].name = item
	VMenu.items[size+1].func = func
	VMenu.items[size+1].params = params
	VMenu.items[size+1].poids = tostring(poids)
	VMenu.items[size+1].hash = hash
	VMenu.items[size+1].acc = acc
end
    
function VMenu.EditFunc(item, func, params, desc)
	local size = nil
	for i = 1, #VMenu.items do
		if VMenu.items[i].name == item then
			size = i
			break
		end
	end
	VMenu.items[size] = {}
	VMenu.items[size].type = "func"
	VMenu.items[size].name = item
	VMenu.items[size].func = func
	VMenu.items[size].params = params
	VMenu.items[size].desc = desc
end

function VMenu.AddColor(item,func,params,prix,namecolor,color)
    local size = #VMenu.items
	VMenu.items[size+1] = {}
	VMenu.items[size+1].type = "color"
	VMenu.items[size+1].name = item
	VMenu.items[size+1].func = func
	VMenu.items[size+1].params = params
	VMenu.items[size+1].prix = prix    
	VMenu.items[size+1].namecolor = namecolor    
	VMenu.items[size+1].color = color    
end

function VMenu.AddVar(item,func,params,prix,namecolor,color)
    local size = #VMenu.items
	VMenu.items[size+1] = {}
	VMenu.items[size+1].type = "var"
	VMenu.items[size+1].name = item
	VMenu.items[size+1].func = func
	VMenu.items[size+1].params = params
	VMenu.items[size+1].prix = prix    
	VMenu.items[size+1].namecolor = namecolor   
	VMenu.items[size+1].color = color
end

function VMenu.AddPrix(item,func,params,prix,desc)
    local size = #VMenu.items
	VMenu.items[size+1] = {}
	VMenu.items[size+1].type = "func"
	VMenu.items[size+1].name = item
	VMenu.items[size+1].func = func
	VMenu.items[size+1].params = params
	VMenu.items[size+1].prix = prix 
	VMenu.items[size+1].desc = desc   
end

function VMenu.AddPoids(item,func,params,poids,desc)
    local size = #VMenu.items
	VMenu.items[size+1] = {}
	VMenu.items[size+1].type = "func"
	VMenu.items[size+1].name = item
	VMenu.items[size+1].func = func
	VMenu.items[size+1].params = params
	VMenu.items[size+1].poids = tostring(poids)
	VMenu.items[size+1].desc = desc
end
       
function VMenu.AddBool(item, func, varname, value, desc)
	local size = #VMenu.items
	VMenu.items[size+1] = {}
	VMenu.items[size+1].type = "bool"
    VMenu.items[size+1].func = func
	VMenu.items[size+1].name = item
	VMenu.items[size+1].varname = varname
	VMenu.items[size+1].desc = desc
	VOpts[varname] = value
end
function VMenu.AddNum( item, varname, valmin, valmax, desc,func,current)
	local size = #VMenu.items
	VMenu.items[size+1] = {}
	VMenu.items[size+1].type = "num"
	VMenu.items[size+1].name = item
	VMenu.items[size+1].varname = varname
	VMenu.items[size+1].desc = desc
	VMenu.items[size+1].func = func
	VOpts[varname] = {valmin, valmin, valmax}
end

function VMenu.AddChoix(item,func,varname,choix,params,desc,espacement)
    local size = #VMenu.items
	VMenu.items[size+1] = {}
	VMenu.items[size+1].type = "choix"
	VMenu.items[size+1].name = item
	VMenu.items[size+1].varname = varname
	VMenu.items[size+1].desc = desc
	VMenu.items[size+1].func = func
	VMenu.items[size+1].choix = choix
	VMenu.items[size+1].params = params
	VMenu.items[size+1].espacement = espacement
	VOpts[varname] = 1
end

function VMenu.AddNum1000(item, varname, valmin, valmax, desc)
	local size = #VMenu.items
	VMenu.items[size+1] = {}
	VMenu.items[size+1].type = "num1000"
	VMenu.items[size+1].name = item
	VMenu.items[size+1].varname = varname
	VMenu.items[size+1].desc = desc
	VOpts[varname] = {valmin, valmin, valmax}
end

function VMenu.AddNumCoef( item, varname, valmin, valmax, desc,lien,func,current)
	local size = #VMenu.items
	VMenu.items[size+1] = {}
	VMenu.items[size+1].type = "numcoef"
	VMenu.items[size+1].name = item
	VMenu.items[size+1].varname = varname
	VMenu.items[size+1].desc = desc
	VMenu.items[size+1].func = func
    VMenu.items[size+1].lien = lien
	VOpts[varname] = {valmin, valmin, valmax}
end

function VMenu.EditNum(item, varname, valmin, valmax, desc)
	VOpts[varname] = {valmin, valmin, valmax}
end

function VMenu.AddValSub(item, varname, value, toMenu, desc)
	local size = #VMenu.items
	VMenu.items[size+1] = {}
	VMenu.items[size+1].type = "valsub"
	VMenu.items[size+1].name = item
	VMenu.items[size+1].varname = varname
	VMenu.items[size+1].toMenu = toMenu
	VMenu.items[size+1].desc = desc
	VOpts[varname] = value
end


function getOpt(varname)
	if type(VOpts[varname]) == "boolean" or type(VOpts[varname]) == "number" then
		return VOpts[varname]
	end
	if type(VOpts[varname]) == "table" then
		return VOpts[varname][1]
	end
end

function setOpt(varname, value)
	if type(VOpts[varname]) == "table" and #VOpts[varname] == 3 then
		VOpts[varname][1] = value
	else
		VOpts[varname] = value
	end
end

function MenuCallFunction(fnc, arg)
    if _G[fnc] then
        _G[fnc](arg)
    end
end

RegisterNetEvent('VMenu.CloseAll')
AddEventHandler('VMenu.CloseAll', function()
   VMenu.visible = false 
end)

-------------------------------------------------------------------------------------
------------------------------- CREATION DU MENU ------------------------------------
-------------------------------------------------------------------------------------

VMenu.test_keys()