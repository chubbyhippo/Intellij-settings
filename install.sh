#!/usr/bin/env sh

# configs
for config_path in \
"$HOME"/.config/JetBrains/IdeaIC* \
"$HOME"/.config/JetBrains/IntelliJIdea* \
"$HOME"/Library/Application\ Support/JetBrains/IdeaIC* \
"$HOME"/Library/Application\ Support/JetBrains/IntelliJIdea* \
"$HOME"/AppData/Roaming/JetBrains/IdeaIC* \
"$HOME"/AppData/Roaming/JetBrains/IntelliJIdea*

do
  echo "$config_path"
  if [ -d "$config_path" ]; then
    # Install templates
    mkdir -p "$config_path/templates"
    cp -frv "config/templates"/* "$config_path/templates"
  fi
done

# plugins
cmd=idea
if uname | grep -q "^MINGW"; then
  cmd="$HOME"/AppData/Local/JetBrains/Toolbox/scripts/idea.cmd
fi

$cmd installPlugins \
"Builder Generator" \
org.asciidoctor.intellij.asciidoc \
krasa.CpuUsageIndicator \
de.endrullis.idea.postfixtemplates \
zielu.gittoolbox \
IdeaVIM \
indent-rainbow.indent-rainbow \
com.github.camork.fileExpander \
me.bechberger.jfrplugin \
org.jetbrains.jumpToLine \
com.intellij.kubernetes \
"Lombook Plugin" \
com.intellij.plugin.adernov.powershell \
izhangzhihao.rainbow.brackets.lite \
com.andrey4623.rainbowcsv \
com.fwdekker.randomness \
nl.bryanderidder.regexrenamefiles \
org.sonarlint.idea \
"String Manipulation" \
StringToolsPlugin \
eu.theblob42.idea.whichkey \
mobi.hsz.idea.gitignore
