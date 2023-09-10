local function garrison_healing()  
  if cm:is_new_game() then 
    
        local region_list = cm:model():world():region_manager():region_list();        
            for r = 0, region_list:num_items() - 1 do
            cm:callback(function()
                cm:heal_garrison(region_list:item_at(r):cqi());
        end,0.2)
    end;
  end;
end;
cm:add_first_tick_callback(function() garrison_healing() end);
