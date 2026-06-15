#!/usr/bin/env bash
# Cria a estrutura base de um "segundo cérebro" (padrão tech lead) em um vault Obsidian.
#
# Uso:
#   ./setup_vault.sh /caminho/para/o/vault
#
# Se o vault já existir (.obsidian já presente), o script só adiciona o que
# falta e habilita os plugins core necessários (daily-notes, templates).

set -euo pipefail

TARGET="${1:?Uso: setup_vault.sh <caminho-do-vault-obsidian>}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ASSETS="$SCRIPT_DIR/../assets"

mkdir -p "$TARGET"

# --- Estrutura de pastas -----------------------------------------------
mkdir -p \
  "$TARGET/00-Inbox" \
  "$TARGET/01-Daily" \
  "$TARGET/02-Assuntos" \
  "$TARGET/03-Areas" \
  "$TARGET/04-Resources" \
  "$TARGET/05-Archive" \
  "$TARGET/_templates" \
  "$TARGET/_attachments"

# --- Templates -----------------------------------------------------------
cp -n "$ASSETS/templates/Template-Daily.md"   "$TARGET/_templates/" || true
cp -n "$ASSETS/templates/Template-Assunto.md" "$TARGET/_templates/" || true

# --- Painel de Assuntos + Início + Captura Rápida -------------------------
cp -n "$ASSETS/Painel-de-Assuntos.md" "$TARGET/02-Assuntos/" || true
cp -n "$ASSETS/Início.md"             "$TARGET/Início.md"    || true
cp -n "$ASSETS/Captura Rápida.md"     "$TARGET/00-Inbox/"    || true

# --- Config do Obsidian ---------------------------------------------------
mkdir -p "$TARGET/.obsidian"
cp -n "$ASSETS/obsidian-config/daily-notes.json" "$TARGET/.obsidian/" || true
cp -n "$ASSETS/obsidian-config/templates.json"   "$TARGET/.obsidian/" || true

if [ -f "$TARGET/.obsidian/bookmarks.json" ]; then
  echo "Aviso: $TARGET/.obsidian/bookmarks.json já existe."
  echo "       Confira manualmente se quer mesclar os grupos de filtros de:"
  echo "       $ASSETS/obsidian-config/bookmarks.json"
else
  cp "$ASSETS/obsidian-config/bookmarks.json" "$TARGET/.obsidian/"
fi

if [ -f "$TARGET/.obsidian/app.json" ]; then
  echo "Aviso: $TARGET/.obsidian/app.json já existe."
  echo "       Confira manualmente se quer copiar as chaves de:"
  echo "       $ASSETS/obsidian-config/app.json"
else
  cp "$ASSETS/obsidian-config/app.json" "$TARGET/.obsidian/"
fi

# Habilita plugins core necessários (daily-notes, templates)
CORE="$TARGET/.obsidian/core-plugins.json"
if [ -f "$CORE" ] && command -v python3 >/dev/null 2>&1; then
  python3 - "$CORE" <<'PY'
import json, sys
path = sys.argv[1]
with open(path) as f:
    data = json.load(f)
data["daily-notes"] = True
data["templates"] = True
data["bookmarks"] = True
with open(path, "w") as f:
    json.dump(data, f, indent=2)
PY
elif [ ! -f "$CORE" ]; then
  cat > "$CORE" <<'JSON'
{
  "daily-notes": true,
  "templates": true,
  "bookmarks": true
}
JSON
fi

echo ""
echo "Estrutura criada em: $TARGET"
echo "Próximo passo: personalize 03-Areas/ e o Painel de Assuntos pro seu contexto"
echo "(veja SKILL.md, seção 'Perguntas de descoberta')."
