---
name: segundo-cerebro-tech-lead
description: Cria/organiza um "segundo cérebro" em Obsidian para tech leads (ou papéis similares) que lidam com muitos assuntos em paralelo — sustentação + projetos, várias squads/áreas dependendo deles, rotina apertada. Usa um PARA adaptado (Inbox, Daily, Assuntos, Areas, Resources, Archive), com daily notes (planejamento de manhã / revisão no fim do dia) e um Painel de Assuntos central. Funciona só com plugins core do Obsidian (sem Dataview/Templater). Use quando o usuário pedir para montar, organizar ou replicar um vault Obsidian de produtividade pessoal no estilo "segundo cérebro" para tech lead/gestão de squad.
---

# Segundo Cérebro — Tech Lead

## Quando usar
- Usuário quer um vault Obsidian pra organizar o dia a dia de tech lead/gestor
  de squad que acompanha muitos "assuntos" em paralelo (incidentes, pedidos de
  outras áreas, dependências, features).
- Usuário quer replicar esse padrão num vault novo ou existente.
- Usuário tem rotina curta e fixa pra usar o cofre (ex: 20min de manhã + 20min
  no fim do dia) e precisa de algo rápido de manter, sem depender de plugins
  da comunidade.

## Filosofia do sistema

PARA adaptado, com o conceito central de **"Assunto"** — qualquer item que o
tech lead precisa acompanhar (incidente, pedido de outro time, dependência,
feature, dúvida). Cada assunto = 1 nota com status/prioridade/domínio.

```
00-Inbox/        Captura Rápida.md (bloco de notas perpétuo do dia a dia)
01-Daily/        notas diárias (YYYY-MM-DD), planejamento + revisão
02-Assuntos/     1 nota por assunto + Painel-de-Assuntos.md (visão geral)
03-Areas/        áreas de responsabilidade contínuas (times, domínios, squad)
04-Resources/    referências, runbooks, docs técnicas
05-Archive/      assuntos/áreas encerrados
_templates/      Template-Daily.md, Template-Assunto.md
_attachments/    imagens/anexos
Início.md        home/índice do cofre
```

Sem Dataview/Templater: o "dashboard" é o `Painel-de-Assuntos.md`, mantido
manualmente (2 min por sessão), com tabelas por prioridade. Para achar
assuntos por domínio/status/prioridade, usa-se a busca nativa do Obsidian com
sintaxe de propriedade, ex: `["dominio": pagamento]`.

Filtros prontos via Bookmarks: `.obsidian/bookmarks.json` traz buscas
salvas agrupadas (por domínio, por status, por prioridade), acessíveis com um
clique no painel core de **Bookmarks**. Isso evita digitar a sintaxe de busca
toda vez — é a forma prática de "filtrar" os assuntos sem plugins extras.

Captura durante o dia: `00-Inbox/Captura Rápida.md` é um arquivo único e
perpétuo, aberto via `Ctrl/Cmd+O`. Durante o dia, qualquer coisa vai ali sem
pensar. No fim do dia (revisão), cada item é processado (vira assunto,
atualização de assunto existente, linha no Painel ou carry-over) e o arquivo
é esvaziado para o dia seguinte. A daily NÃO tem seção própria de captura —
ela só referencia e processa a Captura Rápida.

## Passo a passo

1. **Perguntas de descoberta** (se ainda não souber o contexto do usuário):
   - Time/squad: quantas pessoas, papéis (devs back/front, PM/PA/PD etc.)?
   - A quem ele reporta (coordenador, gerente etc.)?
   - Reuniões recorrentes (daily, 1:1, syncs) e dias/frequência?
   - Tipos de "assunto" recorrentes (incidente, feature, pedido, dependência...)?
   - Como chegam incidentes/chamados (board, painel interno, Teams...)?
   - Quais são as áreas/domínios/times que dependem dele ou dele depende
     (ex: outras squads, integrações específicas)?
   - Ferramenta de board atual (Jira, Azure DevOps, board interno) — o cofre
     complementa ou substitui?
   - O que ele quer ver de manhã (resumo, prioridades) e o que quer registrar
     no fim do dia?
   - Pode instalar plugins da comunidade (Dataview/Templater) ou só core?
     (Este pacote assume "só core"; se puder instalar plugins, considere
     sugerir Dataview pra automatizar o Painel de Assuntos.)

2. **Rodar o script de setup** apontando pra pasta do vault:
   ```bash
   ./scripts/setup_vault.sh /caminho/para/o/vault
   ```
   Isso cria a estrutura de pastas, copia os templates, o Painel de Assuntos,
   a nota Início e configura `.obsidian/daily-notes.json` +
   `.obsidian/templates.json` + `.obsidian/bookmarks.json` (formato
   `YYYY-MM-DD`, plugins core habilitados: daily-notes, templates, bookmarks).

3. **Customizar `03-Areas/`** com base nas respostas da descoberta: criar uma
   nota por área/domínio relevante (ex: cada integração, gestão do time,
   sustentação, squads externas que pedem coisas), usando
   `assets/templates/Template-Area.md`. Mantenha essas notas mínimas — sem
   explicação do que a área faz: só o nome, o valor de `dominio` e a busca
   pra filtrar os assuntos relacionados (`["dominio": <valor>]`). Se houver
   sub-divisões (ex: várias squads dentro do mesmo domínio), usar também
   `relacionado-a` no filtro.

   Também atualizar `.obsidian/bookmarks.json` (grupo "Filtrar por domínio"):
   trocar/adicionar um item de busca salva por domínio real do usuário,
   seguindo o formato `{"type": "search", "title": "<Nome>", "query":
   "[\"dominio\":<valor>]"}`.

4. **Popular o Painel de Assuntos** com os itens que o usuário já está
   acompanhando (se ele tiver uma lista solta, migrar pra notas individuais em
   `02-Assuntos/` usando `Template-Assunto.md`, numeradas `A001`, `A002`...).

5. **Criar uma daily de exemplo** (data de hoje) já preenchida, mostrando como
   usar as seções de manhã/reuniões/fim do dia (incluindo o processamento da
   Captura Rápida) — isso ajuda o usuário a entender o fluxo antes de começar
   a rotina sozinho.

6. Avisar o usuário sobre a rotina: de manhã revisar o Painel + definir
   prioridades na daily; no fim do dia atualizar status dos assuntos tocados +
   carry-over.

## Arquivos deste pacote

- `assets/templates/Template-Daily.md` — template de daily note
- `assets/templates/Template-Assunto.md` — template de nota de assunto (frontmatter: tipo, status, prioridade, domínio)
- `assets/templates/Template-Area.md` — template mínimo de nota de área (nome + domínio + filtro de assuntos)
- `assets/Painel-de-Assuntos.md` — dashboard manual por prioridade/status
- `assets/Início.md` — home/índice do cofre
- `assets/Captura Rápida.md` — bloco de notas perpétuo pra captura durante o dia (vai em `00-Inbox/`)
- `assets/obsidian-config/*.json` — config dos plugins core (daily notes, templates, app, bookmarks/filtros)
- `scripts/setup_vault.sh` — cria a estrutura num vault novo ou existente
