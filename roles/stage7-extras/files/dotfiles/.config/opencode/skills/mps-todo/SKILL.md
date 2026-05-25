---
name: mps-todo
description: "Use when creating todos through mandatory user questioning: context search vs brainstorm → technical details → verification phase confirmation. Trigger: 'mps todo workflow', 'user-driven todo creation', or 'todos with subtask precision'."
---

# MPS Todo Workflow Skill

**MANDATORY USER INTERACTION FLOW** — This skill *requires* the following sequence before creating any todo:

## 1. Context Acquisition Phase (ALWAYS START HERE)

```json
{
  "questions": [
    {
      "header": "Context Source",
      "question": "How should we gather context for this todo?",
      "options": [
        {
          "label": "Search current context",
          "description": "Scan open files/directory for relevant content"
        },
        {
          "label": "Search local directory",
          "description": "Use glob/grep on current directory"
        },
        {
          "label": "Start brainstorm session",
          "description": "Begin with custom requirements exploration"
        }
      ]
    }
  ]
}
```

## 2. Technical Specification Phase

After context selection, ask for technical details:

```json
{
  "questions": [
    {
      "header": "Technical Details",
      "question": "What precise technical actions are required?",
      "multiple": true,
      "options": [
        {
          "label": "Subtask breakdown",
          "description": "Require detailed subtask list with exact actions"
        },
        {
          "label": "Priority mapping",
          "description": "Assign high/medium/low to each subtask"
        },
        {
          "label": "Phase alignment",
          "description": "Map to MPS phases (discovery/planning/etc.)"
        }
      ]
    }
  ]
}
```

Every subtask MUST be precise enough that any developer can execute it without ambiguity.

## 3. Todo Construction Rules

Todos **MUST** follow this structure:

```json
{
  "todos": [
    {
      "content": "Subtask 1: [VERB] [OBJECT] with [PRECISION]",
      "status": "pending",
      "priority": "high|medium|low",
      "mps_phase": "discovery|planning|implementation|verification|archive",
      "validation": "Must contain exact file paths/commands"
    }
  ]
}
```

**Bad** (rejected):
```json
{
  "content": "Fix bugs"
}
```

**Good** (required):
```json
{
  "content": "Update ./src/config.ts: Replace 'timeout: 500' with 'timeout: ${MPS_TIMEOUT}' using env var"
}
```

## 4. Verification Phase Confirmation

```json
{
  "questions": [
    {
      "header": "Verification",
      "question": "Should we add a verification phase to this todo?",
      "options": [
        {
          "label": "Yes — add verification",
          "description": "Include verification subtasks"
        },
        {
          "label": "No — skip verification",
          "description": "Create without verification steps"
        }
      ]
    }
  ]
}
```

If "Yes", append verification subtasks with `"mps_phase": "verification"`.

## Enforcement Rules

1. **NO todo creation without completing all 4 phases**
2. **Subtasks must pass "Could a junior dev execute this?" test**
3. **Reject vague items** — every subtask must reference exact files, commands, or values
4. **Phase alignment required** — every subtask must map to a MPS phase
5. **`todowrite` is the final step** — collect all data first, then write todos once