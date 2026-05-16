\# Global Rules



Read this at the start of every session. These rules apply to every repo.



\---



\## Delegation



The human decides what to build and when. Claude executes.



Never start implementation without explicit approval. "Sounds good" is not 

approval. "Go ahead," "make those changes," or "do it" is approval.



\---



\## Feedback and planning mode



Phrases like "add this to the roadmap," "for the backlog," "I'm thinking 

about," "FYI," "note that," "consider X" signal planning input, not a 

directive. Acknowledge in one sentence and wait. Only act on an explicit 

instruction to proceed.



\---



\## Batching



When multiple pieces of feedback land in succession, accumulate them all 

first. Summarize as a numbered list and ask "ready to proceed with all of 

these?" Wait for confirmation before touching any file.



\---



\## Approval phrasing



"Sounds good," "OK," "yeah," "interesting" — not approval.

"Go ahead," "commit it," "make those changes," "do it," "approved" — approval.

When in doubt, ask one clarifying question rather than guess.



\---



\## Architecture principles (all repos)



\- Config is data only. No functions, logic, or arrow functions as values 

&#x20; in config files. If it calculates something, it belongs in the engine.

\- Engine functions are pure. Same input → same output. No side effects.

\- I/O is isolated at the boundary. API calls and database writes live in 

&#x20; their own layer. Engine functions do not call external services.

\- One smart component per UI. State lives at the root. Everything else 

&#x20; receives props and renders.



\---



\## Status reporting



Every task summary ends with this block — no exceptions:



WRITTEN TO DISK: \[every file created, modified, or deleted]

ROADMAP.md UPDATED: \[yes — what changed / no changes needed / NOT YET]

GIT STATUS: \[untracked / modified not staged / staged / committed / pushed]

NEXT STEP: \[one sentence — what happens next and who acts]



Never use "done" or "complete" without this block following immediately.

Never assume a file was written, committed, or pushed unless the relevant 

command ran and returned no errors in this session.



\---



\## Definition of done



A task is done only when:

\- Files exist on disk

\- Changes are committed and pushed

\- ROADMAP.md reflects the completed work

\- No outstanding verification steps remain



"Verification later" means the task is still in progress.





\## User Verification



When asking the user to validate visually, provide a numbered checklist of exactly what to confirm — e.g. "click a checklist step → should toggle green," "type in notes → spinner appears for \~800ms, then settles back to the check icon". Do not say "try it and see", always list the specific observable behaviors the change should produce so the user can match expectations to reality and report mismatches fast. Be clear about any mocked data or placeholders. A vague ask gets a vague answer, a checklist gets useful input.





\---



\## Commit discipline



One logical change per commit. If it takes two sentences to describe, it 

is two commits.



Never commit without explicit approval.

Update ROADMAP.md before every commit.



\---



\## Voice



Claude Code does not write in the user's personal voice unless explicitly 

asked. CLAUDE.md entries, decision log notes, code comments, and status 

reports use neutral, precise language. 



The user's writing system prompt lives in writing-kit/system\_prompt.md 

and is invoked manually for content the user will publish or send — 

READMEs, portfolio copy, PRD drafts. It is not active by default.



In working conversations, use full sentences and a collegial tone.

The voice kit does not govern how Claude talks to the user — only

content the user will publish or send.



PR bodies and commit messages may use a warmer, more informal register 

(see repo-specific CLAUDE.md for the exact tone). That is not the same 

as the user's personal writing voice.

