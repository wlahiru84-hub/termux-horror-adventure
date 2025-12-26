# Termux Horror Adventure

A thrilling text-based horror adventure game designed specifically for the Termux environment. Explore dark dungeons, encounter mysterious creatures, and uncover the secrets lurking in the shadows—all from your terminal.

## 📖 About

Termux Horror Adventure is an immersive text-based horror game that brings spine-chilling storytelling to your mobile terminal. Navigate through atmospheric locations, make critical decisions, and face terrifying encounters in this choose-your-own-adventure style game.

## ✨ Features

- **Immersive Storytelling**: Rich narrative-driven gameplay with multiple branching paths and endings
- **Atmospheric Descriptions**: Detailed text descriptions that build suspense and dread
- **Multiple Scenarios**: Explore various horror themes and dark environments
- **Save/Load System**: Progress tracking with the ability to save and resume your adventure
- **Interactive Choices**: Make meaningful decisions that impact your story progression
- **Inventory Management**: Collect items and use them to solve puzzles and survive encounters
- **Character Progression**: Track your character's health, sanity, and abilities
- **Terminal-Native**: Optimized for Termux with full terminal compatibility
- **Lightweight**: Minimal dependencies for quick installation and execution

## 🚀 Installation

### Prerequisites

- Termux application installed on your Android device
- Python 3.7 or higher
- Git (optional, for cloning the repository)

### Quick Start

1. **Open Termux** and update your packages:
   ```bash
   pkg update && pkg upgrade
   ```

2. **Clone the repository**:
   ```bash
   git clone https://github.com/wlahiru84-hub/termux-horror-adventure.git
   cd termux-horror-adventure
   ```

   Or **download directly**:
   ```bash
   wget https://github.com/wlahiru84-hub/termux-horror-adventure/archive/main.zip
   unzip main.zip
   cd termux-horror-adventure-main
   ```

3. **Install dependencies** (if required):
   ```bash
   pip install -r requirements.txt
   ```

4. **Run the game**:
   ```bash
   python game.py
   ```

## 📝 Usage Guide

### Starting the Game

Simply run the following command in your Termux terminal:

```bash
python game.py
```

### Game Controls

- **Text Input**: Type your choice number or command and press Enter
- **Navigation**: Follow the on-screen prompts to move through the story
- **Inventory**: Check your items and use them when needed
- **Status**: Monitor your health and sanity levels

### Example Gameplay

```
Welcome to the Horror Adventure...

You wake up in a dark, abandoned mansion. The air is cold and thick.
A faint sound of something moving echoes through the corridors.

What do you do?
1. Explore the basement
2. Search the library
3. Try to escape the mansion

Enter your choice: 1
```

### Save Progress

Your game progress is automatically saved. You can continue from where you left off by running the game again.

### Game Settings

Edit the `config.py` file (if available) to customize:
- Difficulty level
- Text speed
- Color preferences
- Audio settings

## 🎮 Game Features Explained

### Sanity System
Your character's mental state is affected by horrific encounters. Maintain your sanity through solving puzzles and finding safe locations.

### Inventory System
Collect items throughout your adventure to solve puzzles, open locked areas, or defend yourself against threats.

### Multiple Endings
Your choices determine your fate. Will you survive? Escape? Uncover the truth? There are multiple possible endings.

### Atmospheric Descriptions
Each location is vividly described to maximize immersion and create a truly frightening experience.

## 📂 Project Structure

```
termux-horror-adventure/
├── game.py              # Main game script
├── config.py            # Configuration settings
├── stories/             # Story files and narratives
├── classes/             # Game mechanics classes
├── requirements.txt     # Python dependencies
└── README.md           # This file
```

## 🐛 Troubleshooting

### Game won't start
- Ensure Python 3.7+ is installed: `python --version`
- Install required packages: `pip install -r requirements.txt`

### Text display issues
- Check your terminal colors: `echo $TERM`
- Try clearing the screen: `clear`
- Ensure terminal window is large enough for text display

### Game freezes
- Press `Ctrl+C` to exit
- Check for corrupted save files in the `.save/` directory
- Restart the game

## 🔧 Development

### Contributing

We welcome contributions! Feel free to:
- Report bugs
- Suggest new features
- Submit pull requests
- Add new story content

### Building from Source

To modify the game:

1. Clone the repository
2. Make your changes
3. Test thoroughly in Termux
4. Submit a pull request

## 📋 Requirements

- Python 3.7+
- Termux (Android)
- 10MB free storage space
- Terminal with color support (recommended)

## 📜 License

This project is licensed under the MIT License. See LICENSE file for details.

## 🙏 Credits

Created with passion for horror lovers and Termux enthusiasts.

Special thanks to:
- The Termux community
- All contributors and players

## 📧 Support

For issues, questions, or suggestions:
- Open an issue on GitHub
- Check the FAQ section
- Contact the maintainers

## 🎯 Roadmap

- [ ] Additional story chapters
- [ ] Multiplayer mode
- [ ] Sound effects support
- [ ] Advanced graphics mode
- [ ] Achievements system
- [ ] Difficulty levels
- [ ] Story customization

---

**Dare to enter the darkness? Download Termux Horror Adventure today and test your courage!**

*Last Updated: December 26, 2025*
