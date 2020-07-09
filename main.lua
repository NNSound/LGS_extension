
Skills = {skill = "", backSkill = "", petKeys = {}, waitSleep = 500}
function Skills:new(skill, backSkill, petKeys, waitSleep)
    local o = {};
    setmetatable(o, self);
    o.skill = skill;
    o.backSkill = backSkill;
    o.petKeys = petKeys;
    o.waitSleep = waitSleep;
    return o;
end

CurrentIds = {currentSkillIndex = 1, currentPetIndex = 1, closeStatus = true}

function CurrentIds:new(currentSkillIndex, currentPetIndex)
    local o = {};
    setmetatable(o, self);
    o.currentSkillIndex = currentSkillIndex;
    o.currentPetIndex = currentPetIndex;
    return o
end

-- 蒼龍
G5CurrentIds = CurrentIds:new(1, 1)
G5Skills = {
    Skills:new("7", "num0", {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "minus", "equal"}, 500)
}

-- 骨龍
G6CurrentIds = CurrentIds:new(1, 1)
G6Skills = {
    Skills:new("6", "num0", {"1", "2", "3", "4","5"}, 500)
}


function OnEvent(event, arg)

    if event == "MOUSE_BUTTON_PRESSED" and arg == 4 then -- 'backward' (X1) mouse button
    end
    if event == "MOUSE_BUTTON_RELEASED" and arg == 4 then -- 'backward' (X1) mouse button
        OutputLogMessage("in MOUSE_BUTTON_RELEASED 4 ");
        PressAndReleaseKey("5");
        PressAndReleaseKey("2");
        PressAndReleaseKey("3");
        PressAndReleaseKey("1");
    end

    if event == "MOUSE_BUTTON_PRESSED" and arg == 5 then -- 'forward' (X2) mouse button
    end
    if event == "MOUSE_BUTTON_RELEASED" and arg == 5 then -- 'forward' (X2) mouse button
        OutputLogMessage("in MOUSE_BUTTON_RELEASED 5 ");
        G5CurrentIds = DragonCallNext(G5CurrentIds, G5Skills, true, true)
    end

    if event == "MOUSE_BUTTON_PRESSED" and arg == 6 then
    end
    if event == "MOUSE_BUTTON_RELEASED" and arg == 6 then
        OutputLogMessage("in MOUSE_BUTTON_RELEASED 6 \n");
        G6CurrentIds=GQ(G6CurrentIds,G6Skills,true)
    end

    if event == "MOUSE_BUTTON_PRESSED" and arg == 7 then
    end
    if event == "MOUSE_BUTTON_RELEASED" and arg == 7 then
        OutputLogMessage("in MOUSE_BUTTON_RELEASED 7 \n");
        PressKey("lalt");
        PressAndReleaseKey("num7");
        ReleaseKey("lalt");

        PressKey("lctrl");
        PressAndReleaseKey("num2");
        ReleaseKey("lctrl");

        PressKey("lctrl");
        PressAndReleaseKey("num1");
        ReleaseKey("lctrl");

    end

    if event == "MOUSE_BUTTON_PRESSED" and arg == 8 then
    end
    if event == "MOUSE_BUTTON_RELEASED" and arg == 8 then
    end

    if event == "MOUSE_BUTTON_PRESSED" and arg == 9 then
    end
    if event == "MOUSE_BUTTON_RELEASED" and arg == 9 then
    end

    if event == "MOUSE_BUTTON_PRESSED" and arg == 10 then
    end
    if event == "MOUSE_BUTTON_RELEASED" and arg == 10 then
    end

    if event == "MOUSE_BUTTON_PRESSED" and arg == 11 then
    end
    if event == "MOUSE_BUTTON_RELEASED" and arg == 11 then
    end

    ----------------------------------------------------------------------
    -- KEYBOARD AND LEFT-HANDED-CONTROLLER EVENTS PROCESSING
    -- (you need it if you have any Logitech device with keys G1, G2, ...)
    ----------------------------------------------------------------------
    if event == "G_PRESSED" and arg == 1 then -- G1 key
    end
    if event == "G_RELEASED" and arg == 1 then -- G1 key
    end

    if event == "G_PRESSED" and arg == 12 then -- G12 key
    end
    if event == "G_RELEASED" and arg == 12 then -- G12 key
    end

    if event == "M_PRESSED" and arg == 1 then -- M1 key
    end
    if event == "M_RELEASED" and arg == 1 then -- M1 key
    end

    if event == "M_PRESSED" and arg == 2 then -- M2 key
    end
    if event == "M_RELEASED" and arg == 2 then -- M2 key
    end

    if event == "M_PRESSED" and arg == 3 then -- M3 key
    end
    if event == "M_RELEASED" and arg == 3 then -- M3 key
    end
end


function DragonCallNext(currentIds, skills, isChange2, isColse)

    OutputLogMessage("skillslength = %s \n", table.getn(skills));
    OutputLogMessage("currentSkillIndex = %s \n", currentIds.currentSkillIndex);

    if (currentIds.closeStatus == false) then
        PressAndReleaseKey(skill.backSkill);
        currentIds.closeStatus = true
    end

    local skill = skills[currentIds.currentSkillIndex];
    local pets = skill.petKeys;
    local pet = pets[currentIds.currentPetIndex];
    OutputLogMessage("pet = %s \n", (currentIds.currentPetIndex));

    PressAndReleaseKey(skill.backSkill);
    Sleep(100)

    if (isChange2 == true) then
        PressKey("lctrl");
        PressAndReleaseKey("tilde");
        ReleaseKey("lctrl");
    end

    PressKey("lctrl");
    PressAndReleaseKey(skill.skill);
    ReleaseKey("lctrl");

    PressAndReleaseKey(pet);
    Sleep(100)

    -- PressKey("lctrl");
    -- PressKey("1");
    -- ReleaseKey("lalt");
    -- ReleaseKey("1");

    if (isChange2 == true) then
        PressKey("lctrl");
        PressAndReleaseKey("tilde");
        ReleaseKey("lctrl");
    end

    if (isColse == true) then
        PressAndReleaseKey(skill.backSkill);
    else
        currentIds.closeStatus = false
    end

    if (currentIds.currentPetIndex < table.getn(pets)) then
        currentIds.currentPetIndex = currentIds.currentPetIndex + 1;
    else
        currentIds.currentSkillIndex = currentIds.currentSkillIndex + 1;
        currentIds.currentPetIndex = 1;
    end
    if (currentIds.currentSkillIndex > table.getn(skills)) then
        currentIds.currentSkillIndex = 1;
        currentIds.currentPetIndex = 1;
    end

    return currentIds;
end

function GQ(currentIds, skills, isChange2)

    OutputLogMessage("skillslength = %s \n", table.getn(skills));
    OutputLogMessage("currentSkillIndex = %s \n", currentIds.currentSkillIndex);


    local skill = skills[currentIds.currentSkillIndex];
    local pets = skill.petKeys;
    local pet = pets[currentIds.currentPetIndex];
    OutputLogMessage("pet = %s \n", (currentIds.currentPetIndex));

    if (isChange2 == true) then
        PressKey("lctrl");
        PressAndReleaseKey("tilde");
        ReleaseKey("lctrl");
    end

    PressKey("lctrl");
    PressAndReleaseKey(skill.skill);
    ReleaseKey("lctrl");

    PressAndReleaseKey(pet);

    Sleep(500)

    PressAndReleaseKey("equal");

    if (isChange2 == true) then
        PressKey("lctrl");
        PressAndReleaseKey("tilde");
        ReleaseKey("lctrl");
    end

    Sleep(800);

    PressAndReleaseKey(skill.backSkill);
    Sleep(100)

    if (currentIds.currentPetIndex < table.getn(pets)) then
        currentIds.currentPetIndex = currentIds.currentPetIndex + 1;
    else
        currentIds.currentSkillIndex = currentIds.currentSkillIndex + 1;
        currentIds.currentPetIndex = 1;
    end
    if (currentIds.currentSkillIndex > table.getn(skills)) then
        currentIds.currentSkillIndex = 1;
        currentIds.currentPetIndex = 1;
    end

    return currentIds;
end
