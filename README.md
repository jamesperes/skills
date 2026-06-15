# Segundo Cérebro — Tech Lead (Obsidian)

Estrutura de "segundo cérebro" em Obsidian para tech leads/gestores de squad
que acompanham muitos assuntos em paralelo (sustentação + projetos), pensada
pra uma rotina curta: ~20min de manhã e ~20min no fim do dia. Usa só plugins
core do Obsidian (sem Dataview/Templater).

Veja [SKILL.md](./SKILL.md) para a descrição completa do método, perguntas de
descoberta e passo a passo.

## Uso rápido

```bash
./scripts/setup_vault.sh /caminho/para/o/vault
```

Isso cria:

```
00-Inbox/
  Captura Rápida.md
01-Daily/
02-Assuntos/
  Painel-de-Assuntos.md
03-Areas/
04-Resources/
05-Archive/
_templates/
  Template-Daily.md
  Template-Assunto.md
  Template-Area.md
_attachments/
Início.md
.obsidian/  (daily notes + templates + bookmarks configurados)
```

Depois, abra o vault no Obsidian, personalize `03-Areas/` para o seu contexto
(usando `Template-Area.md`), atualize os filtros de domínio em
`.obsidian/bookmarks.json` e comece populando o `Painel-de-Assuntos.md` com o
que você já está acompanhando hoje.

## Rotina

- **Manhã (~20min):** abrir a daily de hoje, revisar o Painel de Assuntos,
  escolher 1-3 prioridades.
- **Durante o dia:** capturar tudo na [[Captura Rápida]] (`Ctrl/Cmd+O`), sem
  processar.
- **Fim do dia (~20min):** processar a Captura Rápida, atualizar
  status/próxima ação dos assuntos tocados, registrar carry-over e
  aprendizados, e esvaziar a Captura Rápida.
