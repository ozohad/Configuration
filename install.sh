#!/bin/bash

# Working Environment Configuration Installer
# Supports macOS and Linux

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Detect OS
detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="linux"
    else
        log_error "Unsupported operating system: $OSTYPE"
        exit 1
    fi
    log_info "Detected OS: $OS"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Backup existing configurations
backup_configs() {
    log_info "Backing up existing configurations..."
    
    local backup_dir="$HOME/.config/backup-$(date +%Y%m%d-%H%M%S)"
    mkdir -p "$backup_dir"
    
    # Backup Neovim config
    if [ -d "$HOME/.config/nvim" ]; then
        mv "$HOME/.config/nvim" "$backup_dir/nvim"
        log_success "Backed up Neovim config to $backup_dir/nvim"
    fi
    
    # Backup WezTerm config
    if [ -f "$HOME/.wezterm.lua" ]; then
        mv "$HOME/.wezterm.lua" "$backup_dir/wezterm.lua"
        log_success "Backed up WezTerm config to $backup_dir/wezterm.lua"
    fi
    
    # Backup Zsh config
    if [ -f "$HOME/.zshrc" ]; then
        mv "$HOME/.zshrc" "$backup_dir/zshrc"
        log_success "Backed up Zsh config to $backup_dir/zshrc"
    fi
    
    if [ "$(ls -A $backup_dir 2>/dev/null)" ]; then
        log_success "Configurations backed up to: $backup_dir"
    else
        rmdir "$backup_dir"
        log_info "No existing configurations found to backup"
    fi
}

# Install dependencies for macOS
install_macos_deps() {
    log_info "Installing macOS dependencies..."
    
    # Check if Homebrew is installed
    if ! command_exists brew; then
        log_info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    
    # Install packages
    local packages=("neovim" "git" "node" "llvm")
    local cask_packages=("wezterm" "font-meslo-lg-nerd-font")
    
    for package in "${packages[@]}"; do
        if ! brew list "$package" >/dev/null 2>&1; then
            log_info "Installing $package..."
            brew install "$package"
        else
            log_success "$package already installed"
        fi
    done
    
    for package in "${cask_packages[@]}"; do
        if ! brew list --cask "$package" >/dev/null 2>&1; then
            log_info "Installing $package..."
            brew install --cask "$package"
        else
            log_success "$package already installed"
        fi
    done
}

# Install dependencies for Linux
install_linux_deps() {
    log_info "Installing Linux dependencies..."
    
    # Detect package manager
    if command_exists apt; then
        install_linux_deps_apt
    elif command_exists yum; then
        install_linux_deps_yum
    elif command_exists dnf; then
        install_linux_deps_dnf
    elif command_exists pacman; then
        install_linux_deps_pacman
    else
        log_error "No supported package manager found (apt, yum, dnf, pacman)"
        exit 1
    fi
}

# Install dependencies using apt (Ubuntu/Debian)
install_linux_deps_apt() {
    log_info "Using apt package manager..."
    
    # Update package list
    sudo apt update
    
    # Install basic packages
    sudo apt install -y git curl build-essential unzip fontconfig
    
    # Install Neovim (latest)
    if ! command_exists nvim; then
        log_info "Installing Neovim..."
        curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
        sudo tar -C /opt -xzf nvim-linux64.tar.gz
        sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
        rm nvim-linux64.tar.gz
    else
        log_success "Neovim already installed"
    fi
    
    # Install Node.js
    if ! command_exists node; then
        log_info "Installing Node.js..."
        curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
        sudo apt-get install -y nodejs
    else
        log_success "Node.js already installed"
    fi
    
    # Install clangd
    if ! command_exists clangd; then
        log_info "Installing clangd..."
        sudo apt install -y clangd
    else
        log_success "clangd already installed"
    fi
    
    install_wezterm_linux
    install_nerd_font_linux
}

# Install dependencies using yum (RHEL/CentOS 7)
install_linux_deps_yum() {
    log_info "Using yum package manager..."
    sudo yum update -y
    sudo yum groupinstall -y "Development Tools"
    sudo yum install -y git curl unzip fontconfig
    install_neovim_linux
    install_nodejs_linux
    sudo yum install -y clang-tools-extra  # provides clangd
    install_wezterm_linux
    install_nerd_font_linux
}

# Install dependencies using dnf (Fedora/RHEL 8+)
install_linux_deps_dnf() {
    log_info "Using dnf package manager..."
    sudo dnf update -y
    sudo dnf groupinstall -y "Development Tools"
    sudo dnf install -y git curl unzip fontconfig
    install_neovim_linux
    install_nodejs_linux
    sudo dnf install -y clang-tools-extra  # provides clangd
    install_wezterm_linux
    install_nerd_font_linux
}

# Install dependencies using pacman (Arch Linux)
install_linux_deps_pacman() {
    log_info "Using pacman package manager..."
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm base-devel git curl unzip fontconfig
    sudo pacman -S --noconfirm neovim nodejs npm clang
    install_wezterm_linux
    install_nerd_font_linux
}

# Common Linux functions
install_neovim_linux() {
    if ! command_exists nvim; then
        log_info "Installing Neovim..."
        curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
        sudo tar -C /opt -xzf nvim-linux64.tar.gz
        sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
        rm nvim-linux64.tar.gz
    else
        log_success "Neovim already installed"
    fi
}

install_nodejs_linux() {
    if ! command_exists node; then
        log_info "Installing Node.js..."
        curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
        sudo apt-get install -y nodejs 2>/dev/null || {
            # Fallback for non-apt systems
            curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
            export NVM_DIR="$HOME/.nvm"
            [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
            nvm install --lts
        }
    else
        log_success "Node.js already installed"
    fi
}

install_wezterm_linux() {
    # Install WezTerm
    if ! command_exists wezterm; then
        log_info "Installing WezTerm..."
        curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg 2>/dev/null || {
            # Fallback: download AppImage
            log_info "Falling back to WezTerm AppImage..."
            mkdir -p "$HOME/.local/bin"
            curl -L https://github.com/wez/wezterm/releases/latest/download/WezTerm-*.AppImage -o "$HOME/.local/bin/wezterm"
            chmod +x "$HOME/.local/bin/wezterm"
        }
        
        # Try repository installation first
        echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list 2>/dev/null && {
            sudo apt update 2>/dev/null && sudo apt install -y wezterm 2>/dev/null
        } || log_info "Using AppImage fallback for WezTerm"
    else
        log_success "WezTerm already installed"
    fi
}

install_nerd_font_linux() {
    # Install Nerd Font
    local font_dir="$HOME/.local/share/fonts"
    if [ ! -f "$font_dir/MesloLGS NF Regular.ttf" ]; then
        log_info "Installing MesloLGS Nerd Font..."
        mkdir -p "$font_dir"
        curl -fsSL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Meslo.zip -o /tmp/Meslo.zip
        unzip -o /tmp/Meslo.zip -d "$font_dir"
        fc-cache -fv
        rm /tmp/Meslo.zip
    else
        log_success "MesloLGS Nerd Font already installed"
    fi
}

# Install configurations
install_configs() {
    log_info "Installing configurations..."
    
    # Create config directory
    mkdir -p "$HOME/.config"
    
    local config_errors=0
    
    # Install Neovim configuration
    if [ -d "nvim" ]; then
        cp -r nvim "$HOME/.config/"
        log_success "Installed Neovim configuration"
    else
        log_error "Neovim configuration directory not found"
        ((config_errors++))
    fi
    
    # Install WezTerm configuration
    if [ -f "wezterm.lua" ]; then
        cp "wezterm.lua" "$HOME/.wezterm.lua"
        log_success "Installed WezTerm configuration"
    else
        log_warning "WezTerm configuration file not found, skipping"
    fi
    
    # Install Zsh configuration (if exists)
    if [ -f "zshrc" ]; then
        cp "zshrc" "$HOME/.zshrc"
        log_success "Installed Zsh configuration"
    else
        log_info "No Zsh configuration found, skipping"
    fi
    
    # Only exit if critical configs are missing
    if [ $config_errors -gt 0 ]; then
        log_error "Critical configuration files missing"
        exit 1
    fi
}

# Install Neovim plugins
install_nvim_plugins() {
    log_info "Installing Neovim plugins..."
    
    # Create undodir
    mkdir -p "$HOME/.config/nvim/undodir"
    
    # Check if Neovim config exists
    if [ ! -d "$HOME/.config/nvim" ]; then
        log_warning "Neovim configuration not found, skipping plugin installation"
        return 0
    fi
    
    # Install plugins using Lazy.nvim
    if command_exists nvim; then
        log_info "This may take a few minutes..."
        nvim --headless -c "Lazy! sync" -c "qa" 2>/dev/null || {
            log_warning "Plugin installation encountered issues, but continuing..."
        }
        log_success "Neovim plugins installed"
    else
        log_error "Neovim not found, cannot install plugins"
        return 1
    fi
}

# Create session manager script for WezTerm
create_session_manager() {
    log_info "Creating WezTerm session manager..."
    
    local bin_dir="$HOME/.local/bin"
    mkdir -p "$bin_dir"
    
    cat > "$bin_dir/wezterm_session_manager" << 'EOF'
#!/bin/bash
# WezTerm Session Manager

RESURRECT_DIR="$HOME/.local/share/wezterm/resurrect"

if [ ! -d "$RESURRECT_DIR" ]; then
    echo "No sessions found"
    exit 0
fi

echo "Available sessions:"
echo "=================="

# List sessions
find "$RESURRECT_DIR" -name "*.json" -type f | while read -r file; do
    basename "$file" .json
done

echo ""
echo "To delete a session, enter its name (or press Enter to exit):"
read -r session_name

if [ -n "$session_name" ]; then
    session_file="$RESURRECT_DIR/$session_name.json"
    if [ -f "$session_file" ]; then
        rm "$session_file"
        echo "Deleted session: $session_name"
    else
        echo "Session not found: $session_name"
    fi
fi
EOF
    
    chmod +x "$bin_dir/wezterm_session_manager"
    log_success "Created WezTerm session manager at $bin_dir/wezterm_session_manager"
}

# Verify installation
verify_installation() {
    log_info "Verifying installation..."
    
    local errors=0
    
    # Check Neovim
    if command_exists nvim; then
        log_success "Neovim: $(nvim --version | head -n1)"
    else
        log_error "Neovim not found"
        ((errors++))
    fi
    
    # Check WezTerm
    if command_exists wezterm; then
        log_success "WezTerm: $(wezterm --version)"
    else
        log_error "WezTerm not found"
        ((errors++))
    fi
    
    # Check Node.js
    if command_exists node; then
        log_success "Node.js: $(node --version)"
    else
        log_error "Node.js not found"
        ((errors++))
    fi
    
    # Check clangd (from llvm package on macOS)
    if command_exists clangd || [ -f "/opt/homebrew/bin/clangd" ] || [ -f "/usr/local/bin/clangd" ]; then
        local clangd_version=$(clangd --version 2>/dev/null | head -n1 || echo "clangd (from llvm package)")
        log_success "clangd: $clangd_version"
    else
        log_error "clangd not found"
        ((errors++))
    fi
    
    # Check configurations
    if [ -d "$HOME/.config/nvim" ]; then
        log_success "Neovim configuration installed"
    else
        log_error "Neovim configuration not found"
        ((errors++))
    fi
    
    if [ -f "$HOME/.wezterm.lua" ]; then
        log_success "WezTerm configuration installed"
    else
        log_error "WezTerm configuration not found"
        ((errors++))
    fi
    
    if [ $errors -eq 0 ]; then
        log_success "Installation completed successfully!"
        echo ""
        echo "Next steps:"
        echo "1. Restart your terminal or run: source ~/.zshrc"
        echo "2. Open WezTerm to test the configuration"
        echo "3. Open Neovim to test plugins: nvim"
        echo "4. For C++ projects, generate compile_commands.json for LSP support"
        echo ""
        echo "Key shortcuts:"
        echo "- WezTerm leader key: \` (backtick)"
        echo "- Neovim leader key: Space"
        echo "- Tab navigation: Ctrl+Left/Right"
        echo ""
        echo "See README.md for complete documentation."
    else
        log_error "Installation completed with $errors errors"
        exit 1
    fi
}

# Main installation function
main() {
    echo "========================================"
    echo "Working Environment Configuration Setup"
    echo "========================================"
    echo ""
    
    detect_os
    
    # Ask for confirmation
    echo "This will install and configure:"
    echo "- Neovim with IDE features"
    echo "- WezTerm with custom configuration"
    echo "- Required dependencies"
    echo ""
    read -p "Continue? (y/N): " -n 1 -r
    echo ""
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        log_info "Installation cancelled"
        exit 0
    fi
    
    backup_configs
    
    # Install dependencies based on OS
    if [ "$OS" = "macos" ]; then
        install_macos_deps
    elif [ "$OS" = "linux" ]; then
        install_linux_deps
    fi
    
    install_configs
    create_session_manager
    install_nvim_plugins
    verify_installation
}

# Run main function
main "$@"