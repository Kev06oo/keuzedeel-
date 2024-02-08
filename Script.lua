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

    if aName == "slap3" then 
        CLS()
        createTextfield("You've angered the knight...")
        setBackground("Hollowroommad.jpg")
        createButton("exit", "die stupidly")
        playSound("punch.wav")
    end 

    if aName == "upStairs" then
        CLS()
        playSound("footstep.wav")
        setBackground("elderbug4k.png")
        if hasSpell and castSpellLib then
            createTextfield("Thank you for saving Hollownest!")
            createButton("exit", "You thank the elder and decide to retire")
            createButton("explore1", "decide to explore and get rid of all evil")
        else
            createTextfield("Who are you? Are you a ghost?! I haven't seen anyone in years...")
            createButton("entrance", "Ignore the delusional old man and continue")
            createButton("slap", "slap him")
            createButton("elderbug2", "I am a knight and im lost")
        end
    end

    if aName == "elderbug2" then
        CLS()
        setBackground("elderbug4k.png")
        createTextfield("Im sorry to hear that, we here in hollow nest have been living                       in terror because of a deadly virus that took controll of one of                     the most powerfull knights ever, could you help us little ghost?")
        createButton("entrance", "I will do my very best sir")
        createButton("exit", "no I dont wanna play this game")
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

    if aName == "explore1" then
        CLS()
        setBackground("crystalcave.png")
        createButton("entrance", "return to Dirtmouth")
        createButton("darkcave", "follow the sounds" )
        playSound("")
        createTextfield("you stumble upon a great crystal cave, you hear ominous sounds...")
    end

    if aName == "darkcave" then
        CLS()
        setBackground("blackscreen.jpg")
        createButton("darkcave2", "go left")
        createButton("explore1", "go right")
        playSound("")
        createTextfield("Its really dark, what way do you go?")
     end
     
    if aName == "darkcave2" then
        CLS()
        setBackground("blackscreen.jpg")
        createButton("explore1", "go left")
        createButton("2ndboss", "go right")
        playSound("")
        createTextfield("okay, what way do you go now?")
    end 

    if aName == "2ndboss" then
        CLS()
        setBackground("crystalboss.png")
        createButton("crystalbossawake", "wake up the bug")
        playSound("horrormusic.wav")
        createTextfield("its a sleeping crystal bug, he seems friendly")
    end 

    if aName == "crystalbossawake" then
        CLS()
        createTextfield("he woke up but does not seem happy about its awakening")
        setBackground("crystalbossangry.png")
        createButton("fireballfail", "use fireball")
        createButton("endingflee", "flee")
    end

    if aName == "fireballfail" then
        CLS()
        setBackground("crystalbossattack.png")
        createTextfield("!!!")
        createButton("badendingflee", "FLEE!!!")
    end

    if aName == "crystalbossawake" then
        CLS()
        createTextfield("he woke up but does not seem happy about its awakening")
        setBackground("crystalbossangry.png")
        createButton("fireballfail", "use fireball")
        createButton("endingflee", "flee (might be smart)")
    end

    if aName == "endingflee" then
        CLS()
        createTextfield("you escape unharmed and live a full happy life")
        setBackground("happyending.png")
        playSound("happysong.wav")
        createButton("exit", "exit")
    end

    if aName == "badendingflee" then
        CLS()
        createTextfield("you try to run but fail and now fight till you inevidible death")
        createButton("exit", "die (bad)")
        setBackground("fighttodeath.png")
    end 

    if aName == "exit" then
        exitGame()
    end
end
