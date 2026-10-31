## OpenSpec Workflow Rules
1. When running `/opsx:explore` or `/opsx:propose`, if the context requires intense technical research or third-party log analysis, proactively delegate the scoping to a `@general` subagent and pull only the summary back.
2. CRITICAL FOR APPLY: When executing `/opsx:apply` or fulfilling items in `tasks.md`, the primary agent MUST NOT write code directly in this session. Instead, sequentially delegate each major milestone or individual checklist item to a `@general` subagent. 
3. The subagent must handle the file manipulation, compilation, and testing, and only return the structural success status to the parent session.

## Interaction Style
- Answer using only code blocks, commands, or data tables whenever possible.
- Skip all conversational filler, "Here is the code," and summaries.
- If an explanation is necessary, use short, bulleted fragments.
