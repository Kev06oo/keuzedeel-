--[[
The following functions have been exposed to lua:
setBackground(string aPath) sets the background to the texture in the folder textures.
createButton(string area name which the player enters, string context); adds a button to the current screen
createTextfield(string context); adds a textfield to the top of the screen.
CLS(); clears the screen.
exitGame(); exits the game.
playSound(string path to sound)
]]--

entered = false
hasSpell = false
castSpellLib = false

function story(aName)
    if aName == "start" then
        playMusic("background.wav")
        setBackground("hollowstart.jpg")
        createTextfield("You awake, you don't recall anything besides falling and crashing in this ominous place...")
        createButton("exit", "I am a coward.")
        createButton("entrance", "continue through the dark misty cavern")
    end

    if aName == "entrance" then
        if not entered then
            playSound("footstep.wav")
            entered = true
        else
            playSound("footstep.wav")
        end
        CLS()
        setBackground("Dirtmouth.png")
        createTextfield("You've entered Dirtmouth.")
        createButton("leftHallway", "Go to the shop on your left")
        createButton("rightHallway", "Go explore the underground to your right")
        createButton("upStairs", "Talk to stranger")
    end

    if aName == "leftHallway" then
        playSound("footstep.wav")
        CLS()
        setBackground("slyshop.png")
        createTextfield("You stumble upon an ancient shop run by a little bug. Do you seek the strength to slay the hollow knight?")
        createButton("entrance", "Go back to Dirtmouth.")
        createButton("slap2", "slap him")
        if not hasSpell then
            createButton("searchBooks", "Purchase spell book")
        end
    end

    if aName == "slap2" then
        CLS()
        setBackground("slyshopslap.png")
        playSound("punch.wav")
        createTextfield("UGHAGHGHG!!!")
        createButton("entrance", "leave in guilt")
        if not hasSpell then
          createButton("searchBooks", "pay double for spell book because of abuse")
        end
    end

    if aName == "searchBooks" then
        CLS()
        playSound("pageFlip.wav")
        createTextfield("It seems you have learned a fireball spell")
        createButton("entrance", "You return back to Dirtmouth gaining confidence")
        hasSpell = true
    end

    if aName == "rightHallway" then
        CLS()
        playSound("footstep.wav")
        setBackground("UndergroundEntrance.png")
        if not castSpellLib then
            createTextfield("You enter the old underground city, you must be careful for it could be reeking of monsters...")
        end
        createButton("entrance", "You're a wuss and leave before getting in danger")
        if hasSpell and not castSpellLib then
            createButton("rightHallwaySpell", "Continue and explore")
        end
    end

    if aName == "rightHallwaySpell" then
        CLS()
        createTextfield("YOU ENCOUNTER THE HOLLOW KNIGHT!?")
        setBackground("Hollowroom.jpg")
        playSound("suspenseHK.wav")
        createButton("entrance", "Run like a coward")
        createButton("slap3", "slap The litteral god of hollownest himself")
        castSpellLib = true
        createButton("Hollowdeath", "USE FIREBALL SPELL")
    end

    if aName == "upStairs" then
        CLS()
        playSound("footstep.wav")
        setBackground("elderbug4k.png")
        if hasSpell and castSpellLib then
            createTextfield("Thank you for saving Hollownest!")
            createButton("exit", "You thank the elder and decide to retire")
        else
            createTextfield("Who are you? Are you a ghost?! I haven't seen anyone in years...")
            createButton("entrance", "Ignore the delusional old man and continue")
            createButton("slap", "slap him")
        end
    end

    if aName == "Hollowdeath" then
        CLS()
        setBackground("Hollowrip.png")
        playSound("cannonfire.wav")
        createTextfield("You beat the Hollow knight with a powerfull fireball")
        createButton("entrance", "Return to Dirtmouth")
        createButton("inspection","inspect the body")
    end
    
    if aName == "inspection" then
        CLS()
        setBackground("explosionHK.png")
        createTextfield("the body explodes...")
        createButton("exit", "accept fate and die")
        playSound("explosionsound.wav")
    end

    if aName == "slap" then
        CLS()
        createTextfield("OW!!!")
        setBackground("elderbugcrying.png")
        createButton("entrance", "leave")
        playSound("punch.wav")
    end

    if aName == "exit" then
        exitGame()
    end
end
