meta.name = "Many Moles"
meta.description = "Lots of moles, always, all levels."
meta.version = "WIP"
meta.author = "sheveksmath"

register_option_int("num_of_moles", "Number of moles spawned per enemy.", 5, 1,
                    20)

all_enemies = {
    ENT_TYPE.MONS_SNAKE, ENT_TYPE.MONS_SPIDER, ENT_TYPE.MONS_HANGSPIDER,
    ENT_TYPE.MONS_BAT, ENT_TYPE.MONS_CAVEMAN, ENT_TYPE.MONS_SKELETON,
    ENT_TYPE.MONS_SCORPION, ENT_TYPE.MONS_HORNEDLIZARD, ENT_TYPE.MONS_MANTRAP,
    ENT_TYPE.MONS_TIKIMAN, ENT_TYPE.MONS_WITCHDOCTOR, ENT_TYPE.MONS_MOSQUITO,
    ENT_TYPE.MONS_MONKEY, ENT_TYPE.MONS_MAGMAMAN, ENT_TYPE.MONS_ROBOT,
    ENT_TYPE.MONS_FIREBUG, ENT_TYPE.MONS_FIREBUG_UNCHAINED, ENT_TYPE.MONS_IMP,
    ENT_TYPE.MONS_VAMPIRE, ENT_TYPE.MONS_VLAD, ENT_TYPE.MONS_CROCMAN,
    ENT_TYPE.MONS_COBRA, ENT_TYPE.MONS_SORCERESS, ENT_TYPE.MONS_CATMUMMY,
    ENT_TYPE.MONS_NECROMANCER, ENT_TYPE.MONS_JIANGSHI,
    ENT_TYPE.MONS_FEMALE_JIANGSHI, ENT_TYPE.MONS_FISH, ENT_TYPE.MONS_OCTOPUS,
    ENT_TYPE.MONS_HERMITCRAB, ENT_TYPE.MONS_UFO, ENT_TYPE.MONS_ALIEN,
    ENT_TYPE.MONS_YETI, ENT_TYPE.MONS_PROTOSHOPKEEPER,
    ENT_TYPE.MONS_SHOPKEEPERCLONE, ENT_TYPE.MONS_OLMITE_HELMET,
    ENT_TYPE.MONS_OLMITE_BODYARMORED, ENT_TYPE.MONS_OLMITE_NAKED,
    ENT_TYPE.MONS_BEE, ENT_TYPE.MONS_AMMIT, ENT_TYPE.MONS_FROG,
    ENT_TYPE.MONS_FIREFROG, ENT_TYPE.MONS_GRUB, ENT_TYPE.MONS_JUMPDOG,
    ENT_TYPE.MONS_EGGPLANT_MINISTER, ENT_TYPE.MONS_LEPRECHAUN
}

function create_mole(x, y)
    spawn_entity(ENT_TYPE.MONS_MOLE, x, y, LAYER.FRONT, 0, 0)
end

set_callback(function()

    enemy_uids = get_entities_by_type(all_enemies)

    -- reuse locations of all enemies when spawning moles
    for index, enemy_uid in ipairs(enemy_uids) do
        x, y, layer = get_position(enemy_uid)
        for i = 1, options.num_of_moles do create_mole(x, y) end
    end

end, ON.LEVEL)
