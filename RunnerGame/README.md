# Runner Game

## MVP

- [ ] Design
- [ ] touch screen functionality
- [ ] gameplay
- [ ] game starts
- [ ] user runs while avoiding objects
- [ ] if hit -- game ends
- [ ] score increases by 1/sec

## Stretch Goals
- [ ] gun fires
- [ ] random spawns for enemies
- [ ] save high scores


### AAU
* I want to be able to 
    1. tap screen to make character jump
    2. Endless runner style game where if user hits an object they lose
    3. have a score that increases by playing longer.

### DESIGN
- [ ] implement pixel art for:
    - [ ] background
    - [ ] runner
    - [ ] weapon
    - [ ] enemies
    - [ ] other objects
- [ ] other design
    - [ ] Scoreboard
    - [ ] pause/resume
    - [ ] game title screen (main menu)
        - [ ] start
    - [ ] game over screen
        - [ ] restart

### Functionality
- [ ] runner:
    - [ ] speed increases as game goes on (as score goes up)
    - [ ] score increases by 1/sec
    - [ ] on tap, character jumps X amount of feet
- [ ] background:
    - [ ] perpetual screen reload if end of pixels
    - [ ] objects can appear that runner must traverse
        - [ ] buildings
        - [ ] cars
        - [ ] etc.
- [ ] enemies:
    - [ ] spawn at random intervals just off screen and then appear as runner gets closer to them
    - [ ] if they collide with runner, game over.
    - [ ] if runner hits them with weapon
        - [ ] fall over and disappear
- [ ] Game Load Screen (main menu)
    - [ ] title
    - [ ] created by
    - [ ] tap to start game
- [ ] Game Over Screen
    - [ ] tap to reset
    - [ ] display score
    - [ ] button to go to main menu

### File Scructure
* Runner Game
    * Player
        * Components
            * PlayerSpawn
            * PlayerJump
            * PlayerMovement
            * Collisions?
            * Lives
        * Entities
            * Player
    * Enemies
        * Components
            * SpriteSpawn
            * SpriteMovement
            * Collision?
        * Entities
            * Enemies
            * Objects
    * GlobalComponents
        * Movement
        * Score
        * CollisionDetection
        * GameStart?
        * GameOver?
        * Pause?
    * AppDeligate
    * GameScene
    * Actions
    * launch.jpg
    * GameScene
    * GameViewController
    * Main.storyboard
    * assets
* Runner Game Tests
* Runner Game UI Tests
* Products
