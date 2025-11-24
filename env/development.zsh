if [[ -d "$HOME/.cargo/bin" ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
  config_success "development" "Added Cargo to PATH"
fi

if [[ -d "$HOME/go/bin" ]]; then
  export PATH="$HOME/go/bin:$PATH"
  config_success "development" "Added Go binaries to PATH"
fi

if [[ -d "$HOME/.flutter/flutter/bin" ]]; then
  export PATH="$HOME/.flutter/flutter/bin:$PATH"
  export PATH="$HOME/.pub-cache/bin:$PATH"
  config_success "development" "Added Flutter to PATH"
fi

if [[ "$OSTYPE" == darwin* ]]; then
  if [[ -d "/Applications/Android Studio.app/Contents/MacOS" ]]; then
    export PATH="$PATH:/Applications/Android Studio.app/Contents/MacOS"
    config_success "development" "Added Android Studio to PATH (macOS)"
  fi
elif [[ -d "$HOME/Android/Sdk" ]]; then
  export ANDROID_HOME="$HOME/Android/Sdk"
  export PATH="$PATH:$ANDROID_HOME/emulator"
  export PATH="$PATH:$ANDROID_HOME/platform-tools"
  config_success "development" "Added Android SDK to PATH (Linux)"
fi

if [[ -n "$MAVEN_HOME" ]] && [[ -d "$MAVEN_HOME/bin" ]]; then
  export PATH="$MAVEN_HOME/bin:$PATH"
  config_success "development" "Added Maven to PATH"
fi

if command -v gradle >/dev/null 2>&1; then
  config_success "development" "Gradle is available"
elif [[ -d "/opt/homebrew/opt/gradle@7/bin" ]]; then
  export PATH="/opt/homebrew/opt/gradle@7/bin:$PATH"
  config_success "development" "Added Gradle 7 to PATH (Homebrew)"
fi
