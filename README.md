# Skills — Segundo Cérebro

Coleção de skills para o [Claude Code](https://claude.ai/code), criadas para automatizar e organizar fluxos de trabalho pessoais.

## Skills disponíveis

### `segundo-cerebro-tech-lead`
Monta um vault [Obsidian](https://obsidian.md) no estilo "segundo cérebro" para tech leads e gestores de squad que acompanham muitos assuntos em paralelo (incidentes, features, pedidos, dependências).

**O que cria:**
- Estrutura de pastas baseada no método PARA adaptado (`00-Inbox`, `01-Daily`, `02-Assuntos`, `03-Areas`, `04-Resources`, `05-Archive`)
- Templates prontos para daily notes, assuntos e áreas
- Painel de Assuntos manual por prioridade/status
- Filtros salvos via Bookmarks do Obsidian (sem precisar de plugins da comunidade)
- Script de setup que aplica tudo em qualquer vault novo ou existente

**Como usar:**
```bash
./scripts/setup_vault.sh /caminho/para/o/vault
```

**Filosofia:** rotina em 2x 20min por dia (manhã + fim do dia), captura rápida durante o dia, sem depender de Dataview ou Templater.

## Como instalar uma skill no Claude Code

Copie o conteúdo do `SKILL.md` para o seu arquivo `~/.claude/skills/` ou siga a documentação oficial do Claude Code sobre skills customizadas.
