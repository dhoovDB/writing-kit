# Ad Hoc Stay

Runbook for recording a stay at the STR that isn't an Airbnb reservation (friends,
family, a direct booking). The stay shows on the STR Host Dashboard as a booking card
with an "Ad hoc" tag, the normal cleaner checklist and notes, and it closes the gap it
covers.

The request: $ARGUMENTS

---

## How to run the script

Every action goes through one script. Run it from the repo root so it finds `.env`:

```bash
cd /c/Projects/str-host-assistant && node --env-file=.env scripts/adhoc-stay.ts <subcommand>
```

| Subcommand | Use |
|---|---|
| `add --check-in YYYY-MM-DD --check-out YYYY-MM-DD --label "Name"` | Record a new stay |
| `list` | Show every stay, with ids |
| `update <id> [--check-in ...] [--check-out ...] [--label ...]` | Change a stay; keeps its checklist and notes |
| `delete <id>` | Remove a stay, with its checklist and notes |

Do not write to Supabase any other way.

Put the label in single quotes so the shell can't expand anything in it, and write an
apostrophe as `'\''`: `--label 'Pat O'\''Brien'`.

---

## Adding a stay

1. **Read the request.** You need a label, a check-in and a check-out. The label is
   the guests' names or a short description, as given.
2. **Resolve the dates to YYYY-MM-DD.** The last date given is the check-out day, not
   the last night: "the 3rd through the 10th" is check-in the 3rd, check-out the 10th,
   7 nights. Use the next upcoming occurrence when no year or month is given.
3. **Ask one question only if something is missing or ambiguous,** such as no dates, or
   dates that could be read two ways. Otherwise don't stop to confirm: running this
   command with the details is the instruction.
4. **Run `add`.**
5. **Report back** with what the script printed: label, dates, nights, and when it
   shows on the dashboard. Pass along any `WARNING` line unchanged.
6. **Remind the user to block the dates on Airbnb** if they haven't said they did. The
   script can't check this, and Airbnb can still sell unblocked nights.

An overlap warning doesn't undo the save. Tell the user what it overlaps and let them
decide whether to `update` or `delete`.

---

## Changing or removing a stay

1. Run `list` to find the id. If more than one stay could match, ask which.
2. For a change, run `update` with only the fields that changed.
3. For a removal, show the stay and **get a clear yes first**. It deletes the stay's
   checklist and notes for good, so this is the one step that always waits for approval.
   Past briefings keep their text, so the label can remain there.

---

## Rules

- **Guest names stay out of git.** `str-host-assistant` is a public repo. Labels belong
  in Supabase only, never in commits, roadmaps, tests, fixtures or docs.
- **If the script reports an error, report it as is.** Don't work around it with direct
  database writes.
- **The next day's briefing picks up the change,** because today's is cached. Say so if
  the user asks why today's briefing doesn't mention the stay.
